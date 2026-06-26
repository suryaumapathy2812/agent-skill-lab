# Midday

## UI Role

Midday is an open-source business management platform for freelancers and small businesses. It combines time tracking, invoicing, file management, and financial overview in a single clean interface. It is a strong reference for modern dashboard + workspace design built with shadcn/ui and Next.js.

## Layout Pattern

- Sidebar navigation with collapsible sections.
- Main content area for dashboards, lists, and detail views.
- Uses drawers and slide-over panels for contextual detail.
- The interface avoids the cluttered feel of traditional accounting tools.

## Why It Works

- Financial data is inherently complex, but Midday keeps it calm through restrained typography and spacing.
- Uses shadcn/ui components with refined defaults, proving that stock components can look premium with the right token choices.
- Dashboard metrics are compact and scannable, not overloaded with charts and badges.
- File management, time tracking, and invoicing each feel native to the same design system.

## Component Polish Notes

- Sidebar: 240px to 280px expanded, compact icon rail when collapsed, muted active state.
- Metric cards: 16px to 20px padding, 24px to 32px value, 12px label, subtle border or surface shift.
- Tables: 44px to 52px row height, right-aligned numbers, muted headers, horizontal separators only.
- Charts: quiet axes, minimal legends, restrained color palette.
- Drawers: 380px to 480px width, smooth slide animation, compact header with title and actions.
- Empty states: short title, one sentence, one action, optional illustration.

## Skill-Building Takeaway

For financial/business tools, the challenge is density without chaos. Midday proves that shadcn-style components can handle complex data if the spacing, typography, and color discipline are right.

## Detailed UI Construction Notes

Midday is a reference for how to make a shadcn-based dashboard feel production-grade. The metric row should use 3 to 4 cards in a flex row, each with label, value, and optional delta. Avoid putting charts inside every metric card.

Tables should handle invoices, transactions, and time entries with type-aware rendering: currency right-aligned with tabular figures, dates in compact format, status as muted badges, and actions visible on hover.

The sidebar should feel like a workspace navigator, not a marketing nav. Use small icons, 13px to 14px labels, and subtle grouping. Active state should be a muted surface highlight.

Drawers should open from the right for detail views: invoice preview, transaction detail, time entry edit. The drawer should preserve the list context behind it.

What to copy: refined shadcn defaults, compact metric cards, type-aware table rendering, drawer-based detail views.

What to avoid: accounting-tool clutter, excessive charts on the main dashboard, colorful category badges, or treating every metric as a card with icon + chart + description.

## Additional Decision Patterns

Midday shows that financial tools do not need to look like spreadsheets. The first view should be a summary with trend, not a table of transactions. Tables appear for drill-down and management.

The product also shows that file management and time tracking can live in the same design system if the component tokens are consistent. Each surface feels like the same product.

Design rule to extract: for business tools, lead with interpretation (metrics, trends), then provide detail (tables, lists). Use drawers for contextual editing and preview.
