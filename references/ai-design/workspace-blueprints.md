# AI Workspace Blueprints

Use these blueprints when modernizing a product around AI. Choose based on the work product, not the model output format.

## ChatArtifactLayout

Best for generated UI, code, documents, charts, and previews.

Desktop anatomy:

```txt
[ Chat / prompt rail 320-440px ] [ Artifact canvas flexible width ]
```

Rules:

- Chat captures intent.
- Artifact carries product value.
- Artifact state persists across chat turns.
- Preview/code/source tabs live near the artifact, not in chat.

Mobile:

- Use tabs or segmented control: Chat / Artifact.
- Keep composer fixed near bottom when in chat mode.

## ArtifactPanelLayout

Best for Claude-style generated documents and code.

Rules:

- Panel opens only when artifact exists or is useful.
- Keep chat context visible on desktop.
- Use compact header and stable content area.
- Avoid modal treatment unless the artifact demands focus lock.

## InlineAIComposer

Best for code editors, writing tools, and selection-based AI actions.

Rules:

- Composer appears near selected content.
- Output appears as diff, ghost text, rewrite preview, or inline suggestion.
- Accept/reject controls are close to the change.
- Do not cover the primary work surface.

## CommandFirstAI

Best for power-user apps and action-heavy tools.

Rules:

- Cmd+K exposes global and contextual AI actions.
- Commands are scoped to current surface.
- The command palette hides complexity without removing power.

## MatrixExtractionGrid

Best for document analysis and repeated extraction.

Anatomy:

```txt
Rows: documents/items
Columns: questions/topics/fields
Cells: extracted answer, confidence, source link, status
```

Rules:

- Evidence lives in inspector panel.
- Cells stay compact.
- Confidence/status is visible but not visually loud.

## ResearchAnswerPage

Best for source-backed answers.

Rules:

- Answer body is primary.
- Citation markers stay close to claims.
- Source cards are compact and secondary.
- Related questions/media appear after or beside the answer, not above it.

## TranscriptToNotesWorkspace

Best for meetings, voice notes, and audio analysis.

Rules:

- Capture state is simple.
- Final note is primary.
- Raw transcript is secondary and expandable.
- Output sections: summary, topics, decisions, action items, quotes, timeline.

## AgentRunTimeline

Best for agentic workflows and automations.

Rules:

- Show run state, steps, tool calls, artifacts, and errors.
- Timeline/list first; raw logs only on demand.
- Each step should have status, duration, and output reference.

## DocumentAIAssistant

Best for notes, docs, and editors.

Rules:

- Document remains primary.
- AI side panel supports selection/current context.
- Suggested changes should be previewable and reversible.
