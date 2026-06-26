# Layout Architecture

Principles for composing pages and spacing.

## 1. Content Width Constraint

THE #1 rule. Never let content stretch to the edges of a wide screen. Constrain it and center it.

```css
/* CSS */
.page-container {
  max-width: 1320px;
  margin-left: auto;
  margin-right: auto;
  padding-left: var(--space-lg);
  padding-right: var(--space-lg);
  width: 100%;
}
```

```html
<!-- Tailwind -->
<div class="max-w-[1320px] mx-auto px-6 w-full">
  <!-- Content -->
</div>
```

## 2. Spacing Rhythm System

Do not use a single gap value everywhere. Use a system that creates hierarchy:

- **Between sections:** `48px` or `64px` (Generous)
- **Between groups:** `24px` or `32px` (Medium)
- **Between items:** `12px` or `16px` (Tight)
- **Inside items:** `4px` or `8px` (Compact)

❌ **Wrong (Uniform)**
```html
<div class="flex flex-col gap-6">
  <section class="flex flex-col gap-6">
    <h2 class="mb-6">Users</h2>
    <div class="flex flex-col gap-6">
      <div class="p-6">User 1</div>
      <div class="p-6">User 2</div>
    </div>
  </section>
</div>
```

✅ **Right (Rhythm)**
```html
<div class="flex flex-col gap-16"> <!-- Generous -->
  <section class="flex flex-col gap-6"> <!-- Medium -->
    <h2>Users</h2>
    <div class="flex flex-col gap-3"> <!-- Tight -->
      <div class="px-4 py-3">User 1</div> <!-- Compact -->
      <div class="px-4 py-3">User 2</div>
    </div>
  </section>
</div>
```

## 3. Negative Space as Feature

Empty regions are intentional. Short lists should NOT be stretched. Pages should NOT be filled just because space exists. 

❌ **Wrong**
```html
<!-- Forcing the list to fill the screen -->
<div class="min-h-screen flex flex-col justify-between">
  <div>Item 1</div>
  <div>Item 2</div>
</div>
```

✅ **Right**
```html
<!-- Letting it end naturally -->
<div class="py-12">
  <div>Item 1</div>
  <div>Item 2</div>
</div>
```

## 4. Progressive Disclosure Architecture

Design in layers of visibility:

1. **P0 (Always visible):** Core identity and status (e.g., Avatar, Name, Role).
2. **P1 (Visible but quiet):** Secondary metadata (e.g., ID, Created Date). Use muted colors.
3. **P2 (Appears on hover):** Actions (e.g., Copy, Edit, Delete).
4. **P3 (Separate surface):** Full details (e.g., Drawer, Detail page).

```html
<!-- P2 Hover Actions Example -->
<div class="group flex items-center justify-between p-2 hover:bg-surface-raised rounded-md">
  <div>
    <div class="font-medium">Surya</div> <!-- P0 -->
    <div class="text-xs text-muted-foreground">Admin</div> <!-- P1 -->
  </div>
  <div class="opacity-0 group-hover:opacity-100 transition-opacity">
    <button>Edit</button> <!-- P2 -->
  </div>
</div>
```

## 5. Visual Anchor Pattern

Choose 1-2 elements to give elevated visual treatment (a subtle background, a gradient, a shadow). Everything else stays quiet. This focal point creates hierarchy.

## 6. Page Anatomy

Standard page structure:
1. **Header region:** Title, breadcrumbs, primary page action.
2. **Filters/Toolbar:** Search, sort, filter toggles.
3. **Main content:** The list, table, or grid.
4. **Footer:** Pagination or summary.

Provide generous spacing (`32px` - `48px`) between the Header/Toolbar and the Main Content.

## 7. Sidebar + Content Shell

The standard app layout pattern:

```html
<div class="flex h-screen overflow-hidden bg-base">
  <!-- Sidebar -->
  <aside class="w-[240px] flex-shrink-0 border-r border-subtle overflow-y-auto">
    <!-- Nav items -->
  </aside>
  
  <!-- Main Content -->
  <main class="flex-1 overflow-y-auto">
    <div class="max-w-[1320px] mx-auto px-8 py-12">
      <!-- Page Content -->
    </div>
  </main>
</div>
```
