# AudioPen

## UI Role

AudioPen is a reference for ultra-minimal voice capture that transforms unstructured speech into polished writing.

## AI Layout Pattern

- The app centers around a simple recording action.
- After processing, the interface transitions into a clean reading/editing pane.
- Raw capture is less important than the refined written output.

## Why It Works

- It has almost no visible interface until needed.
- The massive record action lowers cognitive load.
- The generated text receives strong typographic focus.

## Component Polish Notes

- Record controls should be large, inviting, and emotionally simple.
- Processing states need to feel reassuring, not technical.
- The final text pane should feel like an editorial document.
- Avoid dashboard-like controls around voice notes.
- Keep actions like copy, edit, and export understated.

## Skill-Building Takeaway

For audio-to-text tools, design around a simple capture moment followed by a polished artifact. Do not foreground raw transcription unless the user asks for it.

## Detailed UI Construction Notes

AudioPen's interface should feel almost empty before recording. The primary recording control can be oversized because it is the main action: a circular or pill control around 72px to 120px depending on layout. The surrounding UI should be sparse, with only essential context and maybe recent notes.

The record state must be unmistakable but calm. Use pulse, waveform, elapsed time, or subtle color shift. Avoid aggressive red flashing unless there is a destructive or privacy-related need. The recording indicator should remain visually stable so users trust the capture.

Processing should transition from capture to text gracefully. A short status line like polishing, summarizing, or transcribing feels more human than a raw loading spinner. Keep the same spatial area so users understand the record action is becoming a written artifact.

The final text view should feel editorial. Use 16px to 18px body text, 1.6+ line-height, and a comfortable max width around 640px to 760px. Actions like rewrite, copy, export, and edit should be secondary, possibly in a compact header or hover toolbar.

Recent notes should not look like a crowded dashboard. Use simple list rows with title, timestamp, and short preview. Row height around 52px to 72px works if previews are included.

What to copy: one dominant capture action, calm processing transition, typography-focused final note, almost invisible controls.

What to avoid: dashboard navigation around recording, too many buttons near the microphone, raw transcript as default output, or technical processing logs.
