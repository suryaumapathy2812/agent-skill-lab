# Component Patterns

Recipes for high-impact components.

## 1. App Shell

The standard sidebar + topbar + content area layout.

```html
<div class="flex h-screen overflow-hidden bg-base text-foreground">
  <aside class="w-[240px] flex-shrink-0 border-r border-subtle overflow-y-auto">
    <!-- Sidebar Content -->
  </aside>
  <main class="flex-1 flex flex-col overflow-hidden">
    <header class="h-14 border-b border-subtle flex items-center px-6 flex-shrink-0">
      <!-- Topbar Content -->
    </header>
    <div class="flex-1 overflow-y-auto">
      <div class="max-w-[1320px] mx-auto p-8">
        <!-- Main Content -->
      </div>
    </div>
  </main>
</div>
```

## 2. Sidebar

- **Width:** 220-280px.
- **Active State:** Subtle surface fill (rounded pill), NOT a bright accent bar.
- **Section Labels:** 10-11px, uppercase, muted.
- **Navigation Items:** 13px, 32-36px height, 6-8px border-radius.
- **Keyboard Shortcuts:** Hint (e.g., ⌘K) aligned right.
- ❌ **Common Mistake:** Bright colored active indicators, overly large icons.

## 3. Table

- **Header Text:** 11-12px, muted, semibold, uppercase.
- **Row Height:** 40-52px.
- **Borders:** Horizontal separators only. No vertical lines.
- **Numbers:** Right-aligned, `tabular-nums`.
- **Actions:** Show on row hover with opacity transition.
- ❌ **Common Mistake:** Vertical grid lines, center-aligned numbers.

```html
<tr class="group border-b border-subtle hover:bg-surface/50 transition-colors">
  <td class="py-3 px-4">John Doe</td>
  <td class="py-3 px-4 text-right tabular-nums">1,234</td>
  <td class="py-3 px-4 opacity-0 group-hover:opacity-100 transition-opacity">
    <button>Edit</button>
  </td>
</tr>
```

## 4. List Item

Use INSTEAD of a table when items have a narrative hierarchy (e.g., an avatar + stacked text).

- **Avatar/Icon:** 28-32px.
- **Primary Title:** 13-14px.
- **Secondary Metadata:** 12px, muted.
- **Row Height:** 52-72px.
- ❌ **Common Mistake:** Wrapping every list item in a full bordered card (card soup).

```html
<div class="flex items-center justify-between py-3 border-b border-subtle group">
  <div class="flex items-center gap-3">
    <div class="w-8 h-8 rounded-full bg-surface-raised"></div>
    <div>
      <div class="text-sm font-medium">Project Name</div>
      <div class="text-xs text-muted-foreground">Updated 2h ago</div>
    </div>
  </div>
  <div class="opacity-0 group-hover:opacity-100 transition-opacity">
    <button>Settings</button>
  </div>
</div>
```

## 5. Stat / Metric Card

- **Label:** 12px, muted.
- **Value:** 24-32px, semibold, `tabular-nums`.
- **Delta/Trend (Optional):** 12px.
- **Padding:** 16-20px.
- ❌ **Common Mistake:** Decorative icons, chart + badge + menu crammed in. Choose subtle border OR subtle surface, not both.

```html
<div class="p-5 border border-subtle rounded-lg bg-surface">
  <div class="text-xs text-muted-foreground mb-1">Total Revenue</div>
  <div class="text-2xl font-semibold tabular-nums">$12,450</div>
</div>
```

## 6. Badge / Status

- **Size:** Compact, 20-24px height.
- **Color:** Muted/neutral by default. Semantic color ONLY for real status (success/error/warning/active).
- ❌ **Common Mistake:** Rainbow badges on every data point.

## 7. Empty State

- **Title:** Short, specific.
- **Description:** One sentence.
- **CTA:** One primary CTA if appropriate.
- **Icon:** Optional quiet icon.
- **Spacing:** Large breathing room around it.
- ❌ **Common Mistake:** Generic blob illustrations, multiple CTAs.

## 8. Search + Filter Bar

- **Search Input:** With icon, 36-40px height.
- **Filters:** Beside it as ghost buttons or selects. Same height. Aligned on one row.
- ❌ **Common Mistake:** Oversized search, filters wrapping awkwardly to a new row.
