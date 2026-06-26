# Reference Products — Gold Standard UI

## Products to Compare Against

### 1. Linear
- **Category**: Issue tracking / project management
- **UI Patterns**: Dashboard, Kanban, sidebar, form, modal
- **Design Language**: Dense data, minimal chrome, fast feel, green accent
- **Key Screens**: 539 UI screens — lists (301), settings (230), teams (217), forms (150)
- **Reference Sources**: linear.app, nicelydone.club/apps/linear, saasui.design

### 2. Resend
- **Category**: Email API for developers
- **UI Patterns**: Modal/popover (18), list (14), detail page (13), create (11)
- **Design Language**: Minimal, premium, calm. Recently rebranded with new visual identity.
- **Key Insight**: "Individual component updates, alongside new colors and typography, make the dashboard feel more distinct and elevated."
- **Reference Sources**: resend.com, nicelydone.club/apps/resend, saasui.design

### 3. Dub (Dub.co)
- **Category**: Link management / analytics
- **UI Patterns**: Analytics dashboard, time-series charts, filter bar, real-time events
- **Design Language**: Sleek, keyboard-friendly, data-heavy but clean
- **Key Features**: Time-series charts, aggregated data facets, real-time events stream
- **Reference Sources**: dub.co, saasui.design

### 4. Attio
- **Category**: CRM
- **UI Patterns**: Dashboard, table, Kanban, settings, modals, empty states
- **Design Language**: Flexible, data-driven, modern CRM
- **Key Screens**: 40+ UI screens covering CRM, workflows, tables, settings
- **Reference Sources**: attio.com, nicelydone.club, saasui.design, Figma community (250+ screens)

### 5. Basedash
- **Category**: Admin panel / database tool
- **UI Patterns**: Dashboard, navigation, modals, settings, forms
- **Design Language**: Dark-mode command surface, pure black canvas, near-black elevated cards, white type
- **Key Insight**: "Dark-mode command surface for data work: pure black canvas, near-black elevated cards, and white type that reads like a terminal."
- **Reference Sources**: basedash.com, saasui.design, Figma community

### 6. Campsite
- **Category**: Developer community
- **UI Patterns**: Feed, profiles, settings, integrations
- **Design Language**: Clean, developer-focused, community-oriented
- **Reference Sources**: campsite.so

### 7. Plain
- **Category**: Customer support
- **UI Patterns**: Ticket view, inbox, customer detail, settings
- **Design Language**: Minimal, focused on clarity and speed
- **Reference Sources**: plain.com

### 8. Polar
- **Category**: Creator economy / memberships
- **UI Patterns**: Dashboard, members, content, settings
- **Design Language**: Creator-focused, clean, modern
- **Reference Sources**: polar.sh

### 9. Cursor
- **Category**: AI code editor
- **UI Patterns**: Editor, settings, command palette, AI chat
- **Design Language**: Technical, developer-focused, dark mode
- **Reference Sources**: cursor.com

---

## Common Design Patterns Across All Products

### Visual Language
- **Dark mode**: Most use dark or have excellent dark mode support
- **Minimal chrome**: Few borders, fewer visible lines
- **Surface hierarchy**: Depth through surface shifts, not borders
- **Typography**: Tight, readable, muted metadata

### Layout
- **Dense but calm**: Data-dense but not cluttered
- **Sidebar navigation**: Most use sidebar for primary nav
- **Command palette**: Keyboard-first navigation (Cmd+K)
- **Progressive disclosure**: Show less, reveal on demand

### Components
- **Tables**: Dense, scannable, right-aligned numbers
- **Cards**: Meaningful grouping, not every item
- **Modals/Drawers**: For detail without losing context
- **Badges**: Compact, semantic color, metadata not decoration

### Interaction
- **Keyboard shortcuts**: Power users expect this
- **Hover states**: Subtle but clear feedback
- **Loading states**: Skeleton screens, not spinners
- **Empty states**: Authored, useful, with clear next action

---

## What Makes These "Gold Standard"

1. **Restraint**: They don't add visual elements unless they serve a purpose
2. **Density**: They pack information without feeling cluttered
3. **Consistency**: Every component follows the same design language
4. **Polish**: Hover states, transitions, loading states all feel intentional
5. **Dark mode**: Not an afterthought — designed for it
6. **Keyboard-first**: Power users can navigate without mouse

---

## First Component to Build

Based on the reference research, a **data table** would be the best starting point because:
- Every reference product has tables
- Tables reveal density, alignment, typography, and interaction patterns
- Tables are the most common SaaS primitive
- Easy to compare against references (row height, header style, alignment, etc.)
