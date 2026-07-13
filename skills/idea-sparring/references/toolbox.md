# Thinking Toolbox

Mental models sourced from the detail pages at [untools.co](https://untools.co), selected for early-stage idea development — deciding what to build, whether it holds up, and how to prioritize among directions. Each entry: what it actually is, the concrete technique behind it, and the question to ask the user. Ask the question — don't lecture on the framework by name first.

## Reframing the problem

**Abstraction laddering** — Move up a level by asking "why does this matter?" (reveals the more fundamental problem) or down a level by asking "how might we solve this?" (reveals concrete, alternative framings). The classic example: "design a better can opener" ladders up to "get soup out of the can" and down to "make opening cans more convenient" — very different solution spaces.
Ask: "Why does this actually matter — what's one level up from the problem as you've stated it? And separately, what's the smallest, most concrete version of 'how' you'd solve it?"

**Inversion** — A three-step process: (1) identify the worst possible approach or decision, (2) write down thoroughly why it would fail, (3) use those failure reasons as a guide to build good solutions — essentially a "pre-mortem." Project teams do this by imagining the project already failed six months from now and asking what went wrong.
Ask: "Let's pre-mortem this — imagine it's six months from now and this has clearly failed. What happened?"

**First principles** — Two steps: deconstruct the problem down to truths that can't be reduced any further, then reconstruct a solution from those, rather than reasoning by analogy to what already exists. Two supporting techniques: the Five Whys (keep asking "why" past five times if needed) and Socratic questioning (clarify terms, challenge assumptions, probe reasoning, consider effects, examine alternatives, and question the question itself).
Ask: "If you strip away every existing example of this, what's the one truth underneath that has to hold for this to work at all?"

**Iceberg Model** — Four levels, each explaining more of the "why" as you go down: Events (what just happened) → Patterns (trends over time) → Structures (the relationships/processes producing the pattern) → Mental models (the beliefs and assumptions sustaining the structure). Events and patterns tell you *what*; structures and mental models tell you *why*. The deeper you go, the more leverage you have.
Ask: "What you're reacting to — is it a one-off event, or is it a pattern? And if it's a pattern, what structure or belief is actually producing it?"

**Ishikawa Diagram (fishbone)** — A structured way to avoid fixating on one cause: state the problem, then branch out into categories of contributing factors (commonly people, process, environment, materials, measurement — customize to fit), and under each ask "why is this happening?" to surface specific candidate causes. Multiple causes usually contribute; the point is to see several before picking one to test.
Ask: "Besides the cause you're already assuming, name two completely different categories of reasons this might be happening."

## Weighing consequences

**Second-order thinking** — Most people stop at the first-order effect of a decision. Two ways to go further: (1) the "and then what?" chain — take the immediate effect and keep asking what it leads to; (2) the 10/10/10 method — how does this look in 10 minutes, 10 months, and 10 years? Example: "more space" → "more rooms to clean" → "more household stress."
Ask: "Say this works exactly as planned — what does it look like in 10 minutes, in 10 months, and in 10 years? Those can look very different."

**Ladder of inference** — We climb seven rungs, usually unconsciously: available data → selected data (what we chose to notice) → interpretation (meaning assigned) → assumption → conclusion → belief → action. Bad decisions usually come from skipping straight to the top. The fix is to climb back down: what data did I actually select, and what did I filter out? What else could the interpretation mean? Are the assumptions actually valid?
Ask: "Before we go further — what did you actually observe, versus what you've already interpreted or assumed on top of it?"

## Prioritizing / deciding

**Impact-Effort Matrix** — Plot each option/direction on impact vs. effort required. Quick wins (high impact, low effort) go first. Major projects (high impact, high effort) get planned in after the quick wins. Fill-ins (low impact, low effort) are for spare time. Thankless tasks (low impact, high effort) get dropped.
Ask: "Of the directions we've named, which is the quick win — high payoff for comparatively little work — versus the major undertaking?"

**Eisenhower Matrix** — Sort by importance (does it move a real goal forward) vs. urgency (does it have a deadline). Important-and-urgent gets done now; important-not-urgent gets scheduled deliberately (this is the quadrant people under-invest in); urgent-not-important gets delegated or minimized; neither gets dropped. The trap this catches: mistaking urgency for importance.
Ask: "Is this actually important to you, or does it just feel urgent right now? Those aren't the same thing."

**Cynefin framework** — Classifies a situation into one of five domains, each implying a different mode of response: Clear/simple (cause-and-effect obvious, apply best practice — sense→categorize→respond), Complicated (knowable with expert analysis — sense→analyze→respond), Complex (unknowable in advance, only discoverable through experiments — probe→sense→respond), Chaotic (no clear cause-effect, stabilize first — act→sense→respond), and Disorder (unclear which domain applies — break the situation into parts and sort each one).
Ask: "Is the right answer here something an expert could figure out by analyzing hard enough, or is it something nobody can know until you actually try a small version and see what happens?"

**OODA loop** (Observe → Orient → Decide → Act, looped continuously) — Built for fast-moving, competitive, information-incomplete situations. Observe gathers what's available now (it decays fast). Orient synthesizes it against your experience and challenges your own assumptions. Decide frames the choice as a testable hypothesis, not a final verdict. Act implements it and generates the next round of observations. The advantage isn't being right the first time — it's cycling faster than the situation changes.
Ask: "What's the smallest real action you could take this week that would replace a guess with an observation?"

**Hard choice model** — A 2×2 on impact (how much this affects your life/work) and comparability (how easily the options stack up against each other). No-brainers (low impact, easy to compare): decide fast, don't optimize. Apples-and-oranges (low impact, hard to compare): go with current priorities. Big choice (high impact, easy to compare): worth real research time. Hard choice (high impact, hard to compare): accept there's no objectively correct answer — use a decision matrix, run small experiments to test assumptions, and recognize the choice reveals what you value.
Ask: "Are these options actually comparable, or are you trying to force a comparison between two things that are fundamentally different in kind?"

## People and systems

**Six Thinking Hats** — Deliberately cycle through six distinct modes rather than blending them: White (facts/data, no interpretation), Red (gut feeling/emotion, no justification needed), Black (risks, worst case, what could go wrong), Yellow (benefits, best case, why it could work), Green (new ideas, alternatives, unrestrained), Blue (stepping back to manage the process itself — are we covering the right hats?). Useful precisely when someone (often the user themselves) is stuck reasoning in only one mode.
Ask: "Let's separate two things you might be blending — purely the facts as you know them right now (no interpretation), versus purely how it feels in your gut. Let's do facts first."

**Situation-Behavior-Impact (SBI)** — A feedback structure that avoids assigning motive: describe the Situation (specific context), the Behavior (only the observable action, not your read on it), and the Impact (what it caused — emotionally or practically). Optionally ask about Intent before concluding, since the other person's actual reason may differ from what you assumed. Useful both for feedback to others and for you giving the user direct feedback on their idea without it landing as judgment.
Ask (when you need to give the user pointed feedback yourself): frame it as "In this part (situation), you said X (behavior) — and that's where I lost the thread (impact)," not "this part is weak."

**Connection circles (feedback loops)** — Put up to ~10 key elements of a system around a circle, draw arrows between elements that directly cause another to increase or decrease (labeled + or –), and look for closed loops. A closed loop where the effect reinforces the original direction is a *reinforcing* loop (things compound); one where the effect counteracts the original direction is a *balancing* loop (things stabilize). Useful whenever the idea is about an ongoing behavior or incentive, not a single event.
Ask: "If this idea works and people use it more, does using it more make the underlying thing better (reinforcing) or does it correct itself back to normal (balancing)?"

## Communication

**Minto Pyramid** — Traditional writing builds up to a conclusion; this inverts it. Lead with the conclusion/recommendation first (BLUF — bottom line up front), follow with 3-4 key supporting points, then back those with detailed evidence underneath. Built for busy audiences who may never reach the end of a bottom-up explanation.
Ask: "If I could only hear your first sentence, is it the actual point, or is it still the windup before the point?"
