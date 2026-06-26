# Superwhisper

## UI Role

Superwhisper is a native macOS AI dictation tool that keeps users in their current context.

## AI Layout Pattern

- Lives as a floating command bar or translucent modal.
- Captures audio and returns text without forcing users into a dedicated app window.
- The AI workflow is ambient and context-preserving.

## Why It Works

- It respects the user's current task.
- It avoids a heavy app shell for a lightweight dictation job.
- Transcription feels like a system capability rather than a separate destination.

## Component Polish Notes

- Floating surfaces should be translucent, compact, and high-trust.
- Recording state must be unmistakable.
- Keep secondary settings hidden until needed.
- Text insertion/confirmation states need to be immediate.
- Avoid adding navigation chrome around a transient workflow.

## Skill-Building Takeaway

For ambient AI tools, use floating contextual UI instead of full-page layouts. Preserve the user's current workspace.

## Detailed UI Construction Notes

Superwhisper is about transient UI. The capture surface should feel like a system overlay, not a destination app. A floating modal can be compact, around 360px to 560px wide, with rounded corners, translucent material, and strong but soft shadow.

The UI should have three very clear states: idle/listening, processing, and ready/inserted. Listening needs an obvious microphone or waveform state plus elapsed time. Processing can use a subtle animated text indicator. Ready should provide either the transcribed text preview or confirmation that the text has been inserted.

Keyboard behavior is central. The user should be able to start, stop, cancel, and accept without mouse travel. Shortcuts should be shown as tiny muted keycaps, not button-heavy controls.

Because it overlays other apps, contrast and blur must be tuned carefully. The panel should be readable over varied backgrounds. Use a surface that is translucent in spirit but still opaque enough for text. Avoid ultra-thin glass that looks nice but fails over complex content.

Settings and model options should be tucked away. The default overlay should not show configuration unless the user asks. A small secondary icon or command can reveal advanced settings.

What to copy: ambient overlay, state clarity, keyboard-first capture, context preservation.

What to avoid: full app window for dictation, cluttered recording controls, illegible glass, or forcing users to manage transcript files manually.
