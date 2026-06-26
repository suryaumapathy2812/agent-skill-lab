# Motion System

Restrained, intentional animation system.

## 1. Core Principle

Motion should clarify, not decorate. If removing an animation doesn't hurt comprehension, remove it.

## 2. Easing Curves

- **Standard:** `cubic-bezier(0.32, 0.72, 0, 1)` — gentle deceleration. Use for most UI.
- **Spring-like:** `cubic-bezier(0.34, 1.56, 0.64, 1)` — only for playful entrances (rare in SaaS).
- **Exit:** `cubic-bezier(0.4, 0, 1, 1)` — quick out.

## 3. Property Whitelist

ONLY animate:
- `opacity`
- `transform` (translate, scale)
- `background-color`

These are GPU-composited and jank-free.

## 4. Property Blacklist

NEVER animate:
- `box-shadow`
- `border-color`
- `width` / `height`
- `padding` / `margin`
- `border-radius`

These trigger layout/paint and cause jank.

## 5. Feedback Motion (Hover/Press)

- Duration: `100-150ms`.
- Properties: `opacity` + `background-color` only.

```css
/* CSS */
.button {
  transition: background-color 120ms ease, opacity 120ms ease;
}
```

## 6. Structural Motion (Entrance/Exit)

- Duration: `200-300ms`.
- Properties: `transform` (translateY, scale) + `opacity`.

```css
/* CSS */
@keyframes fadeIn { 
  from { opacity: 0; transform: translateY(4px); } 
  to { opacity: 1; transform: translateY(0); } 
}
.modal {
  animation: fadeIn 250ms cubic-bezier(0.32, 0.72, 0, 1) forwards;
}
```

## 7. Stagger Pattern

When animating a list of items, stagger them slightly.
- Delay: `30-50ms` per item.
- Max: `5-8 items`. After that, enter all at once.

```css
.item:nth-child(1) { animation-delay: 0ms; }
.item:nth-child(2) { animation-delay: 40ms; }
.item:nth-child(3) { animation-delay: 80ms; }
```

## 8. Button Press

- Provide instant tactile feedback.
- `transform: scale(0.98)` on `:active`.
- Duration: `80ms`.
- No bounce.

## 9. Page Transitions

- Prefer instant navigation.
- If animating, use `150-200ms` opacity crossfade only.

## 10. What NOT to do

- ❌ No bounce easing in SaaS.
- ❌ No `transition: all`.
- ❌ No 500ms+ durations.
- ❌ No parallax.
- ❌ No gradient animations.
