---
name: ai-design
description: AI workspace product design for AI-first apps, generative UI, artifacts, chat-plus-output layouts, copilots, transcripts, citations, data extraction, agent workflows, and modernizing products into AI-native workspaces inspired by v0, Claude Artifacts, Julius AI, Cursor, Granola, Hebbia, Perplexity, Arc, Raycast, Lobe Chat, AudioPen, Superwhisper, Reflect, PLAIN, Midday, Polar, and Attio.
license: MIT
---

# AI Design

Use this skill to design or modernize products around an AI workspace concept. This skill focuses on product architecture, layout, interaction model, artifact rendering, and AI-native UX.

This is not a visual style skill alone. It answers: where does AI live, how does the user provide intent, how does output become useful, and how does the app avoid feeling like a generic chatbot?

## Core Principle

The strongest AI products are not chat apps. They are workspaces where AI is the input method and the output becomes a native work product.

Weak AI UI:

```txt
User types -> AI replies -> User reads
```

Strong AI UI:

```txt
User states intent -> system creates structured work product -> user edits, inspects, acts, or shares
```

## When To Use

Use this skill when the user asks to:

- Design an AI-first product or AI workspace.
- Add AI to an existing app without making it feel bolted on.
- Build chat plus preview, chat plus artifact, or copilot layouts.
- Create Claude-style artifacts, v0-style generated UI, Julius-style analysis outputs, or Cursor-style inline AI.
- Design transcript, citation, insight extraction, data analysis, document analysis, or agent workflow UI.
- Modernize a SaaS app into an AI-native application.
- Decide between chat, inline AI, command palette, artifact panel, drawer, matrix, table, or document output.

## Product References

Use focused reference files instead of loading everything at once.

Load these files only when relevant:

- `references/ai-design/workspace-blueprints.md` for concrete AI workspace layouts.
- `references/products/00-ai-focused-layout-patterns.md` for cross-product AI layout patterns.
- `references/products/v0.md` for generative UI split-pane patterns.
- `references/products/claude.md` for artifact panels.
- `references/products/julius-ai.md` for data analysis artifacts.
- `references/products/cursor.md` for inline AI.
- `references/products/hebbia.md` for matrix/grid extraction.
- `references/products/perplexity-ai.md` for citation and source-backed answer UI.
- `references/products/granola.md`, `references/products/audiopen.md`, and `references/products/superwhisper.md` for transcript and capture-to-artifact flows.
- `references/products/reflect-notes.md` for document plus AI workspace.
- `references/products/plain.md` for support/conversation workspace patterns.
- `references/products/midday.md` for financial/business workspace patterns.
- `references/products/polar.md` for developer monetization dashboard patterns.
- `references/products/attio.md` for CRM/data workspace view-switching patterns.
- `reports/skills-and-agents-report.md` for repository-level inventory.

## AI Workspace Models

Choose the model based on the product's primary work product.

### 1. Split-Pane Generative Workspace

Best for generated UI, code, documents, data analysis, charts, and previews.

Reference products: v0, Claude, Julius AI, Lobe Chat.

```txt
[ Intent / chat / controls ] | [ Artifact / output / editor / visualization ]
```

Guidelines:

- Left pane captures intent.
- Right pane contains the actual work product.
- The artifact should visually dominate.
- Chat should be useful but not equal in hierarchy to the output.
- Desktop chat pane can often be 320px to 440px.
- Artifact pane should take remaining width and preserve state.

### 2. Artifact Panel

Best for generated documents, code, structured answers, and editable outputs.

Reference product: Claude Artifacts.

Guidelines:

- Artifact reveals only when useful.
- Panel should slide/expand smoothly from the side.
- Keep conversation context visible.
- Header should be compact: title, type, a few actions.
- Output state should persist when panel hides or resizes.

### 3. Inline AI

Best for editors, code, writing, design tools, and workflows where the user must stay in flow.

Reference product: Cursor.

Guidelines:

- AI appears near the current selection or task context.
- Use floating composer, inline command, ghost text, or diff UI.
- Avoid bulky assistant panels when inline output is better.
- Suggestions should be accept/reject/editable.
- AI must not obscure the primary work surface.

### 4. Command-First AI

Best for power tools, productivity apps, navigation-heavy products, and action execution.

Reference products: Raycast, Linear, Arc, Cursor.

Guidelines:

- Use Cmd+K or command palette as a primary interaction.
- Commands should be contextual to the current surface.
- Avoid showing every action as a persistent button.
- Use a central command registry.

Example shape:

```ts
type Command = {
  id: string
  title: string
  keywords?: string[]
  shortcut?: string
  scope?: "global" | "editor" | "artifact" | "table" | "thread"
  run: () => void
}
```

### 5. Matrix/Grid AI

Best for document analysis, bulk extraction, comparison, and repeated question-over-file workflows.

Reference product: Hebbia.

Guidelines:

- Rows are documents/items.
- Columns are questions/topics/fields.
- Cells contain extracted answers, status, confidence, and source links.
- Evidence appears in a side inspector, not crammed into every cell.
- Avoid chat-first interaction when grid comparison is the actual product.

### 6. Content-First Answer UI

Best for search, research, Q&A, citations, and knowledge products.

Reference product: Perplexity.

Guidelines:

- Answer body is primary.
- Sources are close but visually secondary.
- Use structured citation cards and inline references.
- Related questions/media should not compete with the main answer.

### 7. Capture-To-Artifact UI

Best for audio, transcription, voice notes, meeting notes, and ambient dictation.

Reference products: Granola, AudioPen, Superwhisper.

Guidelines:

- Capture UI should be simple and reassuring.
- Raw transcript is secondary.
- Final output should be structured: notes, topics, action items, decisions, quotes, timeline.
- Floating or ambient UI is often better than a full app shell for dictation.

### 8. Document Plus AI Workspace

Best for notes, writing tools, docs, knowledge bases, and editors.

Reference product: Reflect.

Guidelines:

- Main document remains primary.
- AI side panel supports the document but does not cover it.
- AI actions should be contextual to selection or current note.
- Avoid chat bubbles over the writing surface.

## Artifact-First Output

Do not render every AI response as a message. Choose the right artifact type.

```ts
type Artifact =
  | { type: "document"; markdown: string }
  | { type: "chart"; spec: ChartSpec }
  | { type: "table"; columns: Column[]; rows: Row[] }
  | { type: "code"; files: FileTree }
  | { type: "sources"; items: SourceReference[] }
  | { type: "insights"; items: Insight[] }
  | { type: "transcript"; segments: TranscriptSegment[] }
  | { type: "trace"; spans: TraceSpan[] }
```

Good AI products route model output into typed UI:

- Analysis -> chart/table/metric cards.
- Code -> preview/file tree/diff.
- Research -> answer/source cards/citations.
- Audio -> note/topics/actions/transcript.
- Documents -> matrix/grid/extracted evidence.
- Agent workflows -> timeline/steps/state/logs.

## Layout Rules

### Pane Proportions

Use proportions based on output type:

- Chat plus artifact: prompt pane 320px to 440px, artifact gets rest.
- Document plus AI: editor 640px to 780px, AI panel 320px to 420px.
- Thread/feed plus drawer: main feed 640px to 840px, drawer 380px to 560px.
- Command palette: 640px to 760px wide, top offset around 12% to 20%.
- Floating dictation/AI modal: 360px to 560px wide.

### Progressive Disclosure

Show complexity only when needed:

- Collapse sidebars.
- Hide secondary actions in menus.
- Reveal inspectors on selection.
- Show raw transcript/source/detail only on demand.
- Use drawers for detail instead of full page transitions when preserving context matters.

### Motion

Motion should explain spatial change:

- Panel reveal: 180ms to 280ms.
- Artifact opening: 220ms to 320ms.
- Command palette entrance: 120ms to 220ms.
- Inline composer: 120ms to 180ms.

Avoid decorative bounce. Prefer ease-out and opacity/transform/width transitions.

## AI State Design

Design all core AI states explicitly:

- Idle.
- Listening/capturing.
- Thinking/planning.
- Tool running.
- Streaming.
- Artifact ready.
- Needs user confirmation.
- Error/retry.
- Partial result.
- Source unavailable.
- Low confidence.
- Empty/no result.

State UI should be calm and precise. Avoid vague spinners when the system can expose a meaningful state.

## Source, Evidence, And Trust

For research, document analysis, analytics, and observability, source handling is part of the UI.

Use structured references:

```ts
type SourceReference = {
  id: string
  title: string
  url?: string
  documentId?: string
  quote?: string
  confidence?: number
  location?: {
    page?: number
    row?: number
    timestamp?: number
  }
}
```

Guidelines:

- Keep evidence close to claims.
- Keep sources visually secondary to the answer.
- Use side inspectors for detailed evidence.
- Show confidence only when it helps decision-making.
- Do not bury citations at the very bottom if trust is central.

## Engineering Architecture

Separate these concerns:

- Conversation state.
- Artifact state.
- Preview/render state.
- Streaming state.
- Tool invocation state.
- Selection/context state.
- Version/history state.
- Source/evidence state.

Avoid storing artifacts as opaque message text. Artifacts should have IDs, versions, types, metadata, and renderers.

Recommended shapes:

```ts
type WorkspaceState = {
  conversationId: string
  activeArtifactId?: string
  artifacts: ArtifactRecord[]
  selectedContext?: SelectionContext
  toolRuns: ToolRun[]
}

type ArtifactRecord = {
  id: string
  type: Artifact["type"]
  title: string
  version: number
  status: "generating" | "ready" | "error"
  createdAt: string
  updatedAt: string
  data: Artifact
}
```

## Visual Quality Pairing

This skill defines the AI product architecture. Pair with `modern-design` when the task also needs visual component polish.

Use `ai-design` to decide:

- Where the AI lives.
- What output form the AI creates.
- How panels and workflows are structured.
- How state, artifacts, sources, and tools are represented.

Use `modern-design` to decide:

- How the components look.
- How borders, shadows, typography, spacing, density, and dark mode should be refined.
- How shadcn components should be composed and polished.

## Workflow

When designing or modernizing an AI product:

1. Identify the user's real work product: document, code, chart, table, note, source-backed answer, transcript, trace, or workflow.
2. Choose the right AI workspace model.
3. Decide what should be persistent, collapsible, inline, or revealed on demand.
4. Define artifact types and renderers.
5. Define AI states and trust/source states.
6. Design the primary layout with responsive behavior.
7. Apply component polish with `modern-design` if visual refinement is part of the task.

## Review Checklist

- Is the app a workspace, or just a chatbot?
- Is the AI output rendered as the right artifact type?
- Does the layout preserve the user's context?
- Is the conversation visually secondary when the artifact is primary?
- Are panels collapsible or progressively disclosed?
- Are raw transcripts, logs, and sources secondary but accessible?
- Are AI states explicit and useful?
- Does the product support editing, inspecting, acting, or sharing the output?
- Are command/inline interactions used where they preserve flow?
- Does the architecture separate messages from artifacts?
