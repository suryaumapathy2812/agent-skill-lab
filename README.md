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

OpenCode is the only supported runtime for this repository right now.

### Install All Skills

```bash
npx skills add suryaumapathy/agent-skill-lab
```

### Install Individual Skills Locally

Use these commands when working from a local clone and you only want one skill.

`auto-iterate`
```bash
mkdir -p ~/.config/opencode/skills/auto-iterate
cp -R skills/auto-iterate/* ~/.config/opencode/skills/auto-iterate/
```

`modern-design`
```bash
mkdir -p ~/.config/opencode/skills/modern-design
cp -R skills/modern-design/* ~/.config/opencode/skills/modern-design/
cp -R references/products ~/.config/opencode/skills/modern-design/references/
cp -R references/modern-design ~/.config/opencode/skills/modern-design/references/
```

Install the bundled Design Engineer agents and commands with `modern-design`:

```bash
mkdir -p ~/.config/opencode/agents ~/.config/opencode/commands
cp agents/design-*.md ~/.config/opencode/agents/
cp agents/ux-architect.md ~/.config/opencode/agents/
cp commands/design-*.md ~/.config/opencode/commands/
```

`ai-design`
```bash
mkdir -p ~/.config/opencode/skills/ai-design
cp -R skills/ai-design/* ~/.config/opencode/skills/ai-design/
```

### Install Agents

```bash
mkdir -p ~/.config/opencode/agents
cp agents/*.md ~/.config/opencode/agents/
```

### Install Commands

```bash
mkdir -p ~/.config/opencode/commands
cp commands/*.md ~/.config/opencode/commands/
```

Restart OpenCode after installing skills, agents, or commands.

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
