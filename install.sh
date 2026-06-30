#!/usr/bin/env bash
# =============================================================================
# install.sh — Universal skill/agent installer for agent-skill-lab
#
# Supports: Antigravity (AGY), OpenCode, Claude Code, Codex, Cursor, Windsurf
# Usage:
#   ./install.sh                        # interactive — detects installed CLIs
#   ./install.sh --target claude-code   # install for a specific CLI
#   ./install.sh --skill auto-iterate   # install one skill only
#   ./install.sh --list                 # list available skills/agents
#   ./install.sh --global               # install globally (default for most CLIs)
#   ./install.sh --project              # install into current project directory
#   ./install.sh --help                 # show this help
# =============================================================================

set -euo pipefail

# ── Colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

# ── Repo root (directory where this script lives) ────────────────────────────
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ── Parse args ───────────────────────────────────────────────────────────────
TARGET_CLI=""
SKILL_FILTER=""
SCOPE="global"        # global | project
LIST_ONLY=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target|-t)    TARGET_CLI="$2";    shift 2 ;;
    --skill|-s)     SKILL_FILTER="$2";  shift 2 ;;
    --global|-g)    SCOPE="global";     shift ;;
    --project|-p)   SCOPE="project";    shift ;;
    --list|-l)      LIST_ONLY=true;     shift ;;
    --help|-h)
      sed -n '3,11p' "$0" | sed 's/^# //'
      exit 0 ;;
    *) echo -e "${RED}Unknown option: $1${RESET}"; exit 1 ;;
  esac
done

# ── Helpers ──────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}→${RESET} $*"; }
success() { echo -e "${GREEN}✓${RESET} $*"; }
warn()    { echo -e "${YELLOW}⚠${RESET} $*"; }
error()   { echo -e "${RED}✗${RESET} $*"; }
header()  { echo -e "\n${BOLD}${BLUE}$*${RESET}"; }

copy_dir() {
  local src="$1" dst="$2"
  mkdir -p "$dst"
  cp -R "$src/." "$dst/"
  success "Copied $(basename "$src") → $dst"
}

copy_files() {
  local pattern="$1" dst="$2"
  mkdir -p "$dst"
  # shellcheck disable=SC2086
  cp $pattern "$dst/" 2>/dev/null && success "Copied files → $dst" || warn "No files matched: $pattern"
}

# ── List available skills/agents ─────────────────────────────────────────────
list_skills() {
  header "Available Skills"
  for skill_dir in "$REPO_DIR/skills"/*/; do
    skill_name=$(basename "$skill_dir")
    desc=$(grep -m1 '^description:' "$skill_dir/SKILL.md" 2>/dev/null | sed 's/^description: //' | cut -c1-80)
    echo -e "  ${BOLD}${skill_name}${RESET}"
    [[ -n "$desc" ]] && echo -e "  ${YELLOW}$desc${RESET}"
    echo ""
  done

  header "Available Agents"
  for agent_file in "$REPO_DIR/agents"/*.md; do
    [[ -f "$agent_file" ]] || continue
    echo -e "  ${BOLD}$(basename "$agent_file")${RESET}"
  done
  echo ""
}

if $LIST_ONLY; then list_skills; exit 0; fi

# ── Detect installed CLIs ────────────────────────────────────────────────────
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

# ── Install agents ────────────────────────────────────────────────────────────
install_agents() {
  local agents_dir="$1" cli="$2"
  [[ -z "$agents_dir" ]] && return 0

  case "$cli" in
    antigravity|opencode|claude-code)
      mkdir -p "$agents_dir"
      for f in "$REPO_DIR/agents"/*.md; do
        [[ -f "$f" && "$(basename "$f")" != ".gitkeep" ]] || continue
        cp "$f" "$agents_dir/"
        success "Installed agent: $(basename "$f") → $agents_dir"
      done
      ;;
    *)
      # Codex/Cursor/Windsurf don't have native agent files — skip
      ;;
  esac
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

# ── Interactive CLI selection ─────────────────────────────────────────────────
interactive_select_cli() {
  local detected
  detected=$(detect_clis)

  header "Detected AI coding CLIs"
  if [[ -z "$detected" ]]; then
    warn "No supported CLIs detected. Supported: antigravity, opencode, claude-code, codex, cursor, windsurf"
    echo ""
    echo "Supported CLI names for --target:"
    echo "  antigravity, opencode, claude-code, codex, cursor, windsurf"
    exit 1
  fi

  echo "Found: $detected"
  echo ""
  echo "Which CLI do you want to install for?"
  local i=1
  declare -a cli_list
  for cli in $detected; do
    echo "  [$i] $cli"
    cli_list+=("$cli")
    ((i++))
  done
  echo "  [a] all detected"
  echo ""
  read -rp "Choice: " choice

  if [[ "$choice" == "a" ]]; then
    echo "$detected"
  else
    echo "${cli_list[$((choice - 1))]}"
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

  # ── Skills ────────────────────────────────────────────────────────────────
  if [[ -n "$SKILLS_DIR" || ( "$cli" == "codex" && -n "$MEMORY_FILE" ) ]]; then
    if [[ -n "$SKILL_FILTER" ]]; then
      info "Installing skill: $SKILL_FILTER"
      install_skill "$SKILL_FILTER" "$SKILLS_DIR" "$cli" "$MEMORY_FILE"
    else
      info "Installing all skills..."
      for skill_dir in "$REPO_DIR/skills"/*/; do
        skill_name=$(basename "$skill_dir")
        install_skill "$skill_name" "$SKILLS_DIR" "$cli" "$MEMORY_FILE"
      done
    fi
  fi

  # ── Agents ────────────────────────────────────────────────────────────────
  if [[ -n "$AGENTS_DIR" && -z "$SKILL_FILTER" ]]; then
    info "Installing agents..."
    install_agents "$AGENTS_DIR" "$cli"
  fi

  # ── Commands ──────────────────────────────────────────────────────────────
  if [[ -n "$COMMANDS_DIR" && -z "$SKILL_FILTER" ]]; then
    info "Installing commands..."
    install_commands "$COMMANDS_DIR" "$cli"
  fi

  echo ""
  success "Done! Restart ${cli} to pick up the new skills."
  echo ""
}

# ── Entry point ───────────────────────────────────────────────────────────────
if [[ -n "$TARGET_CLI" ]]; then
  run_install "$TARGET_CLI"
else
  selected=$(interactive_select_cli)
  for cli in $selected; do
    run_install "$cli"
  done
fi
