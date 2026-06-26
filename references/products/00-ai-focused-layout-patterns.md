# AI-Focused Layout Patterns

This file captures the shared product-architecture layer from the discussed AI and modern SaaS interfaces.

## Core Idea

The strongest AI products are not chat apps. They are workspaces where AI is the input method and the output becomes a native work product.

Weak AI UI:

```txt
User types -> AI replies -> User reads
```

Strong AI UI:

```txt
User states intent -> system creates structured work product -> user edits, acts, or shares
```

## Dominant Layout

```txt
[ Intent / chat / controls ] | [ Artifact / output / editor / visualization ]
```

The left pane captures intent. The right pane contains the actual product value.

## Repeated Patterns

- Split-pane workspace for prompt plus artifact.
- Progressive disclosure through slide-out panels and drawers.
- Collapsible navigation to protect canvas real estate.
- Floating command input for quick AI actions.
- Inline AI where the user is already working.
- Artifact-first rendering instead of message-only rendering.
- Smooth transitions when panels appear, collapse, or reveal output.
- Structured output renderers for charts, documents, code, tables, citations, transcripts, and traces.

## Artifact-First Output Types

AI output should be represented as typed UI, not always as prose in a chat bubble.

```ts
type Artifact =
  | { type: "document"; markdown: string }
  | { type: "chart"; spec: ChartSpec }
  | { type: "table"; columns: Column[]; rows: Row[] }
  | { type: "code"; files: FileTree }
  | { type: "sources"; items: Source[] }
  | { type: "insights"; items: Insight[] }
  | { type: "transcript"; segments: Segment[] }
```

## Engineering Implications

- Conversation state, artifact state, preview state, and streaming state should be separate.
- Artifacts should be first-class entities, not blobs embedded in messages.
- Panels need state preservation when hidden or collapsed.
- Command palettes need a central registry and contextual scopes.
- Data-heavy artifact renderers need shared table, chart, card, source, and trace primitives.

## Product References

- v0: left chat, right React component preview/code.
- Claude: artifact panel reveals generated code/documents when ready.
- Julius AI: prompt left, charts/tables/analysis right.
- Lobe Chat: chat with plugin/function output panels.
- Reflect Notes: document editor plus AI workspace.
- Cursor: inline AI composer instead of detached assistant window.
- Granola, AudioPen, Superwhisper: capture input disappears into structured notes or text output.
