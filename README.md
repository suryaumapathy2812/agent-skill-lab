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

## Current Agents

- `auto-iterator`: Autonomous iteration agent. Runs experiments, evaluates, keeps/discards. Use with the `auto-iterate` skill.

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

Skills work with any major AI coding CLI. Use the universal installer for the easiest setup.

### Universal Installer (Recommended)

Clone the repo, then run:

```bash
git clone https://github.com/suryaumapathy/agent-skill-lab
cd agent-skill-lab
./install.sh
```

The installer auto-detects which CLIs you have installed and prompts you to choose. You can also be explicit:

```bash
# Install for a specific CLI (globally)
./install.sh --target antigravity
./install.sh --target claude-code
./install.sh --target opencode
./install.sh --target codex
./install.sh --target cursor
./install.sh --target windsurf

# Install a single skill only
./install.sh --target claude-code --skill auto-iterate

# Install into the current project directory instead of globally
./install.sh --target cursor --project

# List available skills and agents
./install.sh --list
```

### Supported CLIs & Config Paths

| CLI | Skills | Agents | Commands |
|-----|--------|--------|----------|
| **Antigravity (AGY)** | `~/.gemini/skills/` or `.agents/skills/` | `~/.gemini/config/agents/` | — |
| **OpenCode** | `~/.config/opencode/skills/` or `.opencode/skills/` | `~/.config/opencode/agents/` | `~/.config/opencode/commands/` |
| **Claude Code** | `~/.claude/skills/` or `.claude/skills/` | `~/.claude/agents/` | `~/.claude/commands/` |
| **Codex** | Appended to `~/.codex/AGENTS.md` | — | — |
| **Cursor** | `.cursor/rules/<skill>.mdc` | — | — |
| **Windsurf** | `.windsurf/rules/<skill>.md` | — | — |

> **Note:** Cursor and Windsurf are project-scoped only (rules live inside your project). For global rules in Cursor, use the Cursor Settings UI.

### Manual Install (per CLI)

<details>
<summary>Antigravity</summary>

```bash
mkdir -p ~/.gemini/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.gemini/skills/auto-iterate/
```
</details>

<details>
<summary>OpenCode</summary>

```bash
mkdir -p ~/.config/opencode/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.config/opencode/skills/auto-iterate/
```

For `modern-design` with bundled agents and commands:
```bash
mkdir -p ~/.config/opencode/skills/modern-design
cp -R skills/modern-design/* ~/.config/opencode/skills/modern-design/
cp -R references/products ~/.config/opencode/skills/modern-design/references/
cp -R references/modern-design ~/.config/opencode/skills/modern-design/references/
mkdir -p ~/.config/opencode/agents ~/.config/opencode/commands
cp agents/design-*.md ~/.config/opencode/agents/
cp agents/ux-architect.md ~/.config/opencode/agents/
cp commands/design-*.md ~/.config/opencode/commands/
```
</details>

<details>
<summary>Claude Code</summary>

```bash
mkdir -p ~/.claude/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.claude/skills/auto-iterate/
```
</details>

<details>
<summary>Codex (AGENTS.md)</summary>

Codex doesn't have a native skills system. The installer appends skill content to `~/.codex/AGENTS.md`:
```bash
./install.sh --target codex --skill auto-iterate
```
</details>

<details>
<summary>Cursor</summary>

The installer creates a `.mdc` rule file in `.cursor/rules/` inside your project:
```bash
cd /your/project
/path/to/agent-skill-lab/install.sh --target cursor --skill auto-iterate
```
</details>

<details>
<summary>Windsurf</summary>

The installer creates a `.md` rule file in `.windsurf/rules/` inside your project:
```bash
cd /your/project
/path/to/agent-skill-lab/install.sh --target windsurf --skill auto-iterate
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
