# Linear

## UI Role

Linear is a benchmark for modern minimalist SaaS UI: keyboard-first, dark-mode friendly, subtle, fast, and visually disciplined.

## Layout Pattern

- Navigation and actions are compressed.
- The command palette carries much of the interaction complexity.
- Screens use strong alignment and hierarchy instead of heavy decoration.
- Issue lists and detail panels are dense but calm.

## Why It Works

- Every element is stripped to the minimum useful form.
- The UI relies on keyboard flow and command search instead of visible menus.
- Dark-mode, subtle-border, Inter-like SaaS aesthetics are executed with extreme restraint.

## Component Polish Notes

- Hairline borders and muted separators dominate.
- Information-dense rows remain readable through spacing and alignment.
- Active states are quiet but clear.
- Color is semantic and sparse.
- Command palette behavior makes the app feel faster than visible button-heavy UIs.

## Skill-Building Takeaway

For premium SaaS polish, create components that feel lighter than stock shadcn: smaller text, subtler borders, fewer boxes, command-first actions, and highly consistent spacing.

## Detailed UI Construction Notes

Linear's look depends on disciplined density. Rows, panels, and controls are compact, but never cramped. A typical issue row can sit around 36px to 44px high, with small metadata tokens, status icon, title, assignee, and date aligned on a strict horizontal grid. The row should rely on hover state and text contrast instead of visible card boundaries.

Borders should be hairline and low contrast. In dark mode, a border might feel closer to 8% to 14% opacity white than a visible gray line. Section seams should be subtle enough to disappear when not inspected directly. Avoid the stock dashboard habit of wrapping every group in a rounded card.

Typography is small and confident. Body/UI text often feels around 13px to 14px. Labels and metadata feel around 11px to 12px. Page titles are not oversized; they can sit around 20px to 24px with medium weight. The hierarchy comes from contrast and placement, not font-size jumps.

The command palette is central. Its surface should be a floating panel around 560px to 720px wide on desktop, with strong shadow/elevation but still restrained. Search input height can be 48px to 56px. Result rows should be around 40px to 48px with icon, title, metadata, and shortcut aligned cleanly. Keyboard focus should be obvious through a subtle selected background, not bright color.

Buttons and badges should feel utilitarian. Buttons are compact, often 28px to 34px high. Badges should be small, muted, and semantic only when needed. Do not add bright gradients or oversized CTAs to Linear-like product surfaces.

What to copy: density, keyboard-first action model, hairline separators, muted metadata, strong alignment.

What to avoid: large marketing-style headings inside the app, decorative icons, bright status colors everywhere, excessive card borders, or spacious generic SaaS padding.

## Additional Decision Patterns

Linear is a strong argument for list-first product design. Issues could have been rendered as a traditional table, but the list row gives the product more control over hierarchy: issue title, status, project, assignee, priority, and metadata can each have different visual weight without the rigidity of columns.

Use table only when direct column comparison is the user's main job. For issue tracking, triage, planning, and workflow queues, a structured list is usually more modern and more flexible.

Linear also shows that command-first UX can replace whole layers of visible navigation. Instead of exposing every action as a toolbar button, actions live in Cmd+K, keyboard shortcuts, hover actions, and contextual menus.

Design rule to extract: use rows, not cards, for high-frequency work queues. Use command actions, not button clusters, for power-user workflows.
