# Depth, Surfaces, And Shadows

Modern product UI often feels better because it uses depth instead of drawing borders around everything.

## Core Principle

Use depth to show elevation, surfaces to show grouping, spacing to show separation, and borders only when structure needs to be explicit.

## Border-First UI Feels Generic

Common weak pattern:

```txt
Every metric is a bordered card.
Every toolbar is a bordered card.
Every table is inside a bordered card.
Every filter is a bordered pill.
Every nested section has another border.
```

This creates visual noise even when the UI is technically clean.

## Better Surface Hierarchy

Use a surface ladder:

```txt
Page background
Surface 1: main regions
Surface 2: elevated cards/panels
Surface 3: floating elements/popovers
```

Suggested token model:

```css
--surface-base
--surface-raised
--surface-overlay
--border-subtle
--border-strong
--shadow-panel
--shadow-floating
--shadow-focus
```

## When To Use Borders

Use borders for:

- Pane seams.
- Table row separation.
- Inputs and interactive controls.
- Focused/selected state when background alone is insufficient.
- High-density layouts where alignment needs reinforcement.

Avoid borders for:

- Every card in a dashboard.
- Every item in a list.
- Nested sections inside a card.
- Decorative separation that whitespace can solve.

## When To Use Shadows

Use shadows for:

- Command palettes.
- Dialogs.
- Popovers.
- Floating AI composers.
- Elevated drawers/sheets.
- Cards that are truly clickable/elevated.

Avoid shadows for:

- Static dense tables.
- Every metric card.
- Nested cards.
- Dark-mode surfaces where glow would be more appropriate.

## Dark Mode Depth

Dark mode should not be pure black plus gray borders.

Prefer:

- Layered near-black surfaces.
- Low-opacity borders.
- Soft edge glow for elevated floating panels.
- Subtle radial gradients behind important empty states or hero-like surfaces.

Avoid:

- Bright gray borders everywhere.
- Hard black cards on black backgrounds.
- Neon glows.
- Overly transparent glass that hurts readability.

## Product Reference Notes

- Resend uses surface depth and subtle gradients to make developer utilities feel premium.
- Linear uses hairline separators and muted surfaces rather than heavy cards.
- Arc uses translucent side surfaces to compress chrome.
- Raycast uses strong floating elevation for the command palette, while result rows remain simple.
- Claude uses a panel seam and motion rather than modal heaviness for artifacts.
