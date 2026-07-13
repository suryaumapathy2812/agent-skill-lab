# Agent Skill Lab

Repository for custom skills and agents created by Surya Umapathy. Skills follow the [skills.sh](https://skills.sh/suryaumapathy2812/agent-skill-lab) repository layout (`skills/<skill-name>/SKILL.md`); agents follow a matching per-directory layout (`agents/<agent-name>/agent.md`).

## Installation

[![skills.sh](https://skills.sh/b/suryaumapathy2812/agent-skill-lab)](https://skills.sh/suryaumapathy2812/agent-skill-lab)

### One-line install (recommended)

No clone required — runs the installer directly from GitHub:

```bash
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash
```

This opens an interactive menu: pick **Skill**, **Agent**, or **Both** → pick which one(s) by number (multi-select, e.g. `1,3`) → pick your target CLI(s) (auto-detected where possible) → pick **Global** or **Project** scope. Every step requires an explicit choice — there's no default that installs everything for you.

Pass flags to skip the menu (works identically piped or cloned locally — when piping, args go after `bash -s --`):

```bash
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --target opencode --agent thinking-partner --project
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --target claude-code --skill idea-sparring --global
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --list

# Explicit opt-in to install every skill and agent (no implicit default for this):
curl -fsSL https://raw.githubusercontent.com/suryaumapathy2812/agent-skill-lab/main/install.sh | bash -s -- --all --target claude-code --global
```

### Local clone

```bash
git clone https://github.com/suryaumapathy2812/agent-skill-lab
cd agent-skill-lab
./install.sh                                        # same interactive menu
./install.sh --target claude-code                    # target set, still asks what to install
./install.sh --target cursor --skill auto-iterate    # one skill only, prompts for scope
./install.sh --target opencode --agent thinking-partner --project  # one agent only
./install.sh --all --target claude-code --global     # everything, explicitly
./install.sh --list                                  # list available skills/agents
```

### Alternative: npx skills

Works with any agent CLI and auto-detects the right install directory:

```bash
npx -y skills add suryaumapathy2812/agent-skill-lab                          # all skills
npx -y skills add suryaumapathy2812/agent-skill-lab --skill auto-iterate     # one skill
```

Note this path only installs skills, not agents or commands — use `install.sh` for those.

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

Restart your CLI after installing skills, agents, or commands.

## Skills

| Skill | What it does |
|---|---|
| [`auto-iterate`](skills/auto-iterate/README.md) | Autonomous iteration and benchmarking toolkit. Define a metric, a budget, and let an agent loop: try, evaluate, keep, discard. |
| [`idea-sparring`](skills/idea-sparring/README.md) | Conversational brainstorming partner. Socratic questioning, untools.co mental models, and reference cases to develop and articulate raw ideas. |
| [`modern-design`](skills/modern-design/README.md) | Premium product UI design system (tokens, layout, typography, motion) for React/Tailwind/shadcn, inspired by Linear, Resend, Attio. |
| [`ai-design`](skills/ai-design/README.md) | AI workspace product design and AI-native product architecture — where AI lives in a product, artifacts, copilots, chat-plus-output layouts. |

## Agents

| Agent | Mode | What it does |
|---|---|---|
| [`auto-iterator`](agents/auto-iterator/README.md) | subagent | Runs the `auto-iterate` loop: experiments, evaluates, keeps improvements, discards failures. Never stops on its own. |
| [`thinking-partner`](agents/thinking-partner/README.md) | all | Standing form of `idea-sparring` — Tab into it to develop and pressure-test raw ideas through conversation. |
| [`design-engineer`](agents/design-engineer/README.md) | all | Lead of the Design Engineer team (below). Orchestrates research → UX planning → build → critique, logs decisions. |
| [`design-researcher`](agents/design-researcher/README.md) | subagent | Design Engineer sub-agent. Studies reference products, returns a focused UI pattern brief. |
| [`ux-architect`](agents/ux-architect/README.md) | subagent | Design Engineer sub-agent. Plans information hierarchy and progressive disclosure before anything is styled. |
| [`design-critic`](agents/design-critic/README.md) | subagent | Design Engineer sub-agent and quality gate. Scores an implementation against `DESIGN.md` and known anti-patterns. |

`design-engineer`, `design-researcher`, `ux-architect`, and `design-critic` form the **Design Engineer System** — currently OpenCode-only, driven by `/design-init`, `/design-build`, `/design-research`, `/design-arch`, `/design-critique`, and `/design-log`. See [`agents/design-engineer/README.md`](agents/design-engineer/README.md) for the full workflow; installing that agent pulls the slash commands in automatically.

## Structure

```txt
skills/       Independent skills — skills/<name>/SKILL.md + README.md
agents/       Agent definitions — agents/<name>/agent.md + README.md
commands/     OpenCode slash command prompts (the /design-* commands)
reports/      Single reports and inventories for skills/agents
references/   Supporting research and design notes, chunked so agents load only what's relevant
docs/         Project documentation
```

See [`docs/project-structure.md`](docs/project-structure.md) for the full layout conventions, and each skill's/agent's own `README.md` for details beyond this overview.
