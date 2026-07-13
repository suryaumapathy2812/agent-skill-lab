# design-critic

Sub-agent of the [Design Engineer team](../design-engineer/README.md), and its quality gate. Reviews an implementation against `DESIGN.md`, `modern-design` hard rules, and known anti-patterns, and returns a scored, actionable critique.

- **Mode:** subagent (read-only — cannot edit files; it critiques, it doesn't fix)
- **Invoked by:** `design-engineer` after implementation, or standalone via `/design-critique`.
- **Definition:** [`agent.md`](./agent.md)

## What it returns

An overall score (0.0–1.0), category scores (information density, visual hierarchy, restraint, spacing rhythm, progressive disclosure, surface/depth, token compliance), a checklist of detected anti-patterns (card soup, badge confetti, full-width sprawl, over-animation, etc.), the top 3 issues with specific fixes, and any token violations against `DESIGN.md`. A score below 0.85 means the implementation needs revision. It's deliberately skeptical — its job is to find problems, not to make you feel good about the build.

## Install

Usually installed as part of the full team (see [`design-engineer`](../design-engineer/README.md)), but can be installed alone:

```bash
./install.sh --target opencode --agent design-critic --global
```

Full process and output format live in [`agent.md`](./agent.md).
