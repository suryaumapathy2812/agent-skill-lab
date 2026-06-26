# Anti-Patterns

What NOT to generate.

## 1. Card Soup
Wrapping every piece of content in a bordered card creates visual clutter.

❌ **Wrong**
```html
<div class="border border-gray-200 rounded-lg p-6">
  <h2 class="text-lg font-bold">Details</h2>
  <div class="border border-gray-200 rounded p-4 mt-4">
    <p>Inner content</p>
  </div>
</div>
```

✅ **Right**
```html
<div class="py-6">
  <h2 class="text-sm font-semibold text-muted-foreground uppercase tracking-wider mb-4">Details</h2>
  <div class="px-4 py-3 bg-surface rounded-md">
    <p>Inner content</p>
  </div>
</div>
```
**Why:** Use spacing and typography to group elements, not heavy borders.

## 2. Full-Width Sprawl
Content stretching to viewport edges on wide screens looks like a generic admin panel.

❌ **Wrong**
```html
<div class="w-full p-8">
  <!-- Content spreads across a 2560px screen -->
</div>
```

✅ **Right**
```html
<div class="max-w-[1320px] mx-auto px-8 w-full">
  <!-- Content is constrained and readable -->
</div>
```
**Why:** Reading lines become too long; the UI feels uncontrolled.

## 3. Uniform Spacing
Using the same margin/padding values everywhere.

❌ **Wrong**
```html
<div class="flex flex-col gap-6">
  <h1 class="mb-6">Dashboard</h1>
  <div class="mb-6">Section 1</div>
  <div class="mb-6">Section 2</div>
</div>
```

✅ **Right**
```html
<div class="flex flex-col">
  <h1 class="mb-12">Dashboard</h1> <!-- Generous -->
  <div class="mb-8">Section 1</div> <!-- Medium -->
  <div class="mb-2">Item A</div> <!-- Tight -->
  <div class="mb-2">Item B</div>
</div>
```
**Why:** Rhythm creates hierarchy. Everything equidistant means nothing relates.

## 4. Badge Confetti
Colored badges/pills on every data point regardless of semantic meaning.

❌ **Wrong**
```html
<span class="bg-blue-100 text-blue-800 rounded-full px-2 py-1">Type: User</span>
<span class="bg-purple-100 text-purple-800 rounded-full px-2 py-1">Role: Admin</span>
```

✅ **Right**
```html
<span class="text-muted-foreground text-sm">Type: User</span>
<span class="text-muted-foreground text-sm">Role: Admin</span>
```
**Why:** Save colored badges for true semantic status (Success, Error, Warning).

## 5. Over-Animation
Animating too many properties, causing jank and visual noise.

❌ **Wrong**
```css
.card {
  transition: all 0.3s ease-in-out;
}
.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 10px 15px rgba(0,0,0,0.1);
  border-color: blue;
}
```

✅ **Right**
```css
.card {
  transition: opacity 150ms ease, background-color 150ms ease;
}
.card:hover {
  background-color: var(--surface-raised);
}
```
**Why:** `transition: all` animating shadows and borders is janky. Keep it simple and GPU-friendly.

## 6. Table-First Thinking
Using tables for everything when lists would create better hierarchy.

❌ **Wrong**
```html
<table>
  <tr>
    <th>Avatar</th><th>Name</th><th>Role</th>
  </tr>
  <tr>
    <td><img src="..." /></td><td>John Doe</td><td>Admin</td>
  </tr>
</table>
```

✅ **Right**
```html
<div class="flex items-center gap-4 py-3 border-b border-subtle">
  <img src="..." class="w-8 h-8 rounded-full" />
  <div>
    <div class="font-medium text-sm">John Doe</div>
    <div class="text-xs text-muted-foreground">Admin</div>
  </div>
</div>
```
**Why:** Lists allow narrative hierarchy (avatar + stacked text). Tables force rigid grids.

## 7. Filled-to-Capacity
No intentional negative space, every pixel occupied.

❌ **Wrong**
```html
<div class="min-h-screen flex flex-col justify-between">
  <!-- Content is stretched to fill the whole screen -->
</div>
```

✅ **Right**
```html
<div class="py-12">
  <!-- Content ends naturally, leaving empty space below -->
</div>
```
**Why:** Empty space is a design element. Don't stretch content just because there's room.

## 8. Flat Dark Mode
Pure black + gray borders instead of layered surfaces.

❌ **Wrong**
```css
body { background: #000; }
.card { background: #111; border: 1px solid #333; }
```

✅ **Right**
```css
body { background: oklch(0.145 0.015 230); }
.card { 
  background: oklch(0.18 0.018 230); 
  border: 1px solid oklch(1 0 0 / 8%); 
}
```
**Why:** Modern dark mode uses perceptual lightness steps and subtle tinted grays, not pure black.
