# Skills And Agents Report

This report is the single inventory for all skills and agents in this repository.

## Skills

### modern-design

Purpose: premium product UI polish for React, Next.js, Tailwind, shadcn/ui, dashboards, SaaS apps, forms, cards, tables, charts, dark mode, and component refinement.

Core focus:

- Improve shadcn-style components without fighting the design system.
- Use subtle borders, disciplined shadows, tighter typography, better density, and semantic color.
- Make dashboards, tables, forms, and SaaS pages feel closer to Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, and Reflect.

Primary file: `skills/modern-design/SKILL.md`

### ai-design

Purpose: AI workspace product design for AI-first apps, generated artifacts, copilots, chat-plus-output layouts, transcripts, citations, extraction flows, and AI-native product modernization.

Core focus:

- Treat AI products as workspaces rather than chatbots.
- Choose between split-pane, artifact panel, inline AI, command-first AI, matrix/grid extraction, content-first answer UI, capture-to-artifact UI, and document-plus-AI layouts.
- Define artifact types, AI states, source/evidence handling, and workspace architecture.

Primary file: `skills/ai-design/SKILL.md`

## Agents

No custom agents have been added yet.

## Product Design Research Summary

The design knowledge behind the current skills is based on two layers.

### AI-Focused Layout

Reference products: v0, Claude Artifacts, Julius AI, Cursor, Granola, Hebbia, Perplexity, Arc, Raycast, Lobe Chat, AudioPen, Superwhisper, and Reflect.

Shared patterns:

- AI should create structured work products, not just chat replies.
- Chat is often the input surface; the artifact is the product.
- Split-pane workspaces work well for generated UI, code, documents, and analysis.
- Inline AI works better for editors and code tools where preserving flow matters.
- Command palettes hide complexity without removing power.
- Matrix/grid layouts are ideal for repeated extraction across documents or data.
- Transcript products should default to polished notes, topics, and actions rather than raw transcript walls.

### Premium Component Polish

Reference products: Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, Hebbia, and Perplexity.

Shared patterns:

- Modern UI quality comes from restrained defaults, not decoration.
- Use fewer borders and fewer boxes.
- Let spacing, alignment, and type hierarchy carry structure.
- Use color semantically, not decoratively.
- Tables should be dense but calm.
- Cards should group meaningful regions, not every item.
- Dark mode needs layered near-black surfaces and low-opacity borders.
- Data types should map to intentional components: badges, relation pills, date cells, currency cells, status dots, copyable IDs, and expandable long text.
