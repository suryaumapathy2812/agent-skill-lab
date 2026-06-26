# Hebbia

## UI Role

Hebbia is a reference for AI document analysis using a Matrix-style grid rather than standard chat.

## AI Layout Pattern

- Uses a spreadsheet-like matrix to extract topics across many files.
- Turns AI analysis into a structured comparison surface.
- The grid becomes the main artifact.

## Why It Works

- It proves AI workflows do not need to be chat-first.
- Columns and rows provide strong mental structure for multi-document extraction.
- Users can inspect patterns across documents without reading long answer threads.

## Component Polish Notes

- Tables/grids should use generous whitespace at the group level and compact cells inside.
- Borders must be subtle enough to avoid spreadsheet ugliness.
- Cell content should be clipped, expandable, or inspectable.
- Use muted headers and careful alignment.
- Highlight only meaningful extraction states, confidence, or anomalies.

## Skill-Building Takeaway

Build a Matrix/Grid artifact pattern for AI extraction workflows: documents as rows, questions/topics as columns, extracted answers as structured cells.

## Detailed UI Construction Notes

Hebbia's Matrix pattern needs spreadsheet-level structure with SaaS-level restraint. The grid is the artifact. It should not look like a default data table or an Excel clone. Headers, rows, and cells need strong alignment, subtle borders, and enough whitespace to prevent fatigue.

A practical grid uses row heights around 44px to 64px for compact extraction and larger 72px to 120px cells when answers include multi-line evidence. Column headers should be sticky, around 36px to 48px tall, with 11px to 12px muted labels. Row headers for documents should remain readable and may need fixed width around 220px to 320px.

Cell borders should be extremely subtle. The grid can use horizontal and vertical rules, but they should be low-contrast and consistent. Avoid rounded cards inside cells unless expanding an answer. The matrix should feel continuous.

Extraction cells should distinguish states: empty, pending, complete, low-confidence, error, source-linked. Use restrained indicators: small dots, thin left bars, muted badges, or text tone changes. Do not flood cells with colored backgrounds.

Evidence previews should appear through popovers, side panels, or expandable cell detail. A cell should show the answer first, then a compact source count or confidence indicator. Full quotes and document snippets belong in an inspector panel, not inside every cell.

What to copy: grid as AI artifact, document-by-topic comparison, subtle extraction states, evidence-on-demand.

What to avoid: chat-first extraction, colorful spreadsheet cells, thick table lines, or forcing long citations directly into the matrix.

## Additional Decision Patterns

Hebbia is the exception that proves tables are not bad; the right grid can become the product. The matrix works because the row and column axes both have meaning. It is not a generic table. It is a purpose-built extraction surface.

The key is to avoid spreadsheet visual noise. Cells should carry answer, state, confidence, and source link, but detailed evidence should live outside the cell in an inspector. The grid should be dense but not visually loud.

Design rule to extract: use grids when comparison across two semantic dimensions is the core task. Do not use grids merely because data exists.
