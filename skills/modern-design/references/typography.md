# Micro-Typography

Micro-typography details that differentiate 'fine' from 'premium'.

## 1. Type Role Definitions

- **Display:** 28px+, 600 weight, 1.1-1.15 line-height, -0.02em to -0.03em tracking.
- **Title:** 18px-24px, 600 weight, 1.2-1.25 line-height, -0.01em tracking.
- **Heading:** 14px-16px, 600 weight, 1.4 line-height, 0 tracking.
- **Body:** 13px-14px, 400 weight, 1.5-1.6 line-height, 0 tracking.
- **Label:** 12px, 500 weight, 1.3 line-height, +0.02em to +0.04em tracking.
- **Caption:** 11px, 500 weight, 1.3 line-height, 0 tracking, muted color.
- **Mono:** 13px, 400 weight, 1.5 line-height, `tnum` font feature.

## 2. Tabular Figures

All numeric content MUST use `font-variant-numeric: tabular-nums`. This aligns numbers in columns and makes data feel precise and engineered.

```css
/* CSS */
.metrics-value {
  font-variant-numeric: tabular-nums;
  font-feature-settings: "tnum";
}
```

```html
<!-- Tailwind -->
<div class="text-2xl font-semibold tabular-nums">42,105</div>
```

## 3. Letter Spacing (Tracking) Rules

- **Negative on large text:** Large text naturally looks too loose. Tighten it (-0.02em) to make headings feel solid.
- **Neutral on body:** Keep it readable (0).
- **Positive on small/uppercase labels:** Small text clumps together. Loosen it (+0.02em to +0.06em) to improve legibility.

## 4. Line Height Rules

- **Tight on headings (1.1-1.2):** Prevents multi-line headings from feeling disconnected. Tailwind's `leading-tight` or custom values.
- **Comfortable on body (1.5-1.6):** Tailwind's `leading-normal` or `leading-relaxed`.
- **Compact on UI text (1.3-1.4):** Buttons, labels, and list items need tighter bounds. Tailwind's `leading-snug`.

## 5. Text Rendering

Add these to your global body styles to ensure crisp rendering:

```css
body {
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

## 6. Number Formatting

- Currency and metrics in tables should be right-aligned with `tabular-nums`.
- Percentages should use `tabular-nums`.
- System IDs, hashes, and API keys should use a monospace font, be truncated if long, and include a copy action on hover.

## 7. Common Mistakes

- ❌ Using `text-xl` for everything instead of distinct roles.
- ❌ Missing `tabular-nums` on data tables and stat cards.
- ❌ Using the same letter-spacing on large headings and small labels.
- ❌ Using `leading-normal` (1.5) on large headings, making them float apart.
