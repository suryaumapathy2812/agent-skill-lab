# Agent Skill Lab

Repository for custom skills and agents created by Surya Umapathy.

This project stores independent skills and agent definitions in a reusable, installable structure. Skills follow the skills.sh repository layout:

```txt
skills/<skill-name>/SKILL.md
```

## Structure

```txt
skills/       Independent skills, each with its own SKILL.md
agents/       Agent definitions and subagent prompts
commands/     OpenCode slash command prompts
reports/      Single reports and inventories for skills/agents
references/   Supporting research and design notes
docs/         Project documentation
```

## Current Skills

- `auto-iterate`: Autonomous iteration and benchmarking toolkit. Inspired by karpathy/autoresearcher.
- `modern-design`: Premium product UI design system. Defines concrete tokens, layout architecture, typography, and motion for React/Tailwind/shadcn.
- `ai-design`: AI workspace product design and AI-native product architecture.
- `idea-sparring`: Conversational brainstorming partner. Uses Socratic questioning, untools.co-inspired mental models, and grounded reference cases to help develop and articulate raw ideas, with resumable per-idea session notes.

## Current Agents

- `auto-iterator`: Autonomous iteration agent. Runs experiments, evaluates, keeps/discards. Use with the `auto-iterate` skill.
- `thinking-partner`: Recurring brainstorming agent. Tab into it to develop and pressure-test raw ideas through Socratic questioning and mental models. Wraps the `idea-sparring` skill.

**Design Engineer System (Multi-Agent Team):**
- `design-engineer`: Lead agent. Orchestrates sub-agents, builds UI, logs decisions.
- `design-researcher`: Sub-agent. Studies reference products, returns pattern briefs.
- `ux-architect`: Sub-agent. Plans information hierarchy and progressive disclosure.
- `design-critic`: Sub-agent. Quality gate. Scores implementations against anti-patterns.

## The Design Engineer System

The Design Engineer system is currently OpenCode-only. It uses a multi-agent architecture to produce premium UI inspired by Linear, Resend, Campsite, and Attio.

`modern-design` is not treated as an independent standalone skill yet. Install it together with the bundled Design Engineer agents and `/design-*` commands.

### Features

1. **Multi-Agent Orchestration**: A lead engineer coordinates a researcher, an architect, and a critic to ensure no step (research, planning, critique) is skipped.
2. **DESIGN.md**: Uses a canonical design specification file (following [google-labs-code/design.md](https://github.com/google-labs-code/design.md)) to define tokens before any code is written.
3. **Decision Log**: An append-only log in `.design-engineer/decisions/` tracks every design choice, the reasoning, and rejected alternatives.

### Slash Commands

When talking to the `design-engineer`, use these commands:
- `/design-init`: Start a new project. Generates `DESIGN.md` and the `.design-engineer/` log folder.
- `/design-build [surface]`: The main command. Runs the full pipeline (research → arch → build → critique → refine).
- `/design-research`: Standalone research step.
- `/design-arch`: Standalone UX planning step.
- `/design-critique`: Standalone code review step.
- `/design-log`: Read the project's decision history.

## Installation

[![skills.sh](https://skills.sh/b/suryaumapathy2812/agent-skill-lab)](https://skills.sh/suryaumapathy2812/agent-skill-lab)

### Quick Install (Recommended)

Works with **any** agent CLI — Claude Code, Codex, Cursor, Antigravity, OpenCode, Windsurf, and more.

```bash
# Install all skills
npx -y skills add suryaumapathy2812/agent-skill-lab

# Install a single skill
npx -y skills add suryaumapathy2812/agent-skill-lab --skill auto-iterate
```

The `npx skills` CLI auto-detects which agent you're using and installs to the right directory (`.claude/skills/`, `.agents/skills/`, `.cursor/rules/`, etc.).

### Shell Installer (Fallback)

No clone required — this runs the installer directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash
```

This opens an interactive menu: pick **Skill**, **Agent**, or **Both** → pick which one(s) by number (e.g. `1` or `1,3` — multi-select, no "install everything" shortcut) → pick your target CLI(s) (auto-detected where possible) → pick **Global** or **Project** scope. Every step requires an explicit choice; there's no default that installs everything for you.

Pass flags to skip the menu and install non-interactively (works the same whether piped or run from a local clone — when piping, args go after `bash -s --`):

```bash
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --target opencode --agent thinking-partner --project
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --target claude-code --skill idea-sparring --global
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --list

# Explicit opt-in to install every skill and agent (there's no implicit default for this):
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --all --target claude-code --global
```

If you'd rather work from a local clone:

```bash
git clone https://github.com/suryaumapathy2812/agent-skill-lab
cd agent-skill-lab
./install.sh                                       # same interactive menu
./install.sh --target claude-code                   # target set, still asks what to install
./install.sh --target cursor --skill auto-iterate   # one skill only, prompts for scope
./install.sh --target opencode --agent thinking-partner --project  # one agent only
./install.sh --all --target claude-code --global    # everything, explicitly
./install.sh --list                                 # list available skills/agents
```

<details>
<summary>Supported CLIs & config paths</summary>

| CLI | Skills | Agents | Commands |
|-----|--------|--------|----------|
| **Antigravity (AGY)** | `~/.gemini/skills/` or `.agents/skills/` | `~/.gemini/config/agents/` | — |
| **OpenCode** | `~/.config/opencode/skills/` or `.opencode/skills/` | `~/.config/opencode/agents/` | `~/.config/opencode/commands/` |
| **Claude Code** | `~/.claude/skills/` or `.claude/skills/` | `~/.claude/agents/` | `~/.claude/commands/` |
| **Codex** | Appended to `~/.codex/AGENTS.md` | — | — |
| **Cursor** | `.cursor/rules/<skill>.mdc` | — | — |
| **Windsurf** | `.windsurf/rules/<skill>.md` | — | — |

</details>

<details>
<summary>Manual install (per CLI)</summary>

**Antigravity**
```bash
mkdir -p ~/.gemini/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.gemini/skills/auto-iterate/
```

**OpenCode**
```bash
mkdir -p ~/.config/opencode/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.config/opencode/skills/auto-iterate/
```

**Claude Code**
```bash
mkdir -p ~/.claude/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.claude/skills/auto-iterate/
```

**Codex** — append skill body to `~/.codex/AGENTS.md`:
```bash
./install.sh --target codex --skill auto-iterate
```

</details>

Restart your CLI after installing skills, agents, or commands.

## auto-iterate

A general-purpose autonomous iteration framework. Define what to optimize, how to measure it, and let the agent loop forever.

### Usage

1. Load the `auto-iterate` skill and tell it what you want to optimize
2. The skill asks questions, designs evaluation criteria, creates workspace
3. Invoke the `auto-iterator` agent to start the loop
4. Come back to results in `.auto-iterate/workspace/best/`

### How It Works

- Fixed budget per experiment (time, tokens, or custom)
- Single metric evaluation (LLM judge with weighted criteria, or shell script)
- File-based state: keep on improve, discard on fail
- Never stops until stopping conditions are met or manually interrupted

## skills.sh

The root `skills.sh.json` groups skills for the skills.sh repository page. It does not change installation behavior.

## Reference Strategy

Large design knowledge is split into focused markdown files under `references/` so an agent can load only the needed context:

- `references/products/`: product-specific UI research.
- `skills/modern-design/references/`: The core constraint layer for the `modern-design` skill (hard rules, tokens, layout, typography).
- `references/modern-design/`: Supplementary depth files (decision matrix, RAIL).
- `references/ai-design/`: AI workspace blueprints and product architecture patterns.
