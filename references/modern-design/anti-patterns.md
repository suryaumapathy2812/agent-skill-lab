# Modern UI Anti-Patterns

Use this file when reviewing or improving a UI that feels generic, cluttered, or low quality.

## Card Soup

Symptom:

- Every section is a card.
- Every metric is a card.
- Every table is inside a card inside another card.

Fix:

- Use one region container.
- Let spacing and headings group content.
- Use cards only for meaningful, self-contained objects.

## Table-First Thinking

Symptom:

- Every collection becomes a table.
- Rows contain messy custom content inside cells.
- Mobile behavior is poor.

Fix:

- Use list items when records need hierarchy, preview, or custom layout.
- Use tables when comparison across uniform fields matters.
- Use matrices for repeated extraction/comparison.

## Divider Overdose

Symptom:

- Lines separate everything.
- The page feels like wireframe scaffolding.

Fix:

- Replace some dividers with spacing.
- Use muted separators only where scanning needs reinforcement.
- Let alignment create structure.

## Badge Confetti

Symptom:

- Many colors and pills compete for attention.
- Categories, statuses, tags, and metadata all look equally important.

Fix:

- Use muted badges by default.
- Reserve semantic color for real status.
- Convert low-importance badges into muted text.

## Dashboard Rainbow

Symptom:

- Charts, metrics, badges, and icons all use saturated color.

Fix:

- Use a monochrome foundation.
- Use color only for series, state, risk, and active focus.
- Reduce chart palette and make axes/grid quiet.

## Oversized SaaS Padding

Symptom:

- Every card has 32px+ padding.
- Tables have huge row heights.
- Dense products feel like landing pages.

Fix:

- Use compact app padding.
- Increase spacing only between major groups.
- Use smaller type with better hierarchy.

## Decorative Icons

Symptom:

- Icons appear everywhere but do not help scanning.

Fix:

- Use icons for recognition, status, or action.
- Remove icons that do not change interpretation.

## Modal Everything

Symptom:

- Details, filters, thread replies, previews, and settings all open modals.

Fix:

- Use drawers for contextual detail.
- Use popovers for lightweight options.
- Use inline expansion for local detail.
- Reserve modals for blocking decisions.

## Pure Black Dark Mode

Symptom:

- Dark UI uses pure black background with bright gray borders.

Fix:

- Use layered near-black surfaces.
- Reduce border contrast.
- Use subtle surface elevation and controlled glow.

## AI Chat Trap

Symptom:

- Every AI output is a chat message.

Fix:

- Convert outputs into artifacts: document, table, chart, code, citation cards, transcript notes, matrix cells.
