# Skills And Agents Report

This report is the single inventory for all skills and agents in this repository.

## Skills

### modern-design

Purpose: premium product UI polish for React, Next.js, Tailwind, shadcn/ui, dashboards, SaaS apps, forms, cards, tables, charts, dark mode, and component refinement.

Core focus:

- Improve shadcn-style components without fighting the design system.
- Use subtle borders, disciplined shadows, tighter typography, better density, and semantic color.
- Choose the right primitive: list, table, matrix, card, drawer, command palette, or page.
- Prefer list/item views over tables when records need custom hierarchy, preview, identity, or mobile-friendly scanning.
- Apply RAIL thinking to response, animation, idle, and load behavior.
- Make dashboards, tables, forms, and SaaS pages feel closer to Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, and Reflect.

Primary file: `skills/modern-design/SKILL.md`

Focused references:

- `references/modern-design/component-decision-matrix.md`
- `references/modern-design/component-recipes.md`
- `references/modern-design/depth-surfaces-shadows.md`
- `references/modern-design/whitespace-density.md`
- `references/modern-design/rail-model.md`
- `references/modern-design/anti-patterns.md`

### ai-design

Purpose: AI workspace product design for AI-first apps, generated artifacts, copilots, chat-plus-output layouts, transcripts, citations, extraction flows, and AI-native product modernization.

Core focus:

- Treat AI products as workspaces rather than chatbots.
- Choose between split-pane, artifact panel, inline AI, command-first AI, matrix/grid extraction, content-first answer UI, capture-to-artifact UI, and document-plus-AI layouts.
- Define artifact types, AI states, source/evidence handling, and workspace architecture.

Primary file: `skills/ai-design/SKILL.md`

Focused references:

- `references/ai-design/workspace-blueprints.md`
- `references/products/00-ai-focused-layout-patterns.md`
- Product-specific references under `references/products/`

## Agents

No custom agents have been added yet.

## Product Design Research Summary

The design knowledge behind the current skills is based on two layers.

### AI-Focused Layout

Reference products: v0, Claude Artifacts, Julius AI, Cursor, Granola, Hebbia, Perplexity, Arc, Raycast, Lobe Chat, AudioPen, Superwhisper, Reflect, PLAIN, Midday, Polar, and Attio.

Shared patterns:

- AI should create structured work products, not just chat replies.
- Chat is often the input surface; the artifact is the product.
- Split-pane workspaces work well for generated UI, code, documents, and analysis.
- Inline AI works better for editors and code tools where preserving flow matters.
- Command palettes hide complexity without removing power.
- Matrix/grid layouts are ideal for repeated extraction across documents or data.
- Transcript products should default to polished notes, topics, and actions rather than raw transcript walls.
- Support tools benefit from list + thread + context layout.
- Financial tools benefit from interpretation-first dashboards.
- CRM/data workspace tools benefit from view-switching (list/table/kanban).
- Monetization tools benefit from developer-tone precision with revenue clarity.

### Premium Component Polish

Reference products: Linear, Resend, Dub, OpenStatus, Langfuse, Campsite, Basedash, Reflect, Hebbia, Perplexity, PLAIN, Midday, Polar, and Attio.

#### Product-Specific Patterns

| Product | Key Pattern | Best For |
|---------|-------------|----------|
| Linear | List-first work queues, command-first actions | Issue tracking, project management |
| Resend | Depth over outlines, precision over decoration | Developer tools, API dashboards |
| Campsite | Feed/list with drawer detail | Conversations, team communication |
| Dub.co | Interpretation before detail tables | Analytics dashboards |
| OpenStatus | Color as alarm vocabulary | Monitoring, status dashboards |
| Langfuse | Overview first, raw detail on demand | Observability, traces |
| Basedash | Type-aware generated data surfaces | Admin panels, CRUD |
| Hebbia | Matrix as purpose-built grid | Document extraction, comparison |
| Reflect | Document primacy, AI as side workspace | Writing tools, notes |
| Perplexity | Sources close but visually secondary | Research, Q&A |
| PLAIN | Conversation-first, list + thread + context | Support, helpdesk |
| Midday | Interpretation then detail, refined shadcn | Financial tools, dashboards |
| Polar | Developer-tone, type-aware list rendering | Monetization, subscriptions |
| Attio | View-switching, type-aware cells | CRM, data workspaces |

Shared patterns:

- Modern UI quality comes from restrained defaults, not decoration.
- Use fewer borders and fewer boxes.
- Let spacing, alignment, and type hierarchy carry structure.
- Use color semantically, not decoratively.
- Tables should be dense but calm.
- Tables should not be the default for every collection; list/item views often create better hierarchy and product polish.
- Cards should group meaningful regions, not every item.
- Dark mode needs layered near-black surfaces and low-opacity borders.
- Data types should map to intentional components: badges, relation pills, date cells, currency cells, status dots, copyable IDs, and expandable long text.
- View-switching (list/table/kanban) is a first-class pattern for data workspaces.
- Support/conversation tools should use list + thread + context, not table + modal.
- Financial/business tools should lead with interpretation (metrics, trends), then provide detail (tables, lists).
- Developer monetization dashboards should combine precision of developer tools with clarity of revenue dashboards.

## Reference Architecture

The repository intentionally splits large design knowledge into smaller markdown chunks so agents can load only the context needed for the task.

### Product Notes

Product-specific research lives in `references/products/`.

These files capture UI patterns, layout decisions, component polish, and product-specific takeaways from the apps discussed during research.

### Modern Design Chunks

`references/modern-design/` contains focused decision and implementation files:

- Component choice and list-vs-table decisions.
- Component recipes.
- Depth, surface, border, and shadow guidance.
- Whitespace and density guidance.
- RAIL performance model.
- Anti-patterns.

### AI Design Chunks

`references/ai-design/` contains AI workspace blueprints and should grow with additional focused files for state design, artifact design, source/evidence patterns, and mobile behavior.
