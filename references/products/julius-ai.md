# Julius AI

## UI Role

Julius AI is a strong reference for data analysis inside a dual-pane AI workspace.

## AI Layout Pattern

- User asks questions in a conversational pane.
- The output pane generates charts, tables, graphs, and analysis artifacts.
- Heavy visualization stays clean because the interface separates prompting from inspection.

## Why It Works

- It proves dense analytical output can live in a clean AI interface.
- The user can refine a question without losing sight of the generated chart or table.
- The right pane establishes trust because data artifacts are concrete and inspectable.

## Component Polish Notes

- Charts should live in quiet containers with restrained labels.
- Tables should be dense but aligned, not boxed repeatedly.
- Use color only for data series or semantic meaning.
- Keep chart controls compact and contextual.
- Prefer subtle cards and grouped sections over decorative dashboards.

## Skill-Building Takeaway

For analysis products, render AI output as typed data artifacts: chart, table, metric card, extracted insight, and explanation. Avoid returning only prose.

## Detailed UI Construction Notes

Julius AI needs a slightly different split-pane ratio than code-generation tools. The conversation pane can stay around 340px to 440px, but the output area should be optimized for charts and tables. On desktop, the right pane should feel like an analysis notebook: stacked output blocks with consistent vertical rhythm, usually 16px to 24px between generated artifacts.

Chart cards should be quiet. A good chart container uses a subtle surface, 1px low-opacity border or faint shadow, 12px to 16px radius, and 16px to 20px internal padding. Axis text should be small, around 11px to 12px. Chart labels should use muted text and avoid saturated color unless the series needs distinction. Legends should sit close to the chart, not as large blocks.

Metric summaries should be compact and arranged before detailed charts. A metric block might use a 12px label, 24px to 32px value, and a 12px comparison. The comparison color should be semantic and quiet, not neon. Use green/red only if direction is meaningful; neutral deltas should remain gray.

Tables should not look like spreadsheets by default. Use row height around 36px to 44px for dense analytical tables. Borders should be horizontal only, and even those should be very subtle. Header cells should be 11px to 12px, muted, possibly semibold. Numeric columns should align right. Text columns should align left and truncate gracefully.

The conversational left pane should preserve analysis history without becoming the focus. User questions can be slightly stronger than assistant explanations, but generated charts should carry the final answer. A common mistake would be over-explaining in prose and under-investing in the artifact state.

What to copy: question-to-artifact workflow, clean chart/table containers, low-color analytical palette, compact metric hierarchy.

What to avoid: dashboard confetti, thick chart cards, large legends, colorful table badges everywhere, or treating every output as a chat message.
