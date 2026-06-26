# Component Decision Matrix

Modern product design is often better because it chooses the right primitive for the user's job instead of defaulting to the most obvious library component.

## Core Rule

Do not start with a component. Start with the user's scanning and decision task.

Ask:

- Is the user comparing many similar records?
- Is the user reading a sequence?
- Is the user acting on one object at a time?
- Is the user choosing from a small set?
- Is the user monitoring a status stream?
- Is the user exploring nested detail?
- Is the user editing structured fields?

## List Before Table

Tables should not be the first choice for every list of records. A carefully designed item/list view often looks better, scans better, and provides more room for product-specific hierarchy.

Use an item/list view when:

- Records have a primary title and secondary metadata.
- Each item needs custom layout or status treatment.
- The user is browsing, triaging, or reading.
- The item has actions, avatars, nested metadata, comments, excerpts, or previews.
- Mobile responsiveness matters.
- You want to preserve brand/product character.

Use a table when:

- Users compare many records across the same fields.
- Numeric alignment matters.
- Sorting/filtering by columns is central.
- Density and precision matter more than narrative scanning.
- The object structure is highly uniform.

Use a matrix/grid when:

- Users compare repeated extraction or answers across documents/items.
- Both rows and columns have semantic meaning.
- Evidence or confidence exists per cell.

## Examples From Product References

- Linear uses issue rows instead of card grids because users scan title, status, assignee, and metadata quickly.
- Campsite uses feed items instead of tables because posts are conversational and hierarchical.
- Reflect uses note lists and backlinks instead of tables because writing context matters.
- Basedash uses tables for raw admin comparison, but type-aware cells make them feel designed.
- Hebbia uses a matrix because repeated extraction across documents needs row/column comparison.
- Langfuse uses trace tables and nested rows because technical observability needs density.

## Decision Rules

### Records With Personality

Use list item.

Examples: posts, conversations, notes, tasks, issues, documents, sessions, meetings.

Recommended structure:

```txt
[icon/avatar/status] [primary title]
                     [secondary metadata, tags, preview]
                     [tertiary context or timestamp]
                                      [quiet action/status]
```

### Records With Comparable Fields

Use table.

Examples: invoices, logs, API keys, users, usage rows, billing rows, model runs.

Recommended structure:

```txt
Name | Status | Owner | Usage | Updated | Actions
```

### Records With Nested Detail

Use list or table plus drawer/inspector.

Avoid expanding huge details inline by default.

### Records With Repeated AI Extraction

Use matrix/grid.

Examples: documents x questions, calls x insights, candidates x criteria.

## Anti-Default Rule

If the UI starts to look like a generic admin dashboard, reconsider the primitive.

- Table -> maybe list.
- Card grid -> maybe compact list.
- Modal -> maybe drawer.
- Page transition -> maybe inspector.
- Badge -> maybe muted metadata text.
- Border -> maybe spacing.
- Button -> maybe command/action menu.
