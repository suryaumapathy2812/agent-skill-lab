# Campsite

## UI Role

Campsite is a team communication product known for fast, quiet, split-pane conversation UX.

## Layout Pattern

- Main feed stays anchored in the center.
- Clicking a thread opens a right-hand drawer.
- Users can inspect details without losing their place in the feed.

## Why It Works

- It applies split-pane/productivity principles to human conversation.
- Thread detail is progressively disclosed.
- The interface feels fast because navigation is spatial rather than page-heavy.

## Component Polish Notes

- Conversation rows should be calm, aligned, and readable.
- Right drawers need smooth transitions and preserved feed context.
- Reactions, metadata, and actions should stay visually subordinate.
- Avoid Slack-like visual clutter with excessive badges and colors.
- Use typography and spacing to separate message importance.

## Skill-Building Takeaway

For collaboration UI, use drawers and panes to preserve context. Avoid full page transitions for secondary conversation detail.

## Detailed UI Construction Notes

Campsite's lesson is spatial continuity in conversation. The main feed should remain anchored while a thread or detail opens in a right drawer. This avoids the Slack-like feeling of constantly losing place.

The feed column should have moderate width, often around 640px to 840px for readable posts, with side navigation or team context kept quieter. Post rows/cards should use typography and spacing rather than strong borders. A post can have 16px to 24px padding, subtle separators, and muted metadata.

The right drawer should be wide enough for conversation detail, around 380px to 560px. It should slide in around 180ms to 260ms and keep the feed visible. The drawer border should be a single subtle seam. Avoid dimming the main feed like a modal unless focus must be locked.

Message metadata should be quiet: avatars around 24px to 32px, names 13px to 14px, timestamps 11px to 12px muted. Reactions should be compact pills, not colorful badges. Thread counts and unread markers should be clear but not loud.

Composer controls should stay minimal. The writing area matters more than formatting chrome. Secondary actions can hide behind slash commands, attachments, or contextual buttons.

What to copy: anchored feed plus drawer detail, quiet conversation rows, spatial transitions, low-noise reactions.

What to avoid: full-page thread transitions, colorful chat clutter, large action bars, or modal overlays for normal conversation detail.

## Additional Decision Patterns

Campsite is a good example of list/feed over table. Conversation objects have personality: author, timestamp, text, replies, reactions, attachments, and thread state. A table would destroy that hierarchy. A feed item or rich list row preserves narrative scanning.

The right drawer is also a major decision pattern. Clicking a thread should not route the user away from the main feed unless the thread becomes the entire task. A drawer preserves context, reduces navigation cost, and feels faster.

Design rule to extract: when the user is browsing human conversation or narrative content, prefer feed/list with drawer detail over table or full page transition.
