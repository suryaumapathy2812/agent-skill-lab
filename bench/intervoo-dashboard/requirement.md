# Intervoo Dashboard UI Requirements

## Product Context

Intervoo is a control plane for voice AI interview agents. The dashboard is used by a small operations team to manage users, job descriptions (JDs), and diagnostic interview sessions. The team opens the dashboard to do a specific task and closes it. Speed and clarity matter more than delight.

**Brand personality:** Precise. Focused. Confident.

**Design principles:**
1. Tool disappears into the task — every screen makes the primary action obvious
2. Earn familiarity through consistency — same button shape, form vocabulary, spacing rhythm
3. Density over decoration — show useful information, sections defined by typography and spacing
4. State is always visible — loading, empty, error, success all have clear visual treatment
5. One accent, used sparingly — primary actions get accent color, everything else neutral

**Anti-references:** No generic SaaS card grids, no over-decorated admin panels, no dark-mode developer tool aesthetic, no AI slop with oversized spacing and sparkle icons.

---

## Modules to Build

### 1. Users Module

#### List Page (`/app/users`)
- **Table columns:** User (avatar + name), Resume (parsed role + experience years), Diagnostics (count), Last attempt (relative time)
- **Search:** by name, email, or phone
- **Pagination:** 25 per page
- **Row click:** navigates to user detail

**Data model for list row:**
```
{
  id: string
  name: string
  email: string
  resume: { parsedRole: string, parsedExperienceYears: number | null } | null
  diagnosticsCount: number
  lastDiagnosticAt: string | null
}
```

#### Detail Page (`/app/users/[id]`)
- **Header:** Name, email (with copy button), phone (with copy button), stage badge (Onboarding/Diagnostics), free diagnostic status badge
- **Tabs:** Overview, JD Attempts, Orders, Credits, Audit

**Overview tab:**
- Left column: Role, Experience, Resume preview (skills, experience, education, projects)
- Right sidebar: Skills list (chip/pill style)

**JD Attempts tab:**
- Table: Job (title + company, linked to diagnostic), Diagnostic (status badge), Progress (current/total rounds), Started (relative time)

**Orders tab:**
- Table: Product name, Razorpay order ID (monospace), Status badge, Amount (₹), Created (relative time)

**Credits tab:**
- Current balance display
- Ledger table: Type, Delta (+/- with color), Balance after, When (relative time)

**Audit tab:**
- Table: When, Operator (name + email), Action (monospace), Status badge (SUCCESS/FAILED), Reason

---

### 2. Jobs (JDs) Module

#### List Page (`/app/jobs`)
- **Table columns:** Job (title), Company, Diagnostics (count), Completion (progress bar + percentage)
- **Search:** by title, company, location, or skills
- **Action button:** "New JD" (top right)
- **Pagination:** 25 per page

**Data model for list row:**
```
{
  id: string
  jobTitle: string
  companyName: string | null
  diagnosticsCount: number
  completionPct: number | null
}
```

#### Detail Page (`/app/jobs/[id]`)
- **Header:** Job title, company name
- **Tabs:** Overview, Rounds, Description

**Overview tab:**
- Job details: Company, Location, Experience range, Salary range
- Skills list
- Linked diagnostics count

**Rounds tab:**
- 4 round cards (Screening, Behavioural, Technical Thinking, Career Readiness)
- Each card: Round name, status badge, description
- Competencies list for each round

**Description tab:**
- Full job description rendered as Markdown

---

### 3. Diagnostics Module

#### List Page (`/app/diagnostics`)
- **Stat cards (top):** All diagnostics, In progress, Completed (clickable to filter)
- **Table columns:** Job (title + company), Candidate (name/email), Progress (completed rounds / 4), Status badge, Last activity (relative time or "In progress"), Paid (amount or "Free" badge)
- **Search:** by JD, company, user, or phone
- **Status filter:** IN_PROGRESS, COMPLETED
- **Pagination:** 25 per page

**Data model for list row:**
```
{
  id: string
  selectedJob: { jobTitle: string, companyName: string | null }
  user: { name: string, email: string }
  status: "IN_PROGRESS" | "COMPLETED"
  completedRounds: number
  lastRound: { endedAt: string | null, sessionStatus: string | null } | null
  paidAt: string | null
  paidAmount: string | null
  orderProductName: string | null
  orderStatus: string | null
}
```

#### Detail Page (`/app/diagnostics/[id]`)
- **Header:** Job title, company name, status badge, round indicator (Round X / 4)
- **Tabs:** Overview, Payments, Audit

**Overview tab:**
- Left column: 4 round cards in timeline layout
  - Each card: Round name, status badge, description
  - Artifacts footer: Audio, Video, Transcript links (with external link icon)
  - Action: View report button, Delete round button
- Right sidebar:
  - User info: Name (linked), Phone, Created/Updated timestamps
  - Free diagnostic status with toggle button
  - Actions: Mark all rounds done, Reset to round 1, Delete diagnostic

**Payments tab:**
- Order details table: Product, Amount (₹), Order status badge, Razorpay order ID
- Payments list table: Payment ID, Status badge, Amount, Method, When

**Audit tab:**
- Table: When, Operator (name + email), Action (monospace), Status badge, Reason

---

## Design System

### Colors (Dark mode)
- Background: `oklch(0.145 0.015 230)` — very dark blue-gray
- Foreground: `oklch(0.965 0.004 220)` — near white
- Card: `oklch(0.18 0.018 230)` — slightly lighter than background
- Border: `oklch(1 0 0 / 14%)` — subtle white overlay
- Primary/Accent: `oklch(0.74 0.09 190)` — teal/cyan
- Muted: `oklch(0.24 0.018 230)` — medium dark
- Muted foreground: `oklch(0.745 0.018 220)` — medium gray
- Destructive: `oklch(0.704 0.191 22.216)` — red

### Typography
- Sans: Inter, system-ui
- Mono: Geist Mono, ui-monospace
- Heading: Space Grotesk, Inter

### Components
- Tables: Dense, scannable, right-aligned numbers
- Badges: Status indicators (success=green, warning=amber, destructive=red, outline=neutral)
- Avatars: Initials-based, colored backgrounds
- Search: Input with clear/filter functionality
- Pagination: Page numbers with previous/next
- Stat cards: Clickable metric cards with active state
- Empty states: Icon + title + description for empty tables
- Loading states: Skeleton placeholders

### Spacing & Layout
- Page sections separated by `gap-10` (2.5rem)
- Cards use `rounded-xl border border-border/60 bg-card p-5`
- Tables use standard row/cell structure
- Detail pages use 2-column layout: `lg:grid-cols-[minmax(0,1fr)_280px]`

### Interactions
- Row click navigation to detail pages
- Staggered row entrance animation (15ms delay per row)
- Hover states on clickable elements
- Copy-to-clipboard for email/phone
- Tab navigation via URL params

---

## Sample Data

Use the following sample data for building the UI:

### Users
1. Alex Kim - alex.kim@example.com - Senior Frontend Engineer - 8 years - Pro plan - 3 diagnostics - Active
2. Jane Smith - jane.smith@example.com - Product Manager - 5 years - Starter plan - 1 diagnostic - Pending
3. Mike Davis - mike.davis@example.com - DevOps Engineer - 10 years - Pro plan - 5 diagnostics - Active
4. Sara Reed - sara.reed@example.com - Junior Developer - 2 years - Starter plan - 0 diagnostics - Churned
5. Tom Chen - tom.chen@example.com - Engineering Manager - 12 years - Enterprise plan - 8 diagnostics - Active

### Jobs
1. Senior Frontend Engineer - TechCorp Inc - Bangalore - 6-10 years - ₹15L-25L - 75% completion
2. Product Manager - StartupXYZ - Remote - 3-7 years - ₹12L-20L - 50% completion
3. DevOps Engineer - CloudBase - Mumbai - 4-8 years - ₹10L-18L - 100% completion
4. Junior Developer - WebAgency - Pune - 0-2 years - ₹4L-8L - 25% completion
5. Engineering Manager - EnterpriseCo - Delhi - 8-15 years - ₹25L-40L - 60% completion

### Diagnostics
1. Alex Kim - Senior Frontend Engineer - TechCorp - 3/4 rounds - Completed - ₹999
2. Jane Smith - Product Manager - StartupXYZ - 1/4 rounds - In Progress - Free
3. Mike Davis - DevOps Engineer - CloudBase - 4/4 rounds - Completed - ₹1499
4. Sara Reed - Junior Developer - WebAgency - 0/4 rounds - In Progress - Free
5. Tom Chen - Engineering Manager - EnterpriseCo - 2/4 rounds - In Progress - ₹1999
