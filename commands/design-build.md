---
description: Build a UI surface through research, UX architecture, implementation, critique, and refinement.
agent: design-engineer
---

Run `/design-build` for this UI task:

$ARGUMENTS

Use the full Design Engineer workflow:

1. Ensure root `DESIGN.md` exists; if missing, run the `/design-init` flow first.
2. Load the bundled `modern-design` skill and hard rules.
3. Invoke or emulate Design Researcher and save the brief to `.design-engineer/briefs/`.
4. Invoke or emulate UX Architect and save the UX plan to `.design-engineer/briefs/`.
5. Implement the UI using `DESIGN.md` tokens.
6. Log decisions to `.design-engineer/decisions/`.
7. Invoke or emulate Design Critic, save the critique, refine, and only declare done when the score is above 0.85.
