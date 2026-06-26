# Surfaces & Depth

How to build visual depth without putting borders everywhere.

## 1. Surface Ladder Concept

Depth is created by subtle changes in background color, not just shadows. 

- **Base:** The page background.
- **Surface:** Main regions (cards, sidebars).
- **Raised:** Elevated elements (hover states, selected items).
- **Overlay:** Floating elements (dropdowns, popovers).

**Dark Mode (oklch):**
```css
--bg-base: oklch(0.145 0.015 230);
--bg-surface: oklch(0.18 0.018 230);
--bg-raised: oklch(0.21 0.018 230);
--bg-overlay: oklch(0.24 0.018 230);
```

**Light Mode (oklch):**
```css
--bg-base: oklch(0.98 0.005 230);
--bg-surface: oklch(1 0 0);
--bg-raised: oklch(1 0 0); /* Light mode often relies more on shadow */
--bg-overlay: oklch(1 0 0);
```

## 2. The Decision Tree

When deciding how to separate or elevate elements, use this logic:

1. **Need to show separation?** → Try **Spacing** FIRST.
2. **Need to show grouping?** → Use a **Surface color shift** (e.g., `bg-surface-raised`).
3. **Need to separate panes/regions?** → Use a subtle **Border**.
4. **Need to show a floating element?** → Use a **Shadow**.

## 3. Border Rules

- Always 1px.
- Use low opacity (8-14% for dark mode, 6-10% for light mode).
- **Never** use heavy borders AND heavy shadows on the same element.
- In tables, prefer horizontal separators only (no vertical grid lines).

## 4. Shadow Rules

Shadows are strictly for floating or elevated elements. 

- `shadow-sm`: Interactive cards.
- `shadow-md`: Elevated panels or modals.
- `shadow-lg`: Command palettes, dropdowns, popovers.

## 5. Dark Mode Formula

Modern dark mode is rarely pure black (`#000`).
- Use a near-black base with a slight cool or warm tint.
- Layer surfaces with subtle lightness steps.
- Use low-contrast borders.
- *Optional:* Soft, low-opacity radial gradients behind empty states or hero sections.

## 6. Light Mode Formula

- White or near-white base.
- Very subtle gray surface steps.
- Crisp but light borders.
- Shadows are more prominent and effective than in dark mode.

## 7. Before / After

❌ **Generic Dark Card:**
Heavy border + shadow + padding. Feels cluttered.
```css
.generic-card {
  background: #111;
  border: 1px solid #333;
  box-shadow: 0 4px 6px rgba(0,0,0,0.5);
  padding: 16px;
}
```

✅ **Premium Dark Card:**
Surface elevation, subtle border, NO shadow.
```css
.premium-card {
  background: var(--bg-surface); /* e.g., oklch(0.18...) */
  border: 1px solid var(--border-subtle); /* e.g., oklch(1 0 0 / 8%) */
  /* No shadow needed if it's sitting on the base */
  padding: 16px;
}
```
