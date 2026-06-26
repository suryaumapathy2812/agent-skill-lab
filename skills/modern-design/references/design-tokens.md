# Design Tokens

A copy-paste-ready design token reference. Not brand-specific — a template system that works as a starting point. Projects should generate their own `DESIGN.md` using `/design-init`.

## Dark Mode Surface Ladder (oklch)

```css
:root[data-theme="dark"] {
  --bg-base: oklch(0.145 0.015 230);       /* Page background */
  --bg-surface: oklch(0.18 0.018 230);     /* Main regions/cards */
  --bg-raised: oklch(0.21 0.018 230);      /* Elevated elements/hover */
  --bg-overlay: oklch(0.24 0.018 230);     /* Floating elements/menus */
  --bg-spotlight: oklch(0.28 0.018 230);   /* Active highlights */
}
```

## Light Mode Surface Ladder (oklch)

```css
:root[data-theme="light"] {
  --bg-base: oklch(0.98 0.005 230);
  --bg-surface: oklch(1 0 0);
  --bg-raised: oklch(1 0 0);
  --bg-overlay: oklch(1 0 0);
  --bg-spotlight: oklch(0.95 0.01 230);
}
```

## Border Token Ladder

```css
:root[data-theme="dark"] {
  --border-subtle: oklch(1 0 0 / 8%);
  --border-default: oklch(1 0 0 / 14%);
  --border-strong: oklch(1 0 0 / 20%);
}

:root[data-theme="light"] {
  --border-subtle: oklch(0 0 0 / 6%);
  --border-default: oklch(0 0 0 / 10%);
  --border-strong: oklch(0 0 0 / 16%);
}
```

## Shadow Tokens

```css
:root {
  --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05); /* Cards */
  --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1); /* Elevated panels */
  --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1); /* Floating elements */
  --shadow-focus: 0 0 0 2px var(--bg-base), 0 0 0 4px var(--primary); /* Focus rings */
}
```

## Spacing Scale

```css
:root {
  --space-xs: 4px;
  --space-sm: 8px;
  --space-md: 16px;
  --space-lg: 24px;
  --space-xl: 40px;
  --space-2xl: 64px;
}
```

## Type Scale

```css
:root {
  /* display: 28px/600/-0.02em */
  --font-display-size: 28px;
  --font-display-weight: 600;
  --font-display-letter-spacing: -0.02em;
  
  /* title: 18px/600/-0.01em */
  --font-title-size: 18px;
  --font-title-weight: 600;
  --font-title-letter-spacing: -0.01em;

  /* heading: 14px/600 */
  --font-heading-size: 14px;
  --font-heading-weight: 600;
  --font-heading-letter-spacing: 0;

  /* body: 14px/400 */
  --font-body-size: 14px;
  --font-body-weight: 400;

  /* label: 12px/500/0.04em */
  --font-label-size: 12px;
  --font-label-weight: 500;
  --font-label-letter-spacing: 0.04em;

  /* caption: 11px/500 */
  --font-caption-size: 11px;
  --font-caption-weight: 500;

  /* mono: 13px/400/tnum */
  --font-mono-size: 13px;
  --font-mono-weight: 400;
}
```

## Tailwind Config Snippet

```javascript
// tailwind.config.js
module.exports = {
  theme: {
    extend: {
      colors: {
        base: 'var(--bg-base)',
        surface: 'var(--bg-surface)',
        raised: 'var(--bg-raised)',
        overlay: 'var(--bg-overlay)',
        spotlight: 'var(--bg-spotlight)',
        'border-subtle': 'var(--border-subtle)',
        'border-default': 'var(--border-default)',
        'border-strong': 'var(--border-strong)',
      },
      spacing: {
        'xs': 'var(--space-xs)',
        'sm': 'var(--space-sm)',
        'md': 'var(--space-md)',
        'lg': 'var(--space-lg)',
        'xl': 'var(--space-xl)',
        '2xl': 'var(--space-2xl)',
      }
    }
  }
}
```
