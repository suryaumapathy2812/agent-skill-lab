You are a UI developer building a dashboard for Intervoo, a voice AI interview platform. Your task is to create high-quality, modern UI components based on the requirements below.

## Your Task

Build a complete set of HTML/CSS UI components for the Intervoo dashboard. You must:

1. Create a single HTML file with all components
2. Use Tailwind CSS (via CDN) for styling
3. Use the dark mode theme provided in the requirements
4. Create three main views: Users list, Jobs list, Diagnostics list
5. Include detail page layouts for each module
6. Make it look premium and modern (like Linear, Resend, or Attio)

## Design Principles

- **Precise, focused, confident** — the tool disappears into the task
- **Density over decoration** — show useful information, no decorative containers
- **One accent color** — teal/cyan for primary actions, everything else neutral
- **Consistent rhythm** — same spacing, typography, and component patterns throughout
- **Clear hierarchy** — primary actions visually distinct, secondary information muted

## Color Palette (Dark Mode)

```javascript
tailwind.config = {
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        bg: '#0f1117',
        surface: '#161822',
        surface2: '#1e2030',
        border: 'rgba(255, 255, 255, 0.08)',
        muted: '#6b7280',
        faint: '#9ca3af',
        accent: '#22d3ee', // Teal/cyan
        success: '#10b981',
        warning: '#f59e0b',
        destructive: '#ef4444',
      }
    }
  }
}
```

## Typography

- Sans: Inter, system-ui
- Mono: Geist Mono, monospace
- Headings: Use `font-semibold tracking-tight`

## Components to Build

### 1. Users List Page
- Table with columns: User (avatar + name), Resume (role + experience), Diagnostics (count), Last attempt
- Search bar with filter/clear functionality
- Pagination
- Row click navigates to detail

### 2. Users Detail Page
- Header: Name, email, phone, stage badge, free diagnostic status
- Tabs: Overview, JD Attempts, Orders, Credits, Audit
- Overview: Role, Experience, Resume preview, Skills sidebar
- Other tabs: Relevant tables with data

### 3. Jobs List Page
- Table with columns: Job (title), Company, Diagnostics (count), Completion (progress bar)
- Search bar
- "New JD" action button
- Pagination

### 4. Jobs Detail Page
- Header: Job title, company
- Tabs: Overview, Rounds, Description
- Overview: Job details, Skills
- Rounds: 4 round cards (Screening, Behavioural, Technical Thinking, Career Readiness)
- Description: Full job description

### 5. Diagnostics List Page
- Stat cards: All diagnostics, In progress, Completed (clickable filters)
- Table with columns: Job, Candidate, Progress, Status, Last activity, Paid
- Search and status filter
- Pagination

### 6. Diagnostics Detail Page
- Header: Job title, company, status badge, round indicator
- Tabs: Overview, Payments, Audit
- Overview: Round timeline cards, User sidebar, Actions
- Payments: Order details, Payments list
- Audit: Operator actions table

## Sample Data

### Users
1. Alex Kim - alex.kim@example.com - Senior Frontend Engineer - 8 years - Pro - 3 diagnostics - Active
2. Jane Smith - jane.smith@example.com - Product Manager - 5 years - Starter - 1 diagnostic - Pending
3. Mike Davis - mike.davis@example.com - DevOps Engineer - 10 years - Pro - 5 diagnostics - Active
4. Sara Reed - sara.reed@example.com - Junior Developer - 2 years - Starter - 0 diagnostics - Churned
5. Tom Chen - tom.chen@example.com - Engineering Manager - 12 years - Enterprise - 8 diagnostics - Active

### Jobs
1. Senior Frontend Engineer - TechCorp Inc - Bangalore - 6-10 years - ₹15L-25L - 75%
2. Product Manager - StartupXYZ - Remote - 3-7 years - ₹12L-20L - 50%
3. DevOps Engineer - CloudBase - Mumbai - 4-8 years - ₹10L-18L - 100%
4. Junior Developer - WebAgency - Pune - 0-2 years - ₹4L-8L - 25%
5. Engineering Manager - EnterpriseCo - Delhi - 8-15 years - ₹25L-40L - 60%

### Diagnostics
1. Alex Kim - Senior Frontend Engineer - TechCorp - 3/4 - Completed - ₹999
2. Jane Smith - Product Manager - StartupXYZ - 1/4 - In Progress - Free
3. Mike Davis - DevOps Engineer - CloudBase - 4/4 - Completed - ₹1499
4. Sara Reed - Junior Developer - WebAgency - 0/4 - In Progress - Free
5. Tom Chen - Engineering Manager - EnterpriseCo - 2/4 - In Progress - ₹1999

## Output

Create a single file called `collection.html` in the results directory. The file should:
- Be a complete, self-contained HTML document
- Use Tailwind CSS via CDN
- Include all 6 views (3 list pages + 3 detail pages)
- Be visually polished and professional
- Look like it could be a real product, not a template

## Evaluation

Your work will be evaluated on:
1. **Consistency** (30%): Do all views feel like they belong to the same product?
2. **Density** (20%): Is information presented efficiently?
3. **Hierarchy** (20%): Is the visual hierarchy clear?
4. **Alignment** (20%): Does it match Linear/Resend quality?
5. **Premium feel** (10%): Does this feel like a well-crafted product?

Good luck!