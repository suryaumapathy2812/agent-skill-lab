# Claude By Anthropic

## UI Role

Claude pioneered the Artifacts UI pattern: chat remains conversational while generated work opens in a right-hand interactive panel.

## AI Layout Pattern

- Main conversation remains available.
- Artifacts slide out into a dedicated right panel.
- Code, documents, and other outputs become separate editable/inspectable surfaces.
- Complexity is hidden until output is ready to interact with.

## Why It Works

- The slide-out animation makes output feel spatially connected to the conversation.
- The artifact panel separates durable work from transient chat.
- Users can keep conversational context while editing or reviewing a generated document.

## Component Polish Notes

- Panel transitions should be smooth and structural, not decorative.
- The artifact panel should preserve state when hidden or resized.
- Use quiet headers and compact action bars.
- Avoid over-framing the generated document or code; the content needs to breathe.
- Streaming and generation states should feel calm and controlled.

## Skill-Building Takeaway

Create a reusable Artifact Panel pattern with animated reveal, persisted state, typed renderers, and low-noise controls.

## Detailed UI Construction Notes

Claude's artifact interface is valuable because it uses space and motion to separate temporary conversation from durable output. The right panel should feel like it emerges from the conversation, not like a modal. On desktop, the artifact area can take 45% to 60% of the viewport once open. The chat narrows but remains readable; it should not collapse into a useless sliver.

The reveal animation matters. Use a transform/width animation around 220ms to 320ms with ease-out. The panel should slide or expand from the right, while opacity and border treatment settle subtly. Avoid bounce effects. The user should perceive that the work product is being placed beside the conversation.

The artifact header should be minimal: title, type indicator, and 2 to 4 actions. Header height should be roughly 44px to 52px. Icons should be small, around 14px to 16px. The title should truncate. Secondary actions should hide behind a menu if they exceed the width. Avoid a heavy toolbar that makes the artifact feel like an IDE unless the artifact is code.

Document artifacts should use strong reading typography: 15px to 16px body, 1.55 to 1.7 line-height, generous max-width, and quiet margins. Code artifacts should use a stable monospace surface, usually with a very subtle background shift. Do not wrap generated documents in card after card; the page itself should become the canvas.

The empty or pending artifact state should not be a blank white panel. Use a centered low-contrast status, maybe an icon and one line of text. Once content is ready, transition from pending to content without shifting the panel frame.

What to copy: spatial artifact reveal, durable output pane, preserved chat context, minimal artifact header.

What to avoid: modalizing the artifact, animating too slowly, adding decorative panel gradients, or showing raw generation clutter before the artifact is usable.
