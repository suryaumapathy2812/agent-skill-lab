# Langfuse

## UI Role

Langfuse is an open-source LLM engineering and observability platform. It is a strong reference for technical AI metrics, traces, and session insight UI.

## Layout Pattern

- Tracks sessions, token usage, traces, reasoning steps, prompts, and outputs.
- Uses nested grid/table systems to present complex technical data.
- Makes observability information feel lightweight despite high density.

## Why It Works

- It handles deeply nested AI metadata without defaulting to bulky tables.
- Trace information is structured into rows, panels, and expandable detail.
- Technical users can scan quickly and inspect only when needed.

## Component Polish Notes

- Nested tables need indentation, muted borders, and expandable rows.
- Token and latency metrics should be compact and comparable.
- Trace timelines need visual hierarchy without excessive color.
- Use badges sparingly for model, status, and environment metadata.
- Detail drawers are better than overloading the table row.

## Skill-Building Takeaway

For AI observability, create trace, span, metric, prompt, response, and evaluation primitives that support nested inspection without visual clutter.

## Detailed UI Construction Notes

Langfuse is a reference for technical density. The UI must show traces, spans, model metadata, token usage, latency, scores, prompts, and outputs without turning into a wall of JSON. The main rule is: compact overview first, deep inspection on demand.

Trace tables should use row heights around 42px to 54px. Primary columns should include name/event, timestamp, model/status, latency, tokens/cost, and score. Metadata should use muted small text, around 11px to 12px. Avoid showing full prompts in the table row.

Nested spans need indentation and visual continuity. Use subtle left guides, indentation increments around 16px to 24px, and collapsible controls. Do not add a heavy card around each span. The trace should feel like a structured tree/grid hybrid.

Prompt and response detail panels should use split sections with labels, token counts, timing, and rendered text/code. JSON blocks should use monospace 12px to 13px with careful line-height and muted syntax. Copy buttons should be visible on hover or in the section header.

Badges for model, environment, status, and score should be compact. Use neutral badge styling by default; reserve color for errors, warnings, and failed evaluations. A model badge should not look like a primary CTA.

What to copy: nested trace inspection, compact technical badges, metrics as small comparable tokens, detail drawers for prompts/responses.

What to avoid: raw JSON-first UI, giant prompt previews in tables, excessive colored badges, or card-per-span layouts.

## Additional Decision Patterns

Langfuse shows that technical density can still be modern if detail is progressively disclosed. Trace rows, nested spans, and evaluation scores should not all become cards. A nested list/table hybrid is better because it preserves sequence, hierarchy, and scan speed.

Raw JSON and full prompts should be available, but not first. The first layer should show run identity, status, model, latency, cost/tokens, and score. Full content belongs in drawers, inspectors, collapsibles, or code blocks after selection.

Design rule to extract: for observability, overview first, raw detail on demand. Do not confuse transparency with dumping everything onto the screen.
