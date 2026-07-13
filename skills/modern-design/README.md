# modern-design

Premium product UI design system for React/Next.js/Tailwind/shadcn. Defines concrete tokens, layout architecture, typography, and motion rules aimed at the quality level of Linear, Resend, Dub, Campsite, and Attio.

- **Core philosophy:** premium UI is built by subtraction, not addition — every element earns its place, negative space is deliberate, color is punctuation not paint.
- **Status:** OpenCode-first. This skill is designed and tested as part of the bundled [Design Engineer team](../../agents/design-engineer/README.md) (`design-engineer`, `design-researcher`, `ux-architect`, `design-critic`) plus the `/design-*` slash commands. Standalone use without that bundle isn't the primary supported path yet.
- **Definition:** [`SKILL.md`](./SKILL.md) · **References:** [`references/`](./references/)

## When to use it

Building new UI or refining existing UI to reach a high-quality, modern SaaS aesthetic — best driven through the Design Engineer agents rather than invoked on its own.

## The absolute laws (non-negotiable)

Constrain content width (1200–1440px), vary spacing rhythm deliberately, use negative space intentionally, implement progressive disclosure, use semantic color tokens (never raw utility colors), use tabular figures on numeric content, and always read `references/hard-rules.md` before generating UI code.

## DESIGN.md

`DESIGN.md` at the project root is the canonical source of truth for design tokens. If it's absent, run `/design-init` to create it before building anything. Changes to it must be logged as a decision in `.design-engineer/decisions/`.

## Reference files

| File | Load when |
|---|---|
| `references/hard-rules.md` | Always, before any code |
| `references/design-tokens.md` | Setting up the design system |
| `references/layout.md` | Building page layouts |
| `references/typography.md` | Setting up/refining type |
| `references/surfaces.md` | Borders, shadows, dark mode |
| `references/motion.md` | Transitions/animations |
| `references/components.md` | Specific components |
| `references/anti-patterns.md` | Reviewing/debugging generic UI |

## Install

Install together with the Design Engineer bundle so `DESIGN.md`/decision-log conventions and the `/design-*` commands come along:

```bash
./install.sh --target opencode --agent design-engineer --global   # pulls in modern-design's bundle context via the agent
./install.sh --target opencode --skill modern-design --global      # or the skill on its own
```

See the [root README](../../README.md#installation) and the [Design Engineer agent doc](../../agents/design-engineer/README.md) for the full workflow.
