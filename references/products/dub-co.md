# Dub.co

## UI Role

Dub.co is an open-source reference for polished analytics dashboards built with modern React UI conventions.

## Layout Pattern

- Analytics are organized into clean cards, charts, tables, and filters.
- Heavy metrics feel approachable through restrained grouping.
- The interface uses modern shadcn/Tremor-like dashboard patterns without becoming noisy.

## Why It Works

- It shows how metric-heavy dashboards can remain clean.
- Chart and table components are visually aligned with the app shell.
- The product avoids overusing color or borders.

## Component Polish Notes

- Metric cards should include only key value, label, and essential context.
- Charts need quiet axes, minimal legends, and restrained color.
- Filters should be compact and not visually dominate analytics.
- Tables should use alignment and type hierarchy over heavy grid lines.
- Use empty states and loading skeletons that match the dashboard tone.

## Skill-Building Takeaway

For analytics interfaces, create refined metric, chart, table, and filter primitives with restrained defaults and semantic color usage.

## Detailed UI Construction Notes

Dub.co is a strong model for polished analytics because it keeps metrics, filters, charts, and tables aligned under one restrained system. The dashboard should not look like a BI tool dropped into a SaaS app. The data surface should feel native.

Metric cards should be small and efficient. A good metric card uses 14px label, 24px to 32px numeric value, and 12px trend/context. Padding can be around 16px to 20px. Use a subtle border or surface shift, not a dramatic shadow. Keep icon use minimal.

Charts should use restrained colors and quiet axes. Chart containers can have 16px to 24px padding, with title and controls in a compact header. Axis labels should be 11px to 12px, grid lines very faint. Tooltips should be small, high-contrast, and precisely aligned.

Filters should sit in a compact toolbar, around 36px to 40px tall. Date range, segment, and search controls should not become large cards. The toolbar can use gap 8px to 12px and align controls on one line when possible.

Tables should prioritize scanning. Row height around 40px to 48px, muted metadata, right-aligned numbers, and subtle hover states. Avoid vertical grid lines. If a link/item title includes metadata, use a two-line cell with 13px title and 12px muted secondary line.

What to copy: analytics-native shadcn polish, compact metrics, restrained Tremor-like charts, clean filter toolbar.

What to avoid: colorful dashboard kits, oversized cards, chart legends dominating the screen, and filters that consume more space than the data.

## Additional Decision Patterns

Dub.co is a useful reference for deciding when tables are acceptable. Analytics often needs tables, but the first impression should not be a raw table. Start with compact metrics, chart context, and filters; use tables for drill-down and comparison.

The dashboard avoids BI-tool heaviness by keeping filters in a compact toolbar and keeping chart containers visually quiet. The data is dense, but the first read is guided: metric summary, trend, then detailed breakdown.

Design rule to extract: analytics pages should lead with interpretation and comparison, then provide detailed rows. Do not make the table the hero unless the user's primary job is row-level operations.
