# Whitespace And Density

Modern product design is not simply spacious. It uses the right amount of space at each level.

## Core Principle

Use tight spacing for repeated information, medium spacing for component internals, and generous spacing between major conceptual groups.

## Spacing Rhythm

Suggested scale:

```txt
4px: micro gaps inside compact controls
8px: icon/text gaps, dense toolbar gaps
12px: compact group gaps
16px: default component padding
20px: comfortable card padding
24px: section gaps inside pages
32px: major page group gaps
40px+: editorial or marketing-level separation
```

## Density By Surface

### Tables

- Dense row: 36px to 40px.
- Standard row: 44px to 48px.
- Rich row: 52px to 64px.

Use dense rows for logs and admin data. Use rich rows for conversations, notes, issues, or records with previews.

### Lists

- Compact item: 40px to 48px.
- Standard item: 56px to 72px.
- Feed item: 88px+ depending on content.

Lists can carry more product character than tables. Use them when item hierarchy matters.

### Cards

- Compact card padding: 14px to 16px.
- Standard card padding: 18px to 24px.
- Avoid 32px+ padding inside app cards unless the card is an empty state or editorial surface.

### Toolbars

- Height: 36px to 44px.
- Gap: 8px to 12px.
- Controls should not dominate data.

## White Space Mistakes

- Equal padding everywhere.
- Huge table rows for dense data.
- Giant cards for tiny metrics.
- Page sections with no separation but oversized controls.
- Empty states with too much illustration and not enough action clarity.

## Product Reference Notes

- Linear is dense but calm because rows are compact and metadata is muted.
- Dub uses compact metric cards and chart containers without BI-tool clutter.
- OpenStatus keeps operational density high but color sparse.
- Reflect gives writing surfaces generous line-height while keeping assistant UI compact.
- Campsite gives feed items enough breathing room while keeping thread metadata quiet.
