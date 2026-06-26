---
name: modern-design
description: Premium product UI design system for React, Next.js, Tailwind, shadcn/ui. Covers design philosophy, concrete tokens, layout architecture, typography, surfaces, motion, components, and anti-patterns. Use when building, improving, or reviewing any product UI to reach the quality level of Linear, Resend, Dub, Campsite, and Attio.
license: MIT
---

## Core Philosophy

- **Premium UI is built by subtraction, not addition.** The interface should feel like it was made by someone who said no to 80% of ideas.
- **Every element must earn its place.** If you can't articulate why something exists, remove it.
- **Negative space is a deliberate design feature, not wasted space.** Short lists don't stretch. The canvas breathes.
- **Density over decoration.** Information-rich, visually calm. Sections defined by typography and spacing, not boxes.
- **Consistency compounds.** Same button shape, same spacing rhythm, same form vocabulary across the entire product.
- **Color is punctuation, not paint.** Reserve it for status, errors, actions, and brand.
- The products that inspire this skill — Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, PLAIN, Midday, Polar, Attio — feel premium because of the **THOUGHT** behind every element. Actions are accessible but never overwhelming. Information is sufficient without being excessive. Nothing is there by accident.

## When To Use

Use this skill when building new UIs or refining existing ones to achieve a high-quality, modern SaaS aesthetic.

## DESIGN.md Resolution

- `DESIGN.md` is the canonical source of truth for design tokens in any project.
- If `DESIGN.md` exists at the project root, read it before generating any UI. All code must reference its tokens.
- If `DESIGN.md` is absent, run `/design-init` to create one before building.
- Never rewrite `DESIGN.md` without logging a token-update decision to `.design-engineer/decisions/`.

## The Absolute Laws

1. Always constrain content width (1200-1440px). Never let content sprawl to viewport edge.
2. Always vary spacing rhythm. Tight inside repeated items, medium inside groups, generous between sections. Never uniform spacing everywhere.
3. Always use negative space intentionally. Empty regions are design decisions.
4. Always implement progressive disclosure. Show less by default, reveal on hover/click/expansion.
5. Always use semantic color tokens, never raw utility colors.
6. Always use tabular figures (`font-variant-numeric: tabular-nums`) on all numeric content.
7. Always read `references/hard-rules.md` before generating any UI code.

## Reference Files

| File | Load When | Purpose |
|---|---|---|
| `references/hard-rules.md` | **ALWAYS (before any code)** | Non-negotiable constraints with code |
| `references/design-tokens.md` | Starting a project / setting up design system | oklch tokens, spacing, typography |
| `references/layout.md` | Building page layouts | Content width, rhythm, negative space, disclosure |
| `references/typography.md` | Setting up or refining type system | Micro-typography details |
| `references/surfaces.md` | Working on borders, shadows, dark mode | Surface ladder, depth |
| `references/motion.md` | Adding transitions or animations | Easing, property whitelist, restraint |
| `references/components.md` | Building specific components | Sidebar, table, list, card, badge, empty state |
| `references/anti-patterns.md` | Reviewing or debugging generic UI | Wrong→right code examples |

- `references/products/*.md`: For product-specific inspiration.
- `references/modern-design/component-decision-matrix.md`: For choosing primitives.
- `references/modern-design/rail-model.md`: For performance/interaction model.

## Workflow

1. **Understand:** Read the requirements and data model.
2. **Setup:** Ensure `DESIGN.md` exists or run `/design-init`.
3. **Research:** Read relevant product references and extract patterns.
4. **Architect:** Plan information hierarchy and progressive disclosure.
5. **Layout:** Define max-width and spacing rhythm.
6. **Implement:** Write code referencing `DESIGN.md` tokens and skill recipes.
7. **Critique:** Self-review against `references/anti-patterns.md`.
8. **Log:** Write decisions to the `.design-engineer/decisions/` log.
9. **Refine:** Fix any identified issues.

## Review Checklist

- [ ] Is content width constrained (not spanning the full viewport)?
- [ ] Is the spacing rhythm varied (not just `gap-4` and `mb-6` everywhere)?
- [ ] Are empty regions preserved intentionally?
- [ ] Is progressive disclosure used (secondary actions hidden until hover)?
- [ ] Are numeric values using tabular figures?
- [ ] Are we animating only opacity, transform, and background-color?
- [ ] Are dark mode borders subtle (≤ 14% opacity)?
- [ ] Are there ≤ 5 distinct font sizes?
- [ ] Are semantic color tokens used instead of raw utility colors?
- [ ] Are there minimum 3 distinct surface levels in dark mode?
- [ ] Is there only one region container per section (no card soup)?
- [ ] Is standard easing applied?
