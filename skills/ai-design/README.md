# ai-design

AI workspace product design and AI-native product architecture — for chat-plus-artifact layouts, copilots, generative UI, transcripts, citations, and modernizing products into AI-native workspaces. Inspired by v0, Claude Artifacts, Julius AI, Cursor, Granola, Hebbia, Perplexity, Arc, Raycast, Lobe Chat, AudioPen, Superwhisper, Reflect, PLAIN, Midday, Polar, and Attio.

- **Not a visual style skill.** It answers: where does AI live in the product, how does the user provide intent, how does output become a usable work product, and how does the app avoid feeling like a generic chatbot.
- **Definition:** [`SKILL.md`](./SKILL.md)

## Core principle

Weak AI UI: user types → AI replies → user reads.
Strong AI UI: user states intent → the system produces a structured work product → the user edits, inspects, acts, or shares it.

## When to use it

Designing an AI-first product or workspace, adding AI to an existing app without it feeling bolted on, building chat-plus-preview or chat-plus-artifact layouts, designing transcript/citation/data-extraction UI, or deciding between chat, inline AI, command palette, artifact panel, drawer, matrix, or document output.

## Product references

Focused reference files, loaded only when relevant — not all at once. See `references/ai-design/workspace-blueprints.md` for concrete layouts, plus per-product pattern files (v0, Claude, Julius AI, Cursor, Hebbia, Perplexity, Granola/AudioPen/Superwhisper, Reflect, PLAIN, Midday, Polar, Attio) under `references/products/`.

## Install

```bash
./install.sh --target claude-code --skill ai-design --global
```

See the [root README](../../README.md#installation) for other targets/scopes.
