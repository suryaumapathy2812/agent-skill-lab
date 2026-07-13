# ux-architect

Sub-agent of the [Design Engineer team](../design-engineer/README.md). Decides what goes where before anything is styled — information hierarchy, layout regions, primitive choices, and progressive disclosure.

- **Mode:** subagent (read-only — cannot edit files)
- **Invoked by:** `design-engineer`, after `design-researcher` delivers its brief, or standalone via `/design-arch`.
- **Definition:** [`agent.md`](./agent.md)

## What it returns

A UX plan with: content width/layout, an information hierarchy (P0 always-visible through P3 separate-surface), primitive choices with reasoning, a progressive-disclosure map (default/hover/click/nav states), and spacing rhythm from `DESIGN.md` tokens. It does not choose colors, shadows, or styling — that's implementation's job, after this plan exists.

## Install

Usually installed as part of the full team (see [`design-engineer`](../design-engineer/README.md)), but can be installed alone:

```bash
./install.sh --target opencode --agent ux-architect --global
```

Full process and output format live in [`agent.md`](./agent.md).
