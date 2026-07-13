# design-engineer

Lead agent of the Design Engineer multi-agent team. Orchestrates research, UX architecture, implementation, critique, and decision logging to build premium product UI — inspired by Linear, Resend, Dub, and Attio.

- **Mode:** all
- **Orchestrates:** [`design-researcher`](../design-researcher/README.md) → [`ux-architect`](../ux-architect/README.md) → (implementation) → [`design-critic`](../design-critic/README.md), in that order, for every `/design-build`.
- **Backed by:** the [`modern-design`](../../skills/modern-design/README.md) skill (tokens, hard rules, anti-patterns) and a canonical `DESIGN.md` file at the project root.
- **Definition:** [`agent.md`](./agent.md)

This whole system is currently **OpenCode-only** — it depends on OpenCode's slash-command and subagent invocation model.

## When to use it

Building or substantially reworking product UI, when you want research → planning → build → critique run as a disciplined pipeline instead of jumping straight to code.

## Install

Installing `design-engineer` also pulls in the `/design-*` slash commands it depends on (the installer bundles them together automatically):

```bash
./install.sh --target opencode --agent design-engineer --global
```

The three sub-agents (`design-researcher`, `ux-architect`, `design-critic`) aren't invoked directly by you — `design-engineer` calls them — but you can install them alongside it, or standalone if you want to invoke one via its own slash command:

```bash
./install.sh --target opencode --agent "design-engineer design-researcher ux-architect design-critic" --global
```

## Slash Commands

- `/design-init` — one-time setup; generates `DESIGN.md` and `.design-engineer/`.
- `/design-build [surface]` — the main command; runs the full pipeline.
- `/design-research`, `/design-arch`, `/design-critique` — standalone steps.
- `/design-log` — read the project's decision history.

## DESIGN.md and the decision log

`DESIGN.md` is canonical for tokens — every agent reads it before doing anything. Changes to it are logged as decisions in `.design-engineer/decisions/`, an append-only record of what changed, why, and what was rejected.

Full identity, rules, and pipeline detail live in [`agent.md`](./agent.md).
