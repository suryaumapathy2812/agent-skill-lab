# thinking-partner

A recurring brainstorming agent. Tab into it whenever you want to think an idea through out loud, rather than have a task executed. It questions, reflects, and challenges — it never takes your idea and runs with it.

- **Mode:** all (works as a primary agent you Tab into, or a subagent another agent can call)
- **Wraps:** the [`idea-sparring`](../../skills/idea-sparring/README.md) skill, which holds the full session mechanics (Socratic questioning, thinking-tool lenses, reference cases, articulation practice, resumable per-idea notes). This agent is a standing, nameable form of that skill.
- **Definition:** [`agent.md`](./agent.md)

## When to use it

You have a raw, half-formed idea and no one to talk it through with yet — before you have to explain it to someone else, pressure-test it here first.

## Install

```bash
./install.sh --target opencode --agent thinking-partner --global
```

(See the [root README](../../README.md#installation) for other targets/scopes.)

## Invoke

- **OpenCode:** press `Tab` to switch to it, or `@thinking-partner` to invoke it directly.
- **Claude Code:** ask to delegate to `thinking-partner`, or just start brainstorming — the underlying `idea-sparring` skill auto-triggers on its own.

Full behavior lives in [`agent.md`](./agent.md) and, in more depth, in the [`idea-sparring` skill](../../skills/idea-sparring/README.md).
