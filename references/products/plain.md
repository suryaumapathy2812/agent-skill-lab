# PLAIN

## UI Role

PLAIN is a customer support platform that proves helpdesk software can feel calm, fast, and minimal. It is a modern alternative to Zendesk and Intercom, designed around conversations rather than ticket numbers.

## Layout Pattern

- Conversation-centric layout with a left sidebar for queue/navigation and a main pane for the active thread.
- Right context pane for customer details, metadata, and actions.
- The interface avoids the chaotic, colorful feel of traditional helpdesks.

## Why It Works

- Conversation-first design makes support feel human, not ticket-based.
- Minimal chrome keeps focus on the customer message.
- Keyboard-first navigation makes triage fast.
- The UI is dense but never cluttered.

## Component Polish Notes

- Sidebar: compact queue list, 240px to 300px width, muted active state.
- Conversation rows: 40px to 48px height, status dot, customer name, preview snippet, timestamp.
- Message thread: clean typography, 15px to 16px body, 1.5 to 1.6 line-height, muted metadata.
- Context pane: 280px to 360px, customer details as compact key-value pairs, tags as muted pills.
- Composer: large enough for typing comfort, 12px to 16px padding, minimal formatting chrome.

## Skill-Building Takeaway

For support/conversation tools, treat conversations as first-class objects, not ticket rows. Use a three-pane layout: queue, thread, context.

## Detailed UI Construction Notes

PLAIN shows that support software does not need to look like a dashboard exploded. The queue sidebar should feel like a calm inbox, not a dense spreadsheet. Conversation rows should show just enough to triage: name, preview, time, status.

The message thread should feel like a conversation, not a form. Use clean message bubbles or flat message blocks with clear author/timestamp metadata. Avoid heavy card borders around every message.

The context pane should show customer info, previous tickets, tags, and actions without competing with the conversation. Use compact labels, 12px to 13px text, and muted metadata.

What to copy: conversation-first layout, minimal queue sidebar, calm message thread, contextual customer pane.

What to avoid: ticket-number thinking, colorful status badges everywhere, dense spreadsheet queues, or heavy card-based message layouts.

## Additional Decision Patterns

PLAIN proves that list-first design works for conversations. A table of tickets would kill the human feel. A structured list with preview, status, and time creates a better triage experience.

The three-pane model is also reusable: any product where the user cycles through items, inspects detail, and acts on context can benefit from queue/thread/context.

Design rule to extract: for human conversation or sequential review workflows, use list + thread + context, not table + modal.
