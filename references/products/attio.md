# Attio

## UI Role

Attio is a modern CRM platform designed as a highly customizable, data-driven alternative to Salesforce and HubSpot. It is a strong reference for list/table/view-based workspace design, combining kanban boards, tables, lists, and detail views in a single polished interface.

## Layout Pattern

- Sidebar navigation with workspace/collection sections.
- Main content area switches between views: list, table, kanban, pipeline.
- Right drawer or detail pane for record inspection.
- The interface feels like a data workspace, not a traditional CRM form.

## Why It Works

- CRM data is inherently relational and multi-view. Attio lets users switch between list, table, and kanban without leaving the page.
- The UI is extremely polished: subtle borders, muted metadata, compact rows, and semantic status indicators.
- Custom fields and views are first-class, meaning the UI must handle arbitrary data types gracefully.
- The product proves that complex data tools can feel calm if the component defaults are right.

## Component Polish Notes

- Sidebar: 240px to 280px width, collection icons, workspace sections, muted active state.
- View switcher: compact segmented control or tabs, 32px to 36px height.
- List view: 48px to 64px row height, primary field as title, secondary fields as muted pills or inline metadata.
- Table view: 40px to 48px row height, column headers 11px to 12px muted, right-aligned numbers, type-aware cell rendering.
- Kanban view: column width 280px to 320px, card height 80px to 120px, compact card with name, status, assignee, and 1 to 2 metadata fields.
- Detail view: drawer 400px to 520px width or full detail page with tabs.

## Skill-Building Takeaway

For data-heavy workspace tools, support multiple views of the same data. The view should change, not the data model. Each view type needs its own density and component rules.

## Detailed UI Construction Notes

Attio is the strongest modern reference for view-switching in a data workspace. The same collection of records can appear as a list, table, kanban, or pipeline. Each view has different density and hierarchy rules.

List view should feel like a structured inbox: leading indicator/avatar, primary field, secondary metadata, and trailing status. This is the most customizable view because each record can have different field emphasis.

Table view should feel like a precise spreadsheet but with SaaS polish: type-aware cells (text, number, date, select, relation, person, currency), compact headers, and horizontal separators. Avoid vertical grid lines unless the data demands it.

Kanban view should feel like a visual workflow: columns for stages/statuses, cards with just enough info to identify and act. Avoid overloading kanban cards with too many fields.

The detail view should use tabs for related data: overview, activity, notes, related records. Avoid dumping everything into one long scroll.

What to copy: view-switching architecture, type-aware cell rendering, kanban/list/table parity, drawer-based detail inspection.

What to avoid: treating CRM as forms-only, colorful pipeline stages everywhere, dense table without type awareness, or kanban cards overloaded with fields.

## Additional Decision Patterns

Attio demonstrates that the same data model should support multiple visual representations. A contact can be a row in a table, a card in a kanban, or an item in a list. The user chooses the view based on their current task: scanning, comparing, or workflow management.

The product also shows that custom fields require type-aware rendering. A date field should render as a date, not a string. A relation field should render as a clickable pill, not a UUID. A currency field should align right with tabular figures.

Design rule to extract: for data workspace tools, build view-switching as a first-class feature. Each view type needs its own density, hierarchy, and component rules. The data model stays constant; the presentation adapts.
