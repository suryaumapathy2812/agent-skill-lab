---
name: modern-design
description: Modern shadcn/UI product polish for React, Next.js, Tailwind, dashboards, SaaS apps, and component refinement. Use when designing, improving, or reviewing UI quality, component styling, page layout, density, typography, borders, shadows, dark mode, tables, cards, forms, charts, and premium SaaS polish inspired by Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, PLAIN, Midday, Polar, and Attio.
license: MIT
---

# Modern Design

Use this skill to make product UI feel modern, premium, calm, and production-grade. It is a super-enhanced design skill focused on improving shadcn-style components, pages, dashboards, and SaaS interfaces so they look and behave like high-quality modern software.

This skill is not about making UI decorative. It is about visual discipline: better defaults, stronger hierarchy, fewer unnecessary lines, better density, and sharper interaction polish.

## Core Principle

Modern product UI is usually not visually loud. It feels expensive because every component is quieter, sharper, better spaced, and more intentional than default component-library output.

The target is not "generic clean SaaS." The target is the level of execution seen in Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, PLAIN, Midday, Polar, and Attio.

## When To Use

Use this skill when the user asks to:

- Make a UI more modern, premium, polished, or high quality.
- Improve shadcn/ui components or a Tailwind/shadcn page.
- Redesign a dashboard, settings page, table, form, sidebar, modal, drawer, or chart page.
- Make a product look more like Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, PLAIN, Midday, Polar, or Attio.
- Improve borders, shadows, typography, spacing, density, dark mode, empty states, loading states, or interaction states.
- Review a frontend implementation for visual quality.
- Design support/helpdesk, financial/business, monetization, or CRM/data workspace interfaces.

## Required Mindset

Treat component polish as a system. Do not just tweak colors.

Improve the UI through:

- Layout hierarchy.
- Typography scale.
- Component density.
- Border and shadow discipline.
- Semantic color use.
- Fewer visible lines.
- Better whitespace rhythm.
- Better empty/loading/error states.
- Better hover, focus, selected, disabled, and pressed states.
- Better data-type rendering.

## Product References

Use focused reference files instead of loading everything at once.

Load these files only when relevant:

- `references/modern-design/component-decision-matrix.md` for choosing list vs table vs card vs matrix vs drawer.
- `references/modern-design/component-recipes.md` for concrete component specs.
- `references/modern-design/depth-surfaces-shadows.md` for borders, shadows, surface hierarchy, and dark-mode depth.
- `references/modern-design/whitespace-density.md` for spacing, row height, card padding, and density decisions.
- `references/modern-design/rail-model.md` for Response, Animation, Idle, and Load performance/interactions.
- `references/modern-design/anti-patterns.md` for diagnosing generic or cluttered UI.
- `references/products/*.md` for product-specific inspiration (including PLAIN, Midday, Polar, Attio, Resend).
- `reports/skills-and-agents-report.md` for repository-level inventory.

## Design Rules

### 1. Improve shadcn Defaults, Do Not Fight Them

Use shadcn components as primitives, but refine their composition and defaults.

Prefer:

- Semantic tokens over raw colors.
- Existing variants before custom CSS.
- `CardHeader`, `CardTitle`, `CardDescription`, `CardContent`, `CardFooter` composition.
- `Badge`, `Separator`, `Skeleton`, `Alert`, `Empty`, `Dialog`, `Sheet`, `Table`, `Command`, `Tabs`, and `Tooltip` instead of custom styled divs.
- `gap-*` instead of `space-x-*` or `space-y-*`.
- `size-*` when width and height match.
- Compact variants for app UI.

Avoid:

- Decorating every section with a card.
- Large default padding everywhere.
- Bright accent colors for non-semantic UI.
- Raw `blue-500`, `green-500`, `red-500` class usage when semantic tokens exist.
- Heavy border plus heavy shadow on the same component.

### 1.5 Choose The Right Primitive

Do not default to tables, cards, or modals just because they are available.

Decision rules:

- Use a list item when records have identity, preview text, status, author, timestamp, or custom hierarchy.
- Use a table when users compare uniform fields across many rows.
- Use a matrix when both row and column axes are meaningful.
- Use a drawer/inspector when detail should preserve page context.
- Use a command palette when actions are numerous or power-user oriented.
- Use cards for meaningful grouping, not every object.

Tables should not be the first choice for every collection. A well-designed list often creates a better, more customizable, more premium UI than a generic table.

### 2. Borders And Shadows

Default SaaS UI often uses too many visible boxes. Premium UI usually uses fewer lines and more subtle surfaces.

Use this hierarchy:

- Borders define structure.
- Shadows define elevation.
- Surface shifts define grouping.
- Whitespace defines separation.

Guidelines:

- Use 1px low-opacity borders.
- In dark mode, borders should often be barely visible.
- Avoid wrapping every stat, row, filter, and toolbar in separate bordered containers.
- Prefer one parent container for a region over many nested cards.
- Use shadows sparingly: dialogs, command palettes, popovers, floating panels, elevated cards.
- On dark surfaces, use soft glow or surface elevation rather than hard gray outlines.

Prefer depth, surface shifts, and spacing before adding more borders. The strongest modern interfaces often look less boxed than default shadcn dashboards.

### 3. Whitespace And Density

Modern UI does not mean oversized UI. Data and SaaS interfaces should be dense but calm.

Use different spacing scales for different levels:

- Page sections: 24px to 40px apart.
- Card/content groups: 16px to 24px padding.
- Toolbars and filters: 8px to 12px gaps.
- Table rows: 36px to 52px height depending on data density.
- Metadata: tight but readable.

Avoid equal spacing everywhere. Create rhythm:

- Tight inside repeated rows.
- Medium inside cards.
- Larger between major sections.

### 4. Typography

Use fewer sizes and clearer roles.

Suggested product UI scale:

- Page title: 20px to 28px.
- Section title: 14px to 16px semibold.
- Body/UI text: 13px to 15px.
- Metadata: 12px to 13px.
- Labels: 11px to 12px, muted or semibold.
- Code/log/table microcopy: 12px to 13px.

Rules:

- Do not make every heading large.
- Prefer muted secondary text over lower opacity primary text when using design tokens.
- Numeric values need strong contrast and tabular alignment when possible.
- Metadata should be present but quiet.

### 5. Color Discipline

Use color like punctuation, not paint.

Reserve color for:

- Error.
- Warning.
- Success.
- Active state.
- Brand accent.
- Chart series.
- Critical status.

Everything else should rely on:

- Background.
- Surface.
- Border.
- Foreground.
- Muted foreground.
- Accent surface.

For dark mode:

- Avoid pure black everywhere.
- Use layered near-black surfaces.
- Keep borders low-contrast.
- Use atmospheric gradients only when they support hierarchy.

### 6. Component-Level Polish

#### Cards

Use cards for meaningful grouping, not every item.

Good card behavior:

- 12px to 16px radius.
- 16px to 24px padding.
- Subtle border or subtle shadow, rarely both strongly.
- Clear title, optional description, content, and actions.
- Hover only if clickable.

#### Tables

Tables should be scannable and restrained.

Good table behavior:

- Row height around 40px to 52px.
- Header text 11px to 12px, muted, semibold.
- Horizontal separators only by default.
- No vertical grid lines unless building a matrix/spreadsheet interface.
- Right-align numeric values.
- Use truncation, expandable detail, or drawers for long content.

#### Forms

Forms should feel structured, not verbose.

Good form behavior:

- Labels 12px to 13px.
- Inputs 36px to 44px high.
- Help text 12px muted.
- Group related fields.
- Separate dangerous actions.
- Use validation states with `aria-invalid` and semantic styling.

#### Buttons

Buttons should not dominate the UI unless they are the primary action.

Good button behavior:

- App buttons often 28px to 36px high.
- Primary CTA only where hierarchy demands it.
- Ghost/secondary buttons for routine actions.
- Icons should be small and aligned.
- Loading state should preserve button width.

#### Badges

Badges are metadata, not decoration.

Good badge behavior:

- Compact height.
- Muted by default.
- Semantic color only for status.
- Avoid rainbow category systems unless the data demands it.

#### Charts

Charts should feel native to the product.

Good chart behavior:

- Quiet axes and grid lines.
- Small labels around 11px to 12px.
- Minimal legends.
- Restrained series colors.
- Tooltips with compact high-contrast information.

#### Empty States

Empty states should be authored and useful.

Good empty state behavior:

- Short title.
- One clear explanation.
- One primary next action if appropriate.
- Optional small illustration/icon, not a generic decorative blob.

### 7. Interaction Polish

Every interactive component needs polished states:

- Default.
- Hover.
- Focus-visible.
- Active/pressed.
- Selected.
- Disabled.
- Loading.
- Empty.
- Error.

Use motion sparingly:

- Hover transitions: 120ms to 180ms.
- Panel/drawer transitions: 180ms to 280ms.
- Dialog/command palette entrance: 120ms to 220ms.
- Avoid bounce and playful easing in serious SaaS tools.

### 8. Data-Type Rendering

For admin, analytics, and internal tools, map data types to intentional components:

- Boolean: compact badge or switch if editable.
- Enum: muted pill.
- Status: semantic badge or dot.
- Date: relative or compact absolute format.
- Currency/number: right-aligned with tabular figures.
- User: avatar plus name, or compact initials.
- Relation: clickable pill/link.
- Long text: truncated preview plus expandable detail.
- ID/hash/token: monospace, truncated, copy action.

## Workflow

When improving UI:

1. Identify the product surface: dashboard, table, settings, editor, analytics, admin panel, communication, or developer tool.
2. Decide the right primitive: list, table, matrix, card, drawer, sheet, command palette, or page.
3. Inspect existing design system and component conventions.
4. Reduce visual noise before adding decoration.
5. Improve hierarchy through spacing, type, alignment, and surfaces.
6. Refine component states and data density.
7. Apply RAIL thinking to response, animation, idle, and load states.
8. Validate light/dark mode if applicable.
9. Check responsive behavior.

## Review Checklist

- Does every border have a structural purpose?
- Does every shadow indicate elevation?
- Is the page using too many cards?
- Did we default to a table when a list/item view would be better?
- Is color semantic, or decorative?
- Are table rows dense but readable?
- Are primary and secondary actions clear?
- Are empty/loading/error states high quality?
- Is typography consistent and restrained?
- Can alignment replace a divider?
- Can whitespace replace a wrapper?
- Does the UI still feel good with real dense data?
- Does the UI respond quickly according to RAIL?

## Output Style

When giving design recommendations or implementing changes, be concrete. Mention component-level decisions like row height, padding, border treatment, typography, state behavior, and density. Avoid vague phrases like "make it modern" without specifying how.
