# Cursor

## UI Role

Cursor is an AI-first code editor that integrates AI without breaking developer flow.

## AI Layout Pattern

- AI appears inline with code through a floating or contextual input.
- Cmd+K style interaction lets users invoke AI exactly where they are working.
- The assistant does not require a bulky persistent chat window.

## Why It Works

- The user stays in flow because AI is embedded in the primary work surface.
- The UI avoids competing with code, which remains the main artifact.
- The floating command input feels lightweight and immediate.

## Component Polish Notes

- Use translucent or low-noise floating surfaces.
- Keep AI controls compact and context-aware.
- Avoid large branded assistant UI inside a productivity surface.
- Inline suggestions should feel native to the editor.
- Diffs, accept/reject actions, and previews need extremely clear states.

## Skill-Building Takeaway

AI should not always live in a side chat. For creation tools, inline AI controls are often better because they preserve the user's working context.

## Detailed UI Construction Notes

Cursor's key lesson is that AI UI should respect the editor as sacred workspace. The code surface remains the primary artifact. AI appears as a temporary layer near the current selection or current intent. A floating composer should feel like an editor-native affordance, not a web chat component pasted into an IDE.

The inline composer should be compact: around 480px to 720px wide depending on context, with 12px to 16px padding, 10px to 14px radius, and a translucent or elevated dark surface. The input should have minimal chrome. If the user is invoking Cmd+K inside code, the box should appear close enough to the selected code that the relationship is obvious.

Diff UI must be extremely legible. Added and removed regions should use restrained green/red backgrounds with low saturation. Avoid large red/green filled blocks that make code hard to read. Accept/reject controls should be close to the changed region and compact, around 28px to 32px tall.

AI suggestions should preserve editor rhythm. Do not insert large assistant avatars, chat bubbles, or cards inside code. Use gutters, inline decorations, ghost text, and slim toolbars. If a side chat exists, it should be collapsible and secondary.

Motion should be fast and functional: composer appears within 120ms to 180ms, suggestions stream inline, and accepted changes settle without dramatic animation. Developer tools should feel instant.

What to copy: inline AI invocation, contextual composer, diff-first output, low-noise assistant presence.

What to avoid: bulky chat windows, assistant branding in the code area, slow transitions, or generic chatbot bubbles next to code.
