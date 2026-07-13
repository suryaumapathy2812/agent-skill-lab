# idea-sparring

Conversational thinking partner for brainstorming and developing raw, early-stage ideas. Uses Socratic questioning, untools.co-derived mental models, and grounded reference cases (how notable people/companies reasoned through analogous problems) to help you develop and articulate ideas you haven't talked through with anyone else yet.

- **Role:** sparring partner, not co-founder — it draws the idea out of you via questions; it doesn't generate the idea or take it over.
- **Pairs with:** the [`thinking-partner`](../../agents/thinking-partner/README.md) agent, a standing form of this skill you can Tab into directly in OpenCode.
- **Definition:** [`SKILL.md`](./SKILL.md) · **Toolbox:** [`references/toolbox.md`](./references/toolbox.md)

## When to use it

You have an idea but haven't stress-tested it, can't yet explain it well to someone else, or want to look at it from angles you haven't considered.

## Session flow

Raw idea capture (unedited) → Socratic questioning (problem/user/mechanism/assumptions/motivation) → perspective-shift via 1–2 thinking-tool lenses → a grounded reference case → articulation practice (explain it in 30 seconds, refined over a few passes, kept in your own words) → capture an artifact.

Sessions are resumable: each idea gets `.idea-sparring/<idea-slug>/session.md` in the current project, with the raw first-pass idea, the current articulation, questions/answers surfaced, lenses applied, reference points discussed, and open questions to pick up next time.

## Thinking toolbox

16 mental models from [untools.co](https://untools.co), curated for early-stage idea development (not the full 25) — inversion, first principles, abstraction laddering, the iceberg model, second-order thinking, the ladder of inference, impact-effort and Eisenhower matrices, Cynefin, OODA, the hard choice model, six thinking hats, SBI feedback, connection circles, and the Minto pyramid. See [`references/toolbox.md`](./references/toolbox.md) for what each one actually does and the question to ask.

## Install

```bash
./install.sh --target claude-code --skill idea-sparring --global
```

See the [root README](../../README.md#installation) for other targets/scopes.
