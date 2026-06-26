# Resend

## UI Role

Resend is a benchmark for premium dark-mode developer SaaS. The product is technical and utilitarian, but the interface feels precise, expensive, and calm through restraint rather than decoration.

Use Resend as a reference when designing developer tools, API dashboards, email/log products, DNS/configuration flows, account settings, empty-state dashboards, and dense dark-mode admin surfaces.

## Product Character

- Developer-first, not decorative.
- Black canvas with very subtle near-black surfaces.
- Large areas of intentional empty space.
- Compact, precise controls.
- Strong typography hierarchy with few font sizes.
- Low-contrast borders and separators.
- White primary actions used sparingly.
- Semantic color reserved for state, risk, and chart series.

## App Shell

### Sidebar

- Fixed left sidebar around 312px wide on a 2048px desktop screenshot.
- Sidebar background is nearly black and separated from the app canvas by a single low-opacity vertical border.
- Top workspace switcher is compact: 28px to 32px square avatar, workspace name, and small chevron.
- Main navigation starts below the workspace switcher with generous top offset, but each item is compact.
- Nav rows are roughly 40px to 44px tall, with 18px to 20px icons and 14px to 16px labels.
- Active nav item uses a rounded dark pill surface, not a bright accent. The active state is visible through surface contrast and text contrast.
- Inactive nav labels are muted gray. Icons use the same quiet stroke weight.
- Bottom account row is pinned and compact: small circular avatar, truncated email/name, ellipsis menu.
- Account menu opens upward from the bottom with a dark rounded panel, row separators, icons, and shortcut hints.

### Top Bar

- Thin top header spans the main content area and is about 74px tall.
- It is mostly empty, carrying only `Docs` and `Need help?` on the right.
- Header bottom border is low contrast and aligns with the sidebar divider.
- The support button is a compact rounded pill with a small keyboard hint badge.
- Top bar does not compete with page content; it creates structure and orientation.

### Content Container

- Main content begins well inside the canvas, roughly 150px from the sidebar boundary on wide screens.
- Effective content width is constrained to about 1360px to 1400px for most pages.
- Page title top offset is around 48px from the top bar.
- Page titles are 30px to 36px, semibold, tight tracking.
- Pages avoid full-width sprawl even on very wide desktops.
- The visual rhythm is wide canvas, narrow content, compact components.

## Surfaces And Borders

- Base canvas is nearly black, close to true black, but components use subtle near-black elevations.
- Borders are 1px and low opacity; they should feel like soft structure, not outlines.
- Rounded surfaces commonly use 12px to 18px radius.
- Large cards and modals use 24px to 32px radius when they need emphasis.
- Resend uses fewer boxes than typical dashboards. Many settings sections are separated by horizontal rules instead of cards.
- Cards appear when an area needs containment: profile panels, DNS record panels, metrics charts, modals, template preview cards.
- Do not combine heavy border, strong shadow, and bright fill. Pick one structural method.

## Typography

- Page title: 30px to 36px, semibold, tight line-height.
- Section heading: 20px to 24px, semibold.
- Card heading: 18px to 22px, semibold.
- Body/UI text: 15px to 17px.
- Muted descriptive text: 15px to 17px with lower contrast.
- Labels/table headers: 13px to 14px, muted, medium/semibold.
- Monospace values: 14px to 17px depending on table density.
- Numeric chart values can be large, around 40px to 48px, but only where metrics are the primary content.
- Hierarchy comes more from contrast and position than from many font sizes.

## Layout Patterns

### List Pages

Observed on Domains, Templates, and Emails.

- Page header contains title on the left and primary action or utility actions on the right.
- Search and filters sit in one horizontal row below the title.
- Search input can take most of the row width, with filters around 240px to 330px each.
- Controls are 40px to 44px tall, rounded 12px to 14px, with subtle border and dark fill.
- Download/code icon buttons are square, about 40px to 44px.
- Empty space below a short list is not filled with fake cards. The page is allowed to breathe.
- Pagination/footer text is small and muted, often just below the data row.

### Detail Pages

Observed on the Domain detail page.

- Detail header uses a large icon tile on the left, label plus primary title beside it, and actions on the right.
- Metadata is laid out in a wide grid below the header: created, status, provider, region.
- Metadata labels are uppercase, small, muted; values are readable and quiet.
- Detail pages use tabs below the metadata, usually pill active state plus text inactive states.
- Main detail content appears in a large rounded panel, not a stack of many small cards.
- Technical records are represented as compact tables within sections.

### Settings Pages

Observed on Usage, Extras, and Profile.

- Settings pages use tab navigation directly below the page title.
- Usage/Extras use two-column horizontal sections rather than cards.
- Left column explains the product area; right column contains plan/limits/details.
- Sections are separated by long horizontal rules.
- This pattern is ideal for calm billing, quota, feature-limit, or account-management pages.
- Profile settings use stacked cards because each panel is an independent account object.

### Onboarding Flow

- Onboarding page is centered within the main content, with title and subtitle at the top.
- Steps are shown with a vertical timeline line and small circular nodes.
- Active step is bright and readable; future steps are muted and partially disabled.
- Code block appears as a large rounded panel with language tabs at the top.
- Disabled or pending code content is visibly dimmed.
- Primary action sits in the code panel footer.

## Component Notes

### Buttons

- Primary buttons are often white with black text, around 36px to 40px tall.
- Primary app actions use compact labels: `Add domain`, `Create template`, `Restart`.
- Secondary buttons use dark fill, subtle border, muted text.
- Icon-only buttons are square, around 40px, with rounded corners and dark elevated surface.
- Button styling is restrained; no large gradient CTAs inside the app.
- Keyboard shortcuts can appear as tiny badges inside buttons or menus.

### Inputs And Selects

- Search inputs are dark rounded rectangles with 1px border and subtle inner contrast.
- Height is about 40px to 44px.
- Search icon is small and quiet; placeholder text is muted.
- Selects use the same height/radius as search inputs.
- Controls align on a strict horizontal grid.
- Form inputs in profile cards are 40px to 44px, with a slightly lighter fill and visible focus ring.

### Tabs

- Tabs are compact text buttons, not heavy segmented controls.
- Active tab can use a rounded dark pill about 40px high.
- Inactive tabs are text-only with muted color.
- Horizontal tab spacing is generous enough to scan, but not oversized.
- Settings tabs can be text-only except for the active pill.

### Tables

- Table headers sit inside a rounded dark header strip rather than heavy boxes.
- Header row height is around 38px to 42px.
- Body rows are sparse but precise, around 52px to 64px depending on content.
- Horizontal separators only; no vertical grid lines.
- Column labels are muted and semibold.
- Technical record tables use monospace content and tight columns.
- Status column uses compact semantic badges.
- Row actions are quiet ellipsis buttons.

### Badges And Status

- Status badges are compact rounded pills.
- Failed state uses dark red background with muted red text, not bright red fill.
- Draft/admin badges use neutral gray surfaces.
- Semantic colors are small and contained.
- Country/region flags are used as tiny identity markers, paired with text.

### Empty States

- Empty email page uses one large rounded bordered region.
- Centered empty-state content includes a polished icon tile, title, short explanatory text, and one CTA.
- Empty-state icon can have a subtle atmospheric glow, but the surrounding card remains quiet.
- Empty-state copy is specific: `No sent emails yet`, not generic `No data`.
- Empty cards are allowed to be large; the visual point is calm absence, not dense filler.

### Template Cards And Menus

- Template grid cards are large dark rounded rectangles, around 440px by 280px in the screenshot.
- Card preview area is dark and mostly empty, with actions in the top-right.
- Menu trigger is a small rounded square at the card corner.
- Context menu is a floating black panel with rounded corners, compact rows, icons, and subtle separators.
- Destructive menu item is red and separated from routine actions.
- Hover/active menu item uses a low-contrast pill highlight.

### Modals

- Destructive confirmation modal is centered and relatively narrow, around 620px to 660px wide.
- Backdrop is very dark and dims the entire app heavily.
- Modal has large radius, low-opacity border, and no decorative header bar.
- Header contains title and close icon aligned right.
- Warning text uses red only for the irreversible sentence.
- Confirmation phrase is shown as an inline pill with copy icon.
- Text input is full width with strong focus outline.
- Footer actions are compact: destructive button first, cancel button second.
- Keyboard shortcut hints are embedded in buttons.

### Metrics And Charts

- Metrics page uses filters in the header right.
- Main chart card is wide and rounded with generous internal padding.
- Big metric values sit at the top-left of the chart card.
- Chart gridlines are extremely low contrast and often dashed.
- Axes labels are small and muted.
- Event filter dropdown is a tall floating panel with color-dot legend rows.
- Chart color is semantic and sparse; orange risk lines or colored event dots are small accents, not decoration.
- Secondary chart cards form a two-column grid below the main chart.

### Loading State

- Loading state is just the black canvas with a small centered spinner.
- No skeleton overuse when the app is globally loading.
- Spinner is subtle, about 32px to 40px, with muted ring contrast.

## Dark Mode Formula

- Canvas: near black.
- Sidebar: same or slightly separated near black.
- Panels: slightly lifted near black.
- Borders: white at roughly 8% to 14% perceived opacity.
- Active navigation/control fill: lifted dark gray, not accent color.
- Text: high-contrast white for primary, soft gray for secondary.
- Danger: dark red surface plus red text.
- Success/on toggle: restrained green.
- Charts: sparse semantic colors with low-contrast gridlines.

## Interaction Model

- Actions are compact and contextual.
- Many actions hide behind ellipsis menus or icon buttons.
- Primary creation actions live in the page header.
- Search and filters are persistent on list pages.
- Destructive actions require typed confirmation.
- Settings and profile operations use compact cards or horizontal sections instead of heavy workflows.
- Disabled/future steps are visibly muted rather than hidden.

## What To Copy

- Wide black canvas with constrained content width.
- Quiet fixed sidebar with rounded active nav item.
- Thin top bar with minimal utility actions.
- Dark controls at 40px to 44px height.
- White compact primary buttons.
- Sparse list pages that do not fill empty space unnecessarily.
- Large empty-state card with centered authored content.
- Detail page metadata grid followed by tabs and one major panel.
- Horizontal settings rows with left description and right values.
- Dense technical tables with monospace values and compact status badges.
- Floating context menus with strong black surface and compact rows.
- Destructive modal with typed confirmation and heavy backdrop.
- Low-noise metrics cards with quiet gridlines and sparse color.

## What To Avoid

- Bright accent-colored navigation.
- Over-carded dashboards where every row is boxed.
- Neon gradients or decorative glow everywhere.
- Large generic SaaS padding on technical pages.
- Full-width content stretching across ultrawide screens.
- Heavy gray borders on every component.
- Loud red/green status fills.
- Generic empty states without product-specific copy.
- Toolbars crowded with visible actions when an ellipsis menu would work.

## Skill-Building Takeaway

For `modern-design`, Resend should push generated UI toward precision-first dark-mode product surfaces: constrained content, compact controls, low-contrast structure, contextual actions, authored empty states, technical tables, and settings pages that use horizontal rhythm instead of card soup. The design should feel premium because every element is quieter, smaller, and more intentional than default component-library output.
