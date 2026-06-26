# Perplexity AI

## UI Role

Perplexity is a reference for content-first AI search with citations and dense source-backed answers.

## AI Layout Pattern

- Search input stays simple.
- Answers are structured around citations, sources, related questions, and media.
- Dense information is broken into subtle cards and sections.

## Why It Works

- It solves the citation problem without overwhelming the primary answer.
- The user can verify sources close to the answer.
- Related content is discoverable without dominating the reading experience.

## Component Polish Notes

- Source cards should be compact and structured.
- Dense text needs strong typographic rhythm.
- Citations should be close to claims but visually secondary.
- Avoid heavy cards around every paragraph.
- Use subtle grouping and metadata hierarchy.

## Skill-Building Takeaway

AI answer UIs need a source-reference model with structured citations, quotes, document locations, confidence, and source preview cards.

## Detailed UI Construction Notes

Perplexity's design challenge is dense answer presentation without looking like a research database. The answer column should have a readable max width, often around 680px to 820px, with source cards and related material placed nearby but visually subordinate.

The primary answer should use excellent text rhythm: 15px to 16px body text, 1.55 to 1.7 line-height, and paragraphs spaced around 10px to 16px. Headings should be modest, not blog-like. The search/query text can be more prominent but still restrained.

Citation chips should be small and close to the claims they support. They should not interrupt the line-height aggressively. A citation marker can be 16px to 20px inline size with 11px to 12px text. On hover or click, show the source preview rather than expanding large content inline.

Source cards need to be compact. A source card should show title, domain, maybe favicon, and a tiny excerpt. Use 8px to 12px internal gaps, 12px to 14px text, and subtle borders. Source cards should feel like evidence, not promotional content.

Related questions, media, and follow-ups should be grouped after the answer or in a secondary rail. Do not visually compete with the answer body. Use muted section headings and compact cards.

What to copy: answer-first hierarchy, citation proximity, subtle source cards, dense text made readable through structure.

What to avoid: giant source cards before the answer, decorative citations, over-carded paragraphs, or high-saturation source metadata.

## Additional Decision Patterns

Perplexity demonstrates source hierarchy. Sources are essential, but they should not dominate the answer. The answer should remain the primary reading path while citations and cards provide trust on demand.

A common mistake is to make every source a large card above the answer. This creates research clutter before the user gets value. Compact citations and secondary source cards solve this better.

Design rule to extract: evidence should be close enough to verify, but quiet enough that it does not interrupt comprehension.
