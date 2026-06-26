# RAIL Model For Modern UI

RAIL means Response, Animation, Idle, and Load. Use it to make polished UI feel fast, not just look good.

## Why RAIL Matters

Modern product design quality is partly interaction performance. A visually refined interface feels broken if typing lags, panels stutter, charts block, or loading states jump.

Use RAIL when designing or reviewing any interactive product surface.

## Response

Response is how quickly the UI reacts to user input.

Target:

- Immediate visual feedback under 100ms.
- Typing should never be blocked by expensive renders.
- Button press, selection, hover, and focus states should feel instant.
- Optimistic state is preferred when failure is rare and reversible.

Design guidance:

- Show pressed/selected state immediately.
- Disable or show pending only after the action begins.
- Preserve control dimensions during loading.
- For AI actions, acknowledge intent quickly even if generation takes time.

Engineering guidance:

- Avoid synchronous heavy work in input handlers.
- Defer non-urgent updates.
- Keep command palette filtering fast.
- Virtualize large lists when needed.
- Debounce expensive search but not basic typing feedback.

## Animation

Animation explains spatial change and state transition.

Target:

- Hover/focus transitions: 120ms to 180ms.
- Dialog/command entrance: 120ms to 220ms.
- Drawer/panel reveal: 180ms to 280ms.
- Artifact panel reveal: 220ms to 320ms.

Design guidance:

- Animate transform and opacity where possible.
- Use width animation only when the layout relationship matters.
- Avoid bounce in serious SaaS/productivity tools.
- Respect reduced motion preferences.

Product examples:

- Claude's artifact reveal works because animation explains where the generated output lives.
- Campsite's thread drawer preserves feed context.
- Cursor's inline AI must appear quickly and avoid disrupting code flow.

## Idle

Idle time is when the app can prepare future work without blocking current interaction.

Use idle time to:

- Preload likely artifact renderers.
- Warm command palette data.
- Precompute table indexes.
- Cache source previews.
- Prepare chart libraries after initial UI is usable.
- Preload heavy editor/code components on hover/focus.

Avoid:

- Running background work that competes with typing or scrolling.
- Hydrating heavy panels the user may never open.
- Updating hidden panels constantly.

## Load

Load is the experience before the app or artifact is usable.

Good loading states:

- Match final layout shape.
- Preserve space to prevent layout shift.
- Show meaningful state when possible: loading sources, generating chart, transcribing audio, running tool.
- Stream progressively when partial output is useful.

Bad loading states:

- Generic spinner in the middle of a complex page.
- Skeletons that do not match final layout.
- Layout jumping when content arrives.
- No distinction between loading, empty, error, and partial result.

AI-specific load states:

- Thinking.
- Planning.
- Tool running.
- Streaming text.
- Rendering artifact.
- Waiting for confirmation.
- Retrying.
- Partial result ready.

## RAIL Checklist

- Does every user action get feedback within 100ms?
- Are animations fast, purposeful, and non-blocking?
- Does the app use idle time to prepare likely next actions?
- Do loading states preserve layout and communicate real progress?
- Are AI generation states more specific than a spinner?
- Does the UI remain responsive while streaming or rendering artifacts?
