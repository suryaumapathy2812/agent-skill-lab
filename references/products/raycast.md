# Raycast

## UI Role

Raycast is the clearest reference for the command palette as a complete product interaction model.

## Layout Pattern

- No traditional navigation is required for most actions.
- A single floating input drives discovery and execution.
- Results, extensions, and AI actions appear as structured command outputs.

## Why It Works

- It removes button clutter.
- It rewards keyboard-first users.
- The interaction feels instant because the interface is almost entirely intent-driven.

## Component Polish Notes

- The command bar needs perfect spacing, focus state, and keyboard affordance.
- Result rows should be compact, aligned, and scannable.
- Icons should help recognition without adding color noise.
- Secondary metadata should be muted and right-aligned or visually subordinate.
- Empty and loading states need to feel immediate.

## Skill-Building Takeaway

Build a command registry as a first-class primitive. Use contextual commands to hide complexity without losing power.

## Detailed UI Construction Notes

Raycast's UI is almost entirely interaction quality. The floating command window must feel precisely measured. A strong desktop command palette can be around 640px to 760px wide, centered horizontally, with top offset around 12% to 20% of viewport height. It should feel reachable, not exactly centered like a modal dialog.

The search input row should be tall enough to feel primary: 52px to 64px. Text should be around 16px, placeholder muted, with no heavy border inside the panel. The outer panel should carry elevation through shadow and surface contrast. Radius can be around 14px to 20px.

Result rows should be compact and keyboard-scannable. A row height around 44px to 52px works well. Icons should be 18px to 22px with restrained color. Titles should be 13px to 14px, metadata 11px to 12px. Keyboard shortcuts should align to the right in muted keycap styling.

The selected row should use a subtle background, not a loud accent. The goal is fast scanning. If actions are grouped, section headers should be tiny, muted, and spaced carefully. Avoid visible borders between every row unless density demands it.

Empty states should remain in the same panel frame. Show a concise message and maybe a shortcut hint. Loading should be instant-feeling: skeleton rows or a small inline spinner near the search field, not a full modal loading screen.

What to copy: command palette as product surface, centered floating panel, compact result rows, right-aligned shortcuts.

What to avoid: turning command results into cards, making the selected state bright, adding persistent navigation for actions that belong in search.
