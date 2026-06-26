# Granola

## UI Role

Granola is a reference for AI meeting notes and transcription-to-insight workflows.

## AI Layout Pattern

- The product transforms raw audio into structured notes.
- It avoids exposing users to a wall of robotic transcript text by default.
- Topic extraction and summarization feel native to a markdown editor.

## Why It Works

- The interface treats the final note as the artifact.
- The raw capture process recedes behind clean, human-readable structure.
- AI insight extraction feels like a natural editing layer rather than a separate bot.

## Component Polish Notes

- Typography is central; note output needs excellent reading rhythm.
- Topic sections should be scannable without feeling like rigid cards.
- Keep controls minimal around the document.
- Use markdown-like structure to make AI output feel human.
- Raw transcript should be available but secondary.

## Skill-Building Takeaway

For transcription products, separate raw transcript, cleaned notes, topics, action items, quotes, and timeline. Default to the polished note artifact.

## Detailed UI Construction Notes

Granola should be understood as a document product, not a recorder product. The recording and transcription machinery should fade away once the meeting note exists. The main pane should use editorial spacing: readable line lengths, calm margins, and section rhythm that makes AI-generated notes feel human-authored.

The note body should use around 15px to 16px text with 1.55 to 1.75 line-height. Section headings can be 15px to 18px with medium weight, not huge. Topic labels should be lightweight and close to the content they describe. Avoid turning every topic into a heavy bordered card.

The left or secondary navigation can hold meeting history, but it should be quiet and compact. Meeting rows should show title, date/time, and maybe status. Avoid verbose previews unless the product is explicitly browsing notes. The selected meeting should use a subtle surface shift.

Raw transcript should be an expandable or secondary view. When shown, use speaker/time segmentation with compact rows, not an endless unstructured wall. Timestamps should be 11px to 12px muted text. Speaker labels should be visually stable so the eye can scan dialogue.

Action items need special treatment because they are operational. Use checkable rows or compact task-like items with minimal borders. Decisions and key points can use text hierarchy rather than cards. The output should feel like notes a sharp human assistant wrote.

What to copy: transcript-to-polished-note transformation, editorial typography, topic extraction as structure, raw transcript as secondary.

What to avoid: dashboarding the meeting, exposing raw transcript first, overusing cards, or making the record state visually dominate after processing.
