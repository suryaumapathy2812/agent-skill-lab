---
name: auto-iterate
description: Autonomous iteration and benchmarking toolkit. Set up experiment workspaces, define evaluation criteria, and run optimization loops. Use when the user wants to iterate, benchmark, optimize, or compare multiple possibilities automatically — for code, prompts, configs, algorithms, or any task where you want an AI agent to try things, evaluate results, keep improvements, and discard failures.
license: MIT
---

# Auto-Iterate

A general-purpose autonomous iteration framework inspired by karpathy/autoresearcher. Instead of manual trial-and-error, you define what to optimize, how to measure it, and let the agent loop forever — trying things, evaluating, keeping what works, discarding what doesn't.

## Core Principle

**Fixed budget + single metric + infinite loop = automatic optimization.**

Each experiment runs with a fixed resource budget. Results are evaluated against a single metric (or weighted criteria). On success, keep. On failure, discard. Repeat until stopping conditions are met.

You are not touching files directly. You are programming the `config.yaml` that defines the experiment, and the agent executes the loop autonomously.

## When To Use

Use this skill when the user wants to:

- Optimize code for performance, correctness, or quality
- Iterate on prompts for better LLM outputs
- Tune configuration parameters for better results
- Compare many possibilities automatically
- Run benchmarks with automatic analysis
- Do anything that involves "try → evaluate → keep/discard → repeat"

## How It Works

The skill creates a workspace, then hands off to an agent that runs the loop:

```
User describes task → Skill asks questions → Skill researches → Skill designs criteria → Skill creates workspace → Agent loops forever
```

## Phase 1: Intent Capture

Ask these questions to understand the task. Do not skip questions. Do not assume answers.

### Question 1: What are you optimizing?

Ask: **"What are you trying to optimize or improve?"**

Examples of good answers:
- "This Python function is too slow"
- "I want this prompt to generate better code"
- "I need to find the best batch size for training"
- "I want to compare 10 different approaches to this problem"

### Question 2: What files are involved?

Ask: **"What files are involved? Please provide paths or content."**

Identify:
- Which files the agent can modify (mutable)
- Which files are read-only references
- Any supporting files (tests, configs, data)

### Question 3: How do you run/test this?

Ask: **"How do you run or test this thing?"**

Look for:
- Shell commands (e.g., `python script.py`, `npm test`)
- Manual evaluation (user reviews output)
- Automated evaluation (existing test suite, benchmark script)

### Question 4: How do you measure success?

Ask: **"How do you measure success? Do you have an existing metric, tests, or should I help you define evaluation criteria?"**

**If they have a metric:** Use it directly.

**If they say "I'm not sure":** Help them discover criteria:

Ask:
- "What would make you say 'yes, that's better'?"
- "What are the top 3 things that matter for this task?"
- "Can you show me an example of 'good' vs 'bad' output?"

Then propose 3-5 weighted criteria based on their answers.

**If they have a shell script:** Use shell evaluation. Ask for the script path and how to read the metric from its output.

### Question 5: What's the budget?

Ask: **"How long can each experiment run? (e.g., 5 minutes, 30 seconds, unlimited)"**

This defines the fixed budget per experiment. All experiments run with the same budget, making them directly comparable.

### Question 6: When should we stop?

Ask: **"When should we stop iterating? Options: max iterations, target score, or just 'when it feels good enough'."**

Typical answers:
- "50 iterations"
- "When the score reaches 0.95"
- "When I wake up" (= max iterations of ~100)

## Phase 2: Research

After gathering requirements, do targeted research before designing criteria. This makes the evaluation factors grounded in reality, not generic defaults.

### Step 1: Read the Source Files

Read every file the user identified. Understand:
- What does this code/prompt/config actually do?
- What are the key functions, sections, or parameters?
- What's the current structure and approach?

### Step 2: Identify the Domain

Classify the task into one of these domains (or a combination):

| Domain | Signal Words | Research Focus |
|--------|-------------|----------------|
| Code optimization | slow, performance, speed, memory, fast | Bottlenecks, algorithmic complexity, profiling data |
| Prompt engineering | prompt, generate, output, LLM, response | Prompt patterns, chain-of-shot techniques, evaluation methods |
| Config tuning | config, settings, parameters, hyperparameter | Documentation, recommended ranges, parameter interactions |
| Algorithm selection | algorithm, approach, method, compare | Complexity analysis, benchmark data, tradeoffs |
| Code quality | clean, refactor, readable, maintainable | Style guides, SOLID principles, common patterns |
| General | optimize, improve, better, best | Domain-specific literature and examples |

### Step 3: Search for Domain Knowledge

Based on the domain, research:

**For code optimization:**
- What are common bottlenecks in this type of code?
- What profiling techniques apply?
- What are known optimization patterns for this language/framework?

**For prompt engineering:**
- What prompt engineering techniques exist for this task?
- What makes a prompt effective vs ineffective?
- What are common failure modes?

**For config tuning:**
- What does the documentation say about each parameter?
- What are recommended ranges or starting points?
- Which parameters interact with each other?

**For algorithm selection:**
- What are the known approaches to this problem?
- What are their time/space complexity tradeoffs?
- What benchmarks exist?

**For code quality:**
- What style guides or conventions apply?
- What are common anti-patterns in this domain?
- What does "clean code" look like for this language?

Use web search, documentation, and your training knowledge.

### Step 4: Analyze the Current State

If possible, run the code/prompt/config to establish a baseline:
- What's the current output or behavior?
- What are the current metrics (execution time, accuracy, etc.)?
- What's obviously wrong or suboptimal?

If running isn't possible (e.g., needs dependencies, GPU, etc.), skip this step and note it.

### Step 5: Synthesize Findings

Write a brief research summary (3-5 bullet points):
- Key findings about the domain
- What "good" looks like for this task
- Common pitfalls to avoid
- Recommended evaluation dimensions

This summary feeds directly into Phase 3 (Metric Design) — the criteria you propose should be informed by this research, not generic defaults.

### Research Output Format

Save the research summary to `.auto-iterate/research.md`:

```markdown
# Research Summary

## Task
[What the user wants to optimize]

## Domain
[Code optimization | Prompt engineering | Config tuning | Algorithm selection | General]

## Key Findings
- [Finding 1]
- [Finding 2]
- [Finding 3]

## Current Baseline
- [Current metric if measured]
- [Known issues or bottlenecks]

## Recommended Evaluation Dimensions
- [Dimension 1]: [why this matters]
- [Dimension 2]: [why this matters]
- [Dimension 3]: [why this matters]

## Common Pitfalls
- [Pitfall 1]
- [Pitfall 2]
```

## Phase 3: Metric Design

Based on the research findings and user answers, design the evaluation system.

**Use the research summary** from `.auto-iterate/research.md` to inform your criteria. The recommended evaluation dimensions and common pitfalls should directly shape what you measure.

### Option A: Shell Evaluation

Use when the user has a script that outputs a number.

Ask for:
1. Script path and command to run it
2. How to read the score from output (JSON key, stdout line, etc.)
3. Whether higher or lower is better

### Option B: LLM Evaluation

Use when evaluation is subjective (code quality, prompt effectiveness, etc.).

Design 3-5 criteria with weights that sum to 1.0:

| Criterion | Weight | Description |
|-----------|--------|-------------|
| name | 0.X | What this measures |
| check | — | Specific instructions for how to evaluate |

Example for prompt optimization:
- correctness (0.4): "Does the generated code compile and run correctly?"
- readability (0.3): "Is the code well-structured with good naming?"
- completeness (0.2): "Does it handle edge cases and error conditions?"
- efficiency (0.1): "Is the solution reasonably efficient?"

### Option C: Hybrid

Use shell for objective metrics, LLM for subjective quality. Combine scores.

## Phase 4: Constraints Definition

Ask:
1. **"What can the agent modify?"** (specific files, any file in a directory, etc.)
2. **"What must NOT be modified?"** (configs, test files, dependencies, etc.)
3. **"What can the agent install?"** (nothing new, only what's already installed)
4. **"Are there hard limits?"** (memory, disk space, API calls, etc.)

Write these into the `constraints` section of config.yaml.

## Phase 5: Workspace Setup

After all questions are answered, create the workspace:

### Step 1: Generate config.yaml

Create `.auto-iterate/config.yaml` from the conversation. Use the template in `templates/config.yaml`.

### Step 2: Create directory structure

```
.auto-iterate/
├── config.yaml
├── research.md        ← research summary from Phase 2
├── workspace/
│   ├── current/      ← copy mutable source files here
│   └── best/         ← copy mutable source files here (initial = current)
├── results/          ← empty, will be populated by agent
├── history.json      ← initialized with empty runs array
└── run.sh            ← only if using shell evaluation
```

### Step 3: Copy source files

- Copy mutable files to both `workspace/current/` and `workspace/best/`
- Reference files stay outside the workspace (agent reads them but doesn't modify)

### Step 4: Initialize history.json

Use the template in `templates/history.json`, fill in the task name and created_at timestamp.

### Step 5: Generate run.sh (if shell evaluation)

Create a simple script that runs the experiment and outputs a JSON score.

### Step 6: Confirm with user

Show the user:
- The research summary (`.auto-iterate/research.md`)
- The generated config.yaml
- What files are in the workspace
- What the agent will do
- How to start the agent

## Phase 6: Handoff

Tell the user:

> "Workspace ready at `.auto-iterate/`. To start the autonomous loop in OpenCode, invoke the auto-iterator agent."

Use: `@auto-iterator start the loop`

## Simplicity Criterion

When the agent evaluates improvements, it should apply this heuristic:

- A small improvement that adds ugly complexity? **Not worth it.**
- A small improvement from deleting code? **Definitely keep.**
- An improvement of ~0 but much simpler code? **Keep.**
- All else equal, simpler is better.

This is baked into the agent's evaluation logic. The skill ensures the config.yaml captures this preference.

## File Reference

| File | Purpose |
|------|---------|
| `templates/config.yaml` | Template for experiment config |
| `templates/history.json` | Empty history template |
| `.auto-iterate/research.md` | Research summary (created during setup) |

The agent instructions are in a separate file (AGENTS.md or agents/auto-iterator.md). This skill focuses on setup only.
