#!/usr/bin/env bash
# =============================================================================
# install.sh — Universal skill/agent installer for agent-skill-lab
#
# Supports: Antigravity (AGY), OpenCode, Claude Code, Codex, Cursor, Windsurf
#
# Run directly (interactive menu: type -> item -> target -> scope):
#   curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash
#
# Or with explicit flags (works the same piped or cloned locally):
#   curl -fsSL .../install.sh | bash -s -- --target opencode --agent thinking-partner --project
#
# Usage:
#   ./install.sh                              # interactive: pick type, item(s), target(s), scope
#   ./install.sh --target claude-code          # target set, still asks what to install (no default)
#   ./install.sh --skill idea-sparring         # install one skill only (skips agents/commands)
#   ./install.sh --agent thinking-partner      # install one agent only (skips skills)
#   ./install.sh --all --target claude-code    # explicit opt-in: install every skill and agent
#   ./install.sh --list                        # list available skills/agents
#   ./install.sh --global                      # install globally (default when unset)
#   ./install.sh --project                     # install into current project directory
#   ./install.sh --help                        # show this help
#
# There is no implicit "install everything" default — if you don't pass
# --skill/--agent/--all, the picker always asks what to install, and every
# picker requires an explicit choice (multi-select by number, e.g. "1,3").
# =============================================================================

set -euo pipefail

# ── Colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

# ── Helpers ──────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}→${RESET} $*"; }
success() { echo -e "${GREEN}✓${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET} $*"; }
error()   { echo -e "${RED}✗${RESET} $*"; }
header()  { echo -e "\n${BOLD}${BLUE}$*${RESET}"; }

# Captured before any command substitution runs. $$ stays pinned to this
# top-level process even from inside a `$(...)` subshell (unlike $BASHPID),
# so tty_read can reliably kill the *whole* script below, not just the
# subshell it happens to be running in.
SCRIPT_PID=$$

has_tty() { [[ -r /dev/tty ]] 2>/dev/null; }

# Reads a line into $REPLY from the real terminal, even when this script's own
# stdin is being consumed by a `curl | bash` pipe. Many of the interactive
# pickers below run inside `$(...)` (to capture their result), where a plain
# `exit` would only kill that subshell and let the outer script limp on with
# blank/unbound state — so on failure this kills the whole script via signal
# instead of relying on exit propagation.
tty_read() {
  if has_tty && read -rp "$1" REPLY < /dev/tty 2>/dev/null; then
    return 0
  fi
  error "No terminal available for interactive input."
  error "Re-run with explicit flags, e.g.: --target <cli> --skill|--agent <name> --global|--project"
  kill -TERM "$SCRIPT_PID" 2>/dev/null
  exit 1
}

# Prompts with $1, accepts one or more space/comma-separated numbers against
# the given list of items, and echoes the matching item names (space
# separated). Reprompts on anything invalid instead of falling back to a
# default — the caller always ends up with an explicit, deliberate selection.
multi_select() {
  local prompt="$1"; shift
  local -a items=("$@")
  local count=${#items[@]}
  while true; do
    tty_read "$prompt"
    local raw="${REPLY//,/ }"
    local -a picks=($raw)
    local -a chosen=()
    local ok=true
    if [[ ${#picks[@]} -eq 0 ]]; then
      ok=false
    fi
    for p in "${picks[@]:-}"; do
      if [[ "$p" =~ ^[0-9]+$ ]] && (( p >= 1 && p <= count )); then
        chosen+=("${items[$((p - 1))]}")
      else
        ok=false
        break
      fi
    done
    if $ok; then
      echo "${chosen[@]}"
      return
    fi
    warn "Enter one or more valid numbers (e.g. '1' or '1,3'), separated by spaces or commas." >&2
  done
}

copy_dir() {
  local src="$1" dst="$2"
  mkdir -p "$dst"
  cp -R "$src/." "$dst/"
  success "Copied $(basename "$src") → $dst"
}

# ── Repo source: local checkout or self-bootstrap (for curl | bash) ─────────
REPO_GIT_URL="https://github.com/suryaumapathy2812/agent-skill-lab.git"
REPO_TARBALL_URL="https://github.com/suryaumapathy2812/agent-skill-lab/archive/refs/heads/main.tar.gz"
BOOTSTRAP_TMP_DIR=""

resolve_repo_dir() {
  local src="${BASH_SOURCE[0]:-}"
  if [[ -n "$src" && -f "$src" ]]; then
    local dir
    dir="$(cd "$(dirname "$src")" && pwd)"
    if [[ -d "$dir/skills" && -d "$dir/agents" ]]; then
      REPO_DIR="$dir"
      return
    fi
  fi

  # Not a local checkout (e.g. piped via curl | bash) — fetch the repo.
  info "Fetching agent-skill-lab..."
  BOOTSTRAP_TMP_DIR="$(mktemp -d)"
  trap 'rm -rf "$BOOTSTRAP_TMP_DIR"' EXIT

  if command -v curl &>/dev/null && command -v tar &>/dev/null; then
    curl -fsSL "$REPO_TARBALL_URL" -o "$BOOTSTRAP_TMP_DIR/repo.tar.gz" || { error "Download failed."; exit 1; }
    tar -xzf "$BOOTSTRAP_TMP_DIR/repo.tar.gz" -C "$BOOTSTRAP_TMP_DIR" || { error "Extract failed."; exit 1; }
    REPO_DIR=$(find "$BOOTSTRAP_TMP_DIR" -maxdepth 1 -type d -name 'agent-skill-lab-*' | head -1)
  elif command -v git &>/dev/null; then
    git clone --depth 1 --quiet "$REPO_GIT_URL" "$BOOTSTRAP_TMP_DIR/repo" || { error "git clone failed."; exit 1; }
    REPO_DIR="$BOOTSTRAP_TMP_DIR/repo"
  else
    error "Need curl+tar, or git, to fetch the repo."
    exit 1
  fi

  [[ -n "$REPO_DIR" && -d "$REPO_DIR" ]] || { error "Could not resolve the downloaded repo directory."; exit 1; }
}

# ── Parse args ───────────────────────────────────────────────────────────────
TARGET_CLI=""
SKILL_FILTER=""
AGENT_FILTER=""
SCOPE=""               # "" = ask interactively when needed; else global|project
LIST_ONLY=false
INSTALL_ALL=false       # explicit opt-in for "install every skill and agent"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target|-t)    TARGET_CLI="$2";    shift 2 ;;
    --skill|-s)     SKILL_FILTER="$2";  shift 2 ;;
    --agent|-a)     AGENT_FILTER="$2";  shift 2 ;;
    --all)          INSTALL_ALL=true;   shift ;;
    --global|-g)    SCOPE="global";     shift ;;
    --project|-p)   SCOPE="project";    shift ;;
    --list|-l)      LIST_ONLY=true;     shift ;;
    --help|-h)
      cat <<'HELP'
install.sh — Universal skill/agent installer for agent-skill-lab

Supports: Antigravity (AGY), OpenCode, Claude Code, Codex, Cursor, Windsurf

Run directly (interactive menu: type -> item -> target -> scope):
  curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash

Or with explicit flags (works the same piped or cloned locally):
  curl -fsSL .../install.sh | bash -s -- --target opencode --agent thinking-partner --project

Usage:
  ./install.sh                              # interactive: pick type, item(s), target(s), scope
  ./install.sh --target claude-code          # target set, still asks what to install (no default)
  ./install.sh --skill idea-sparring         # install one skill only (skips agents/commands)
  ./install.sh --agent thinking-partner      # install one agent only (skips skills)
  ./install.sh --all --target claude-code    # explicit opt-in: install every skill and agent
  ./install.sh --list                        # list available skills/agents
  ./install.sh --global                      # install globally (default when unset)
  ./install.sh --project                     # install into current project directory
  ./install.sh --help                        # show this help

There is no implicit "install everything" default — if you don't pass
--skill/--agent/--all, the picker always asks what to install, and every
picker requires an explicit choice (multi-select by number, e.g. "1,3").
HELP
      exit 0 ;;
    *) error "Unknown option: $1"; exit 1 ;;
  esac
done

resolve_repo_dir

# ── List available skills/agents ─────────────────────────────────────────────
list_skills() {
  header "Available Skills"
  for skill_dir in "$REPO_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    desc=$(grep -m1 '^description:' "$skill_dir/SKILL.md" 2>/dev/null | sed 's/^description: //' | cut -c1-90)
    echo -e "  ${BOLD}${skill_name}${RESET}"
    [[ -n "$desc" ]] && echo -e "  ${YELLOW}$desc${RESET}"
    echo ""
  done

  header "Available Agents"
  for agent_file in "$REPO_DIR/agents"/*/agent.md; do
    [[ -f "$agent_file" ]] || continue
    agent_name=$(basename "$(dirname "$agent_file")")
    desc=$(grep -m1 '^description:' "$agent_file" 2>/dev/null | sed -E 's/^description: *"?//; s/"?$//' | cut -c1-90)
    echo -e "  ${BOLD}${agent_name}${RESET}"
    [[ -n "$desc" ]] && echo -e "  ${YELLOW}$desc${RESET}"
    echo ""
  done
}

if $LIST_ONLY; then list_skills; exit 0; fi

# ── Detect installed CLIs ────────────────────────────────────────────────────
ALL_CLIS=(antigravity opencode claude-code codex cursor windsurf)

detect_clis() {
  local found=()
  command -v agy        &>/dev/null && found+=("antigravity")
  command -v opencode   &>/dev/null && found+=("opencode")
  command -v claude     &>/dev/null && found+=("claude-code")
  command -v codex      &>/dev/null && found+=("codex")
  command -v cursor     &>/dev/null && found+=("cursor")
  # Windsurf doesn't expose a CLI binary by default; check for its config dir
  [[ -d "$HOME/.windsurf" ]] && found+=("windsurf")
  echo "${found[@]:-}"
}

# ── Install one skill into a path ────────────────────────────────────────────
install_skill() {
  local skill_name="$1" skills_dir="$2" cli="$3"
  local src="$REPO_DIR/skills/$skill_name"

  if [[ ! -d "$src" ]]; then
    error "Skill not found: $skill_name"; return 1
  fi

  case "$cli" in
    antigravity|opencode|claude-code)
      # These all use the SKILL.md convention natively
      copy_dir "$src" "$skills_dir/$skill_name"

      # modern-design has extra references that need to be bundled in
      if [[ "$skill_name" == "modern-design" ]]; then
        if [[ -d "$REPO_DIR/references/products" ]]; then
          mkdir -p "$skills_dir/$skill_name/references"
          cp -R "$REPO_DIR/references/products" "$skills_dir/$skill_name/references/"
          success "Bundled references/products → $skills_dir/$skill_name/references/"
        fi
        if [[ -d "$REPO_DIR/references/modern-design" ]]; then
          mkdir -p "$skills_dir/$skill_name/references"
          cp -R "$REPO_DIR/references/modern-design/." "$skills_dir/$skill_name/references/"
          success "Bundled references/modern-design → $skills_dir/$skill_name/references/"
        fi
      fi
      ;;

    codex)
      # Codex: concatenate SKILL.md content into AGENTS.md
      local agents_md="$4"
      local skill_content
      # Strip YAML frontmatter, keep body
      skill_content=$(awk '/^---/{p++; next} p==2{print}' "$src/SKILL.md")
      local skill_header="## Skill: $skill_name"

      if grep -qF "$skill_header" "$agents_md" 2>/dev/null; then
        warn "Skill '$skill_name' already present in $agents_md — skipping"
      else
        mkdir -p "$(dirname "$agents_md")"
        {
          echo ""
          echo "$skill_header"
          echo "$skill_content"
        } >> "$agents_md"
        success "Appended skill '$skill_name' → $agents_md"
      fi
      ;;

    cursor)
      # Cursor: create a .mdc file per skill
      mkdir -p "$skills_dir"
      local out_file="$skills_dir/${skill_name}.mdc"
      local skill_desc
      skill_desc=$(grep -m1 '^description:' "$src/SKILL.md" | sed 's/^description: //')
      local skill_body
      skill_body=$(awk '/^---/{p++; next} p==2{print}' "$src/SKILL.md")
      {
        echo "---"
        echo "description: \"${skill_desc}\""
        echo "alwaysApply: false"
        echo "---"
        echo ""
        echo "$skill_body"
      } > "$out_file"
      success "Created Cursor rule → $out_file"
      ;;

    windsurf)
      # Windsurf: create a .md file per skill
      mkdir -p "$skills_dir"
      local out_file="$skills_dir/${skill_name}.md"
      local skill_body
      skill_body=$(awk '/^---/{p++; next} p==2{print}' "$src/SKILL.md")
      {
        echo "# Skill: $skill_name"
        echo ""
        echo "$skill_body"
      } > "$out_file"
      success "Created Windsurf rule → $out_file"
      ;;
  esac
}

# ── Install agents (optionally filtered to a space-separated name list) ─────
install_agents() {
  local agents_dir="$1" cli="$2" agent_filter="${3:-}"
  [[ -z "$agents_dir" ]] && return 0

  case "$cli" in
    antigravity|opencode|claude-code)
      mkdir -p "$agents_dir"
      if [[ -n "$agent_filter" ]]; then
        for name in $agent_filter; do
          local f="$REPO_DIR/agents/${name}/agent.md"
          if [[ -f "$f" ]]; then
            cp "$f" "$agents_dir/${name}.md"
            success "Installed agent: ${name}.md → $agents_dir"
          else
            error "Agent not found: $name"
          fi
        done
      else
        for f in "$REPO_DIR/agents"/*/agent.md; do
          [[ -f "$f" ]] || continue
          local name
          name=$(basename "$(dirname "$f")")
          cp "$f" "$agents_dir/${name}.md"
          success "Installed agent: ${name}.md → $agents_dir"
        done
      fi
      ;;
    *)
      # Codex/Cursor/Windsurf don't have native agent files — skip
      ;;
  esac
}

# True if the agent filter implies commands should come along: either it's
# empty (installing all agents, e.g. via --all) or design-engineer — the only
# agent the bundled /design-* commands actually belong to — is among the
# space-separated names selected.
agent_filter_wants_commands() {
  local filter="$1"
  [[ -z "$filter" ]] && return 0
  local name
  for name in $filter; do
    [[ "$name" == "design-engineer" ]] && return 0
  done
  return 1
}

# ── Install commands ──────────────────────────────────────────────────────────
install_commands() {
  local commands_dir="$1" cli="$2"
  [[ -z "$commands_dir" ]] && return 0

  case "$cli" in
    opencode|claude-code)
      mkdir -p "$commands_dir"
      for f in "$REPO_DIR/commands"/*.md; do
        [[ -f "$f" ]] || continue
        cp "$f" "$commands_dir/"
        success "Installed command: $(basename "$f") → $commands_dir"
      done
      ;;
    *)
      ;;
  esac
}

# ── Interactive: what kind of thing to install ───────────────────────────────
interactive_select_type() {
  while true; do
    header "What do you want to install?" >&2
    echo "  [1] Skill" >&2
    echo "  [2] Agent" >&2
    echo "  [3] Both" >&2
    echo "" >&2
    tty_read "Choice [1-3]: "
    case "$REPLY" in
      1) echo "skill"; return ;;
      2) echo "agent"; return ;;
      3) echo "both";  return ;;
      *) warn "Enter 1, 2, or 3." >&2 ;;
    esac
  done
}

# ── Interactive: pick one or more skills (explicit — no "all" shortcut) ──────
interactive_select_skill() {
  header "Available Skills (pick one or more, e.g. 1 or 1,3)" >&2
  local i=1
  local -a names
  for skill_dir in "$REPO_DIR/skills"/*/; do
    local name desc
    name=$(basename "$skill_dir")
    desc=$(grep -m1 '^description:' "$skill_dir/SKILL.md" 2>/dev/null | sed 's/^description: //' | cut -c1-90)
    echo "  [$i] $name" >&2
    [[ -n "$desc" ]] && echo "      $desc" >&2
    names+=("$name")
    ((i++))
  done
  echo "" >&2
  multi_select "Choice(s): " "${names[@]}"
}

# ── Interactive: pick one or more agents (explicit — no "all" shortcut) ─────
interactive_select_agent() {
  header "Available Agents (pick one or more, e.g. 1 or 1,3)" >&2
  local i=1
  local -a names
  for agent_file in "$REPO_DIR/agents"/*/agent.md; do
    [[ -f "$agent_file" ]] || continue
    local name desc
    name=$(basename "$(dirname "$agent_file")")
    desc=$(grep -m1 '^description:' "$agent_file" 2>/dev/null | sed -E 's/^description: *"?//; s/"?$//' | cut -c1-90)
    echo "  [$i] $name" >&2
    [[ -n "$desc" ]] && echo "      $desc" >&2
    names+=("$name")
    ((i++))
  done
  echo "" >&2
  multi_select "Choice(s): " "${names[@]}"
}

# ── Interactive: pick one or more target CLIs (explicit — no "all" shortcut) ─
interactive_select_cli() {
  local detected
  detected=$(detect_clis)

  header "Target CLI (pick one or more, e.g. 1 or 1,3)" >&2
  local -a cli_list
  if [[ -n "$detected" ]]; then
    echo "Detected: $detected" >&2
    echo "" >&2
    local i=1
    for cli in $detected; do
      echo "  [$i] $cli" >&2
      cli_list+=("$cli")
      ((i++))
    done
    echo "" >&2
    multi_select "Choice(s): " "${cli_list[@]}"
  else
    warn "No supported CLIs auto-detected." >&2
    echo "Pick one or more manually:" >&2
    local i=1
    for cli in "${ALL_CLIS[@]}"; do
      echo "  [$i] $cli" >&2
      ((i++))
    done
    echo "" >&2
    multi_select "Choice(s): " "${ALL_CLIS[@]}"
  fi
}

# ── Interactive: install scope ───────────────────────────────────────────────
interactive_select_scope() {
  header "Install scope" >&2
  echo "  [1] Global (available in every project)" >&2
  echo "  [2] Project (this directory only)" >&2
  echo "" >&2
  tty_read "Choice [1-2]: "
  if [[ "$REPLY" == "2" ]]; then
    echo "project"
  else
    echo "global"
  fi
}

# ── Resolve paths per CLI (avoids fragile array splitting with empty strings) ─
resolve_paths() {
  local cli="$1" scope="$2"
  case "$cli" in
    antigravity)
      if [[ "$scope" == "global" ]]; then
        SKILLS_DIR="$HOME/.gemini/skills"
        AGENTS_DIR="$HOME/.gemini/config/agents"
        COMMANDS_DIR=""
        MEMORY_FILE=""
      else
        SKILLS_DIR=".agents/skills"
        AGENTS_DIR=".agents/agents"
        COMMANDS_DIR=""
        MEMORY_FILE=""
      fi ;;
    opencode)
      if [[ "$scope" == "global" ]]; then
        SKILLS_DIR="$HOME/.config/opencode/skills"
        AGENTS_DIR="$HOME/.config/opencode/agents"
        COMMANDS_DIR="$HOME/.config/opencode/commands"
        MEMORY_FILE=""
      else
        SKILLS_DIR=".opencode/skills"
        AGENTS_DIR=".opencode/agents"
        COMMANDS_DIR=".opencode/commands"
        MEMORY_FILE=""
      fi ;;
    claude-code)
      if [[ "$scope" == "global" ]]; then
        SKILLS_DIR="$HOME/.claude/skills"
        AGENTS_DIR="$HOME/.claude/agents"
        COMMANDS_DIR="$HOME/.claude/commands"
        MEMORY_FILE=""
      else
        SKILLS_DIR=".claude/skills"
        AGENTS_DIR=".claude/agents"
        COMMANDS_DIR=".claude/commands"
        MEMORY_FILE=""
      fi ;;
    codex)
      SKILLS_DIR=""
      AGENTS_DIR=""
      COMMANDS_DIR=""
      if [[ "$scope" == "global" ]]; then
        MEMORY_FILE="$HOME/.codex/AGENTS.md"
      else
        MEMORY_FILE="AGENTS.md"
      fi ;;
    cursor)
      SKILLS_DIR=".cursor/rules"
      AGENTS_DIR=""
      COMMANDS_DIR=""
      MEMORY_FILE="" ;;
    windsurf)
      SKILLS_DIR=".windsurf/rules"
      AGENTS_DIR=""
      COMMANDS_DIR=""
      MEMORY_FILE="" ;;
    *)
      error "Unknown CLI: $cli"; exit 1 ;;
  esac
}

# ── Main install routine ──────────────────────────────────────────────────────
run_install() {
  local cli="$1"
  header "Installing for: ${BOLD}$cli${RESET} (scope: $SCOPE)"

  resolve_paths "$cli" "$SCOPE"

  local do_skills=false do_agents=false
  case "$RESOURCE_TYPE" in
    skill) do_skills=true ;;
    agent) do_agents=true ;;
    both)  do_skills=true; do_agents=true ;;
  esac

  # ── Skills ────────────────────────────────────────────────────────────────
  if $do_skills && [[ -n "$SKILLS_DIR" || ( "$cli" == "codex" && -n "$MEMORY_FILE" ) ]]; then
    if [[ -n "$SKILL_FILTER" ]]; then
      for skill_name in $SKILL_FILTER; do
        info "Installing skill: $skill_name"
        install_skill "$skill_name" "$SKILLS_DIR" "$cli" "$MEMORY_FILE"
      done
    else
      info "Installing all skills (--all)..."
      for skill_dir in "$REPO_DIR/skills"/*/; do
        skill_name=$(basename "$skill_dir")
        install_skill "$skill_name" "$SKILLS_DIR" "$cli" "$MEMORY_FILE"
      done
    fi
  fi

  # ── Agents ────────────────────────────────────────────────────────────────
  if $do_agents && [[ -n "$AGENTS_DIR" ]]; then
    info "Installing agent(s)..."
    install_agents "$AGENTS_DIR" "$cli" "$AGENT_FILTER"
  fi

  # ── Commands (/design-* exist specifically to drive design-engineer) ───────
  # Install them whenever design-engineer is one of the selected agents (or
  # everything is being installed via --all), so that agent doesn't end up
  # half-wired. Skip them when installing unrelated agents on their own —
  # e.g. picking just thinking-partner shouldn't drag in design commands.
  if $do_agents && [[ -n "$COMMANDS_DIR" ]] && agent_filter_wants_commands "$AGENT_FILTER"; then
    info "Installing commands..."
    install_commands "$COMMANDS_DIR" "$cli"
  fi

  echo ""
  success "Done! Restart ${cli} to pick up the changes."
  echo ""
}

# ── Entry point ───────────────────────────────────────────────────────────────

# Resource type: derive from --skill/--agent if given. --all is the only way
# to get "install everything" — it's an explicit opt-in, not a default. If
# neither is given (and --all wasn't passed), always ask via the picker, even
# if --target was provided — a target alone doesn't imply "install everything".
if $INSTALL_ALL; then
  RESOURCE_TYPE="both"
elif [[ -n "$SKILL_FILTER" && -z "$AGENT_FILTER" ]]; then
  RESOURCE_TYPE="skill"
elif [[ -n "$AGENT_FILTER" && -z "$SKILL_FILTER" ]]; then
  RESOURCE_TYPE="agent"
elif [[ -n "$SKILL_FILTER" && -n "$AGENT_FILTER" ]]; then
  RESOURCE_TYPE="both"
else
  RESOURCE_TYPE=$(interactive_select_type)
  case "$RESOURCE_TYPE" in
    skill) SKILL_FILTER=$(interactive_select_skill) ;;
    agent) AGENT_FILTER=$(interactive_select_agent) ;;
    both)
      SKILL_FILTER=$(interactive_select_skill)
      AGENT_FILTER=$(interactive_select_agent)
      ;;
  esac
fi

if [[ -z "$TARGET_CLI" ]]; then
  selected_clis=$(interactive_select_cli)
else
  selected_clis="$TARGET_CLI"
fi

if [[ -z "$SCOPE" ]]; then
  if has_tty; then
    SCOPE=$(interactive_select_scope)
  else
    SCOPE="global"
  fi
fi

for cli in $selected_clis; do
  run_install "$cli"
done
