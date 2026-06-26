# Component Recipes

Use these recipes when turning design principles into concrete UI.

## Metric Card

Use for one primary number and minimal context.

Structure:

- Label: 12px to 13px muted.
- Value: 24px to 32px, semibold, tabular numbers.
- Delta/context: 12px to 13px.
- Padding: 16px to 20px.
- Border: subtle or none if inside grouped region.

Avoid:

- Icon, chart, description, badge, menu, and comparison all in the same tiny card.

## List Item

Use before table when the item has narrative hierarchy.

Structure:

- Leading indicator/avatar/icon: 20px to 32px.
- Primary title: 13px to 15px.
- Secondary metadata: 12px to 13px muted.
- Optional preview: muted, one to two lines.
- Row height: 48px to 72px depending on richness.

Avoid:

- Turning lists into card soup.
- Overusing colored badges.

## Table

Use for comparison and uniform fields.

Structure:

- Header text: 11px to 12px muted semibold.
- Row height: 40px to 52px.
- Numeric alignment: right.
- Separators: horizontal only by default.
- Actions: visible on hover or in trailing menu.

Avoid:

- Vertical grid lines.
- Full content previews inside cells.
- Center-aligning numeric data.

## Card

Use for meaningful grouping.

Structure:

- Radius: 12px to 16px.
- Padding: 16px to 24px.
- Header: title plus optional description.
- Edge: subtle border or subtle shadow, not both strongly.

Avoid:

- Wrapping every small thing in a card.
- Nested cards unless the nested object is truly independent.

## Sidebar

Use as compressed navigation or workspace context.

Structure:

- Expanded width: 240px to 320px.
- Item height: 28px to 36px.
- Active state: subtle surface/pill.
- Groups: separated by whitespace and small labels.

Avoid:

- Bright active blocks.
- Too many persistent actions.

## Command Palette

Use for global or contextual action discovery.

Structure:

- Width: 640px to 760px desktop.
- Top offset: 12% to 20% viewport height.
- Input row: 52px to 64px.
- Result row: 44px to 52px.
- Selected row: subtle background.

Avoid:

- Card-like result rows.
- Bright selected state.

## Dialog And Sheet

Use modal dialog for blocking decisions. Use sheet/drawer for contextual detail.

Dialog:

- Best for confirmation, creation, focused forms.
- Keep width constrained and actions clear.

Sheet/drawer:

- Best for details, inspectors, thread replies, source evidence.
- Preserve main context.

Avoid:

- Opening a modal for every detail view.

## Empty State

Use to guide next action.

Structure:

- Title: short and specific.
- Description: one sentence.
- Action: one primary action if useful.
- Illustration/icon: optional and quiet.

Avoid:

- Huge generic illustrations.
- Multiple competing CTAs.
