# Lobe Chat

## UI Role

Lobe Chat is an open-source AI framework with a polished, customizable split-pane AI interface.

## AI Layout Pattern

- Chat remains central, but plugins and functional outputs can appear in adjacent panels.
- The interface supports complex widgets alongside the conversation.
- It is a practical reference for production-ready AI app composition.

## Why It Works

- It shows how chat, plugins, tools, and output widgets can coexist.
- The split-pane model prevents functional output from being buried in messages.
- Customization helps the same foundation serve many AI workflows.

## Component Polish Notes

- Plugin output needs consistent containers and action placement.
- Chat messages should not visually overpower interactive widgets.
- Panels should resize or collapse gracefully.
- Tool invocation states need clear but compact feedback.
- Maintain strong consistency across assistant, plugin, and artifact surfaces.

## Skill-Building Takeaway

Use Lobe Chat as a reference for rendering complex AI widgets alongside chat without turning the interface into a cluttered dashboard.

## Detailed UI Construction Notes

Lobe Chat is useful because it shows a modular AI surface. The interface has to support normal conversation, tools, plugins, files, settings, and rendered widgets. The risk is clutter, so the pane system and component hierarchy must be very deliberate.

The conversation area should have generous message width but avoid full-bleed text. A max message width around 720px to 860px keeps long answers readable. Side panels for plugins or artifacts should be collapsible and should not steal focus unless the user is interacting with them.

Plugin output cards should have a consistent shell: compact header, tool name/status, primary content, and actions. Header height around 36px to 44px is enough. Tool-running states should use small status indicators and muted text rather than large banners.

The app can support more color/customization than Linear-like tools, but functional surfaces still need discipline. Chat avatars, plugin icons, and model badges should not all compete. Establish one primary visual marker for tool identity and keep the rest quiet.

Right-hand functional panels should have a clear border seam and stable width, often around 360px to 520px. If rendering complex widgets, provide internal scroll rather than expanding the whole layout unpredictably.

What to copy: modular chat plus tool architecture, plugin cards, collapsible functional panes, customizable but structured UI.

What to avoid: every plugin inventing its own styling, oversized model badges, too many simultaneous panels, or treating tool output like plain markdown.
