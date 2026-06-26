# Premium Component And Page Polish Patterns

This file captures the visual-execution layer shared by Linear, Resend, Dub, OpenStatus, Langfuse, Hebbia, Campsite, Reflect, and similar products.

## Core Idea

Premium SaaS UI often feels like a stricter, calmer version of shadcn/ui. The components are familiar, but the defaults are more disciplined.

The difference is rarely a single dramatic component. It comes from hundreds of small choices:

- Subtler borders.
- Fewer visible lines.
- Better spacing rhythm.
- Tighter typography.
- Restrained color.
- Lower visual noise.
- More precise density.
- Higher-quality empty, loading, and error states.

## Borders And Shadows

Generic dashboard cards often combine visible border, strong surface, and shadow. Premium SaaS usually chooses one dominant edge treatment.

Better defaults:

- Use borders for structure.
- Use shadows for elevation.
- Avoid heavy border plus heavy shadow.
- Use 1px borders with low opacity.
- In dark mode, borders should often be barely visible.
- Let subtle surface changes replace hard outlines when possible.

## Fewer Lines, Better Grouping

Avoid boxing every element.

Prefer:

- One container for a region instead of cards around every sub-item.
- Spacing to separate groups.
- Alignment to create scan paths.
- Dividers only where scanning requires them.
- Muted separators over high-contrast borders.

## Necessary Whitespace

Whitespace should be purposeful, not excessive.

- Repeated table rows can be compact.
- Metric cards can be dense.
- Page sections need more breathing room.
- Groups need clearer spacing than individual rows.
- Avoid equal spacing everywhere; create rhythm.

## Information Density

Each component should show only the information needed for immediate interpretation.

Default state:

- Primary value.
- Minimal label.
- One meaningful comparison or status if needed.

Progressive state:

- More detail on hover, click, drawer, popover, expandable row, or detail page.

## Typography

The best SaaS interfaces use fewer font sizes and stronger contrast discipline.

Typical hierarchy:

```txt
Page title: 20-28px
Section title: 14-16px semibold
Body: 13-15px
Metadata: 12-13px
Labels: 11-12px, muted or uppercase
```

Avoid making every element large. Smaller type can feel more professional when spacing and contrast are correct.

## Color Discipline

Color should communicate, not decorate.

Use color mainly for:

- Error.
- Success.
- Warning.
- Active state.
- Brand accent.
- Chart series.

Everything else should be tokenized grayscale/surface/text values.

## Component Checklist

Use these questions when refining a page or component:

- Does it need a border?
- Does it need a shadow?
- Does it need this much padding?
- Is the text hierarchy obvious?
- Is the action visible only when needed?
- Is color being used semantically?
- Can alignment replace a divider?
- Can whitespace replace a container?
- Is the component showing too much information?
- Does it still work in dense layouts?
