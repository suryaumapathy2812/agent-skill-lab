# Polar

## UI Role

Polar is an open-source developer monetization platform for selling digital products, subscriptions, and license keys. It is a strong reference for modern SaaS dashboard design, combining product management, customer views, and revenue metrics in a clean, minimal interface.

## Layout Pattern

- Sidebar navigation with collapsible sections for Products, Customers, Subscriptions, Revenue, Settings.
- Main content area for lists, detail views, and dashboards.
- Uses tabs and segmented controls within pages for sub-navigation.
- The interface feels like a developer tool, not a traditional e-commerce dashboard.

## Why It Works

- Developer-focused products are often utilitarian. Polar makes monetization feel clean and professional.
- Uses shadcn/ui components with a dark-mode-first palette that feels modern without being heavy.
- Revenue and subscription metrics are presented with restraint: compact cards, quiet charts, and semantic status indicators.
- Product and customer lists use structured rows with type-aware rendering.

## Component Polish Notes

- Sidebar: 240px to 280px width, compact items with icons, muted active state, subtle section dividers.
- Metric cards: 16px to 20px padding, 24px to 32px value, 12px label, optional delta in semantic color.
- Product list: 48px to 56px row height, product name, type badge, price, status, updated date.
- Customer list: 44px to 52px row height, email/name, subscription status, total spend, last active.
- Tabs: 36px to 40px height, subtle underline or pill indicator, muted inactive text.
- Empty states: centered, short message, one action.

## Skill-Building Takeaway

For developer monetization tools, combine the precision of a developer dashboard with the clarity of a revenue dashboard. Avoid e-commerce clutter.

## Detailed UI Construction Notes

Polar is useful because it handles multiple data types in one design system: products, customers, subscriptions, revenue, and webhooks. Each surface should feel like the same product.

Product pages should use a list or card grid depending on the number of items. For fewer than 20 products, cards with image/name/price/status work well. For more, use a structured list.

Revenue dashboards should lead with 2 to 4 metric cards (MRR, active subscriptions, new customers, churn) and follow with a quiet chart. Avoid BI-tool heaviness.

Customer detail should use a drawer or detail page with tabs: overview, subscriptions, transactions, activity. Avoid dumping everything into one long page.

Webhook and API key pages should use the Resend pattern: monospace values, copy actions, compact tables, minimal decoration.

What to copy: developer-tone dashboard, type-aware list rendering, restrained revenue metrics, drawer-based customer detail.

What to avoid: e-commerce dashboard clutter, colorful product badges everywhere, large charts dominating the page, or treating every metric as a card with icon and description.

## Additional Decision Patterns

Polar demonstrates that subscription and revenue data can be presented without the visual noise of Stripe's older dashboard or traditional accounting tools. The key is restraint: show the number, show the trend, show the status, then let the user drill down.

The product also shows that list views work well for products and customers when each item has identity, status, and compact metadata. Tables are appropriate for transactions and webhook logs where column comparison matters.

Design rule to extract: for monetization dashboards, lead with revenue interpretation, then provide detail. Use lists for identity-rich records, tables for transaction logs.
