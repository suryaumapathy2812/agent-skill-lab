# design-researcher

Sub-agent of the [Design Engineer team](../design-engineer/README.md). Studies reference products and returns a focused UI pattern brief for one specific surface — not a literature review.

- **Mode:** subagent (read-only — cannot edit files)
- **Invoked by:** `design-engineer` at the start of every `/design-build`, or standalone via `/design-research`.
- **Definition:** [`agent.md`](./agent.md)

## What it returns

A brief with: primary/secondary reference products and *why* they're relevant, do's and don'ts specific to the surface being built, and suggested primitives (List/Table/Card/etc.) with reasoning. It thinks in patterns — why a product made a choice — not aesthetics.

## Install

Usually installed as part of the full team (see [`design-engineer`](../design-engineer/README.md)), but can be installed alone:

```bash
./install.sh --target opencode --agent design-researcher --global
```

Full process and output format live in [`agent.md`](./agent.md).
