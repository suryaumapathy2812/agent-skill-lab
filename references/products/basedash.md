# Basedash

## UI Role

Basedash is an AI admin-panel product that maps raw database information into polished UI.

## AI Layout Pattern

- AI generates admin interfaces from database structure.
- Raw SQL/data schemas become tables, forms, filters, and detail pages.
- The output should feel hand-designed rather than mechanically generated.

## Why It Works

- It maps data types to appropriate minimalist components.
- Users get functional admin panels without designing every screen manually.
- The UI proves automation can still produce refined product surfaces.

## Component Polish Notes

- Data types need consistent visual mappings: boolean, enum, date, relation, status, currency, user, long text.
- Tables should be dense and action-efficient.
- Detail panels should avoid showing every field with equal weight.
- Filters should be compact and type-aware.
- Generated forms need clear grouping and strong default layout.

## Skill-Building Takeaway

Create data-type-to-component rules so generated interfaces feel intentionally designed: status badges, relation pills, date cells, currency cells, boolean switches, and expandable long text.

## Detailed UI Construction Notes

Basedash should be studied as automatic design mapping. The UI quality depends on how raw database types become polished components. Every data type needs a clear default visual treatment.

Admin tables should be dense and reliable. Row height can be around 40px to 48px. Column headers should be 11px to 12px muted text. Primary object names should be 13px to 14px medium text. Secondary IDs, timestamps, and relations should be muted and possibly monospace when useful.

Data type mappings should be precise. Booleans can be tiny yes/no badges or switches depending on editability. Enums become muted pills. Status fields get semantic badges. Dates use compact relative or absolute formats. Currency aligns right. Long text truncates with expansion. Relations become clickable pills or linked names.

Detail pages should not show every field with equal hierarchy. Group fields into logical sections, use two-column layouts where appropriate, and elevate primary identity fields. Internal IDs and timestamps should be secondary, often tucked lower or shown in metadata groups.

Generated forms need strong grouping. Input height around 36px to 42px, labels 12px to 13px, help text 12px muted. Related fields should appear together. Dangerous actions should be separated from routine edits.

What to copy: type-aware component generation, dense admin tables, restrained field hierarchy, automatic but polished CRUD surfaces.

What to avoid: raw database dumps, equal weight for every field, generic tables with no type formatting, or huge forms without grouping.

## Additional Decision Patterns

Basedash clarifies the difference between a table and a designed data surface. Admin products often need tables, but the table should be type-aware. Raw database columns are not UI hierarchy.

Use lists or object cards for entities that need identity and preview. Use tables for bulk management, sorting, and comparing fields. In both cases, data types must render intentionally: status as status, relation as relation, date as time, ID as copyable monospace, boolean as editable or read-only state.

Design rule to extract: generated UI must map schema meaning to component meaning. A raw field dump is not a designed interface.
