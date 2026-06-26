# Reflect Notes

## UI Role

Reflect Notes is a reference for AI-assisted networked note-taking with a document-first interface.

## AI Layout Pattern

- Main document/editor remains the primary surface.
- AI assistant appears alongside the editor rather than covering it.
- The document shifts or makes room for the AI workspace while preserving grid discipline.

## Why It Works

- The AI assistant feels integrated into writing, not pasted on top.
- The user can reference and modify notes without losing context.
- Split workspace behavior keeps content and AI assistance visually related.

## Component Polish Notes

- Typography and editor rhythm are more important than decorative UI.
- Assistant panels should be quiet, narrow, and context-aware.
- Linked notes and backlinks need subtle metadata treatment.
- Avoid floating chat bubbles that cover the writing surface.
- Use rigid alignment and whitespace to keep the workspace calm.

## Skill-Building Takeaway

For writing tools, the AI panel should support the document, not compete with it. Preserve the editor as the primary artifact.

## Detailed UI Construction Notes

Reflect's UI should be approached as a writing surface with AI nearby. The editor must remain primary. AI assistance should push, resize, or sit beside the document rather than covering the text.

The editor column should have a comfortable reading/writing width, often around 640px to 780px. Body text should be 15px to 17px with generous line-height around 1.6. Headings should be clear but not CMS-like. The page should feel like a focused note, not a document inside a dashboard card.

The AI panel should be narrower than the editor, around 320px to 420px. It can contain suggestions, summaries, related notes, or commands. Its border seam should be subtle. It should use compact cards or sections, but avoid chat bubbles that visually fight the document.

Linked notes and backlinks should be quiet. Use small pills, muted metadata, or a side list. A backlink row can be around 32px to 44px high with title and context snippet. Avoid colorful graph-like noise unless the user explicitly opens a graph view.

AI actions should be contextual: summarize selection, rewrite paragraph, find related notes, extract tasks. These should appear near selection or in the side panel, not as a persistent global assistant dominating the screen.

What to copy: document-first layout, assistant as side workspace, calm typography, linked-note metadata restraint.

What to avoid: floating chat covering the editor, over-carded notes, excessive visual graph elements, or AI controls that make writing feel secondary.

## Additional Decision Patterns

Reflect is a reminder that AI UI should not cover the user's work. For writing surfaces, inline actions and side assistance beat floating chat bubbles. The document should keep its rhythm and width; AI should support the current selection, backlink, or note context.

Lists are also more appropriate than tables for notes, backlinks, and related ideas. A note object has title, context snippet, date, backlink relationship, and semantic relevance. A table would make the information feel administrative instead of intellectual.

Design rule to extract: in writing tools, preserve document primacy. AI should enter as a side workspace or contextual action, not a competing chat surface.
