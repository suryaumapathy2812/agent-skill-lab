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
reports/      Single reports and inventories for skills/agents
references/   Supporting research and design notes
docs/         Project documentation
```

## Current Skills

- `auto-iterate`: Autonomous iteration and benchmarking toolkit. Inspired by karpathy/autoresearcher.
- `modern-design`: Premium shadcn/Tailwind/SaaS component polish.
- `ai-design`: AI workspace product design and AI-native product architecture.

## Current Agents

- `auto-iterator`: Autonomous iteration agent. Runs experiments, evaluates, keeps/discards. Use with the `auto-iterate` skill.

## auto-iterate

A general-purpose autonomous iteration framework. Define what to optimize, how to measure it, and let the agent loop forever.

### Installation

**OpenCode:**
```bash
npx skills add suryaumapathy/agent-skill-lab
# Then copy the agent:
cp agents/auto-iterator.md ~/.config/opencode/agents/
```

**Claude Code / Codex / Cursor:**
```bash
cp AGENTS.md /path/to/your/project/
```

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
