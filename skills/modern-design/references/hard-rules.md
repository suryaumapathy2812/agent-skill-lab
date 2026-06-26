# Hard Rules (LLM Behavior Overrides)

These rules are absolute. They override generic LLM defaults. Follow them exactly.

## 1. Content Width Constraint
Always constrain the main content width and center it. Never let content sprawl to the viewport edge.

```css
/* CSS */
.main-content {
  max-width: 1440px;
  margin: 0 auto;
  padding: 0 32px;
}
```
```html
<!-- Tailwind -->
<div class="max-w-[1440px] mx-auto px-8">
  ...
</div>
```

## 2. Spacing System
Use a defined scale. Never use uniform spacing everywhere. Vary the rhythm.

```html
<!-- Wrong: Monotonous rhythm -->
<section class="mb-6">
  <h2 class="mb-6">Title</h2>
  <div class="gap-6">...</div>
</section>

<!-- Right: Tight inside, medium between groups, generous between sections -->
<section class="mb-16"> <!-- Generous between sections -->
  <h2 class="mb-6">Title</h2> <!-- Medium between title and content -->
  <div class="gap-2">...</div> <!-- Tight between repeated items -->
</section>
```

## 3. Numeric Typography
Always use tabular figures for numeric content.

```css
/* CSS */
.metric {
  font-variant-numeric: tabular-nums;
  font-feature-settings: "tnum";
}
```
```html
<!-- Tailwind -->
<span class="tabular-nums">1,234</span>
```

## 4. Animation Properties
ONLY animate `opacity`, `transform`, and `background-color`. NEVER animate `box-shadow`, `border-color`, `width`, or `height`.

```css
/* Wrong */
.card {
  transition: all 0.2s;
}

/* Right */
.card {
  transition: opacity 150ms ease, background-color 150ms ease, transform 200ms ease;
}
```
```html
<!-- Tailwind Right -->
<div class="transition-[opacity,background-color,transform] duration-150 ease-out">
```

## 5. Border Opacity
Dark mode borders should be very subtle. Maximum `12%` opacity for white.

```css
/* CSS */
:root {
  --border-subtle: oklch(1 0 0 / 8%);
  --border-default: oklch(1 0 0 / 12%);
}
```

## 6. Font Sizes
Never use more than 5-6 distinct font sizes on a single page.
Typical scale: `11px`, `12px`, `13px`, `14px`, `18px`, `24px`.

## 7. Color Tokens
Never use raw Tailwind utility colors. Always use semantic tokens.

```html
<!-- Wrong -->
<span class="text-blue-500 bg-blue-500/10">Active</span>

<!-- Right -->
<span class="text-primary bg-primary/10">Active</span>
```

## 8. Progressive Disclosure
Hide row actions by default. Reveal on hover.

```css
/* CSS */
.row-action {
  opacity: 0;
  transition: opacity 150ms ease;
}
tr:hover .row-action {
  opacity: 1;
}
```
```html
<!-- Tailwind -->
<tr class="group">
  <td>...</td>
  <td class="opacity-0 group-hover:opacity-100 transition-opacity">Action</td>
</tr>
```

## 9. Empty Space
Short lists do NOT stretch to fill the viewport. No min-height hacks to fill pages. Let the canvas breathe.

## 10. Surface Hierarchy
Minimum 3 distinct surface levels for dark mode using `oklch`.

```css
/* CSS */
:root {
  --bg-base: oklch(0.145 0.015 230);
  --bg-surface: oklch(0.18 0.018 230);
  --bg-raised: oklch(0.21 0.018 230);
  --bg-overlay: oklch(0.24 0.018 230);
}
```

## 11. Single Container Rule
Use one region container per section. Avoid nested cards (card soup).

```html
<!-- Wrong -->
<div class="border rounded-lg p-4">
  <div class="border rounded-lg p-4">Item</div>
</div>

<!-- Right -->
<div class="flex flex-col gap-2">
  <div class="px-4 py-2 hover:bg-surface-raised rounded-md">Item</div>
</div>
```

## 12. Easing Curve
Standard easing: `cubic-bezier(0.32, 0.72, 0, 1)`. Not generic `ease` or `ease-in-out`.

```css
/* CSS */
.element {
  transition-timing-function: cubic-bezier(0.32, 0.72, 0, 1);
}
```
```html
<!-- Tailwind (add to tailwind.config.js) -->
ease: 'cubic-bezier(0.32, 0.72, 0, 1)'
```
