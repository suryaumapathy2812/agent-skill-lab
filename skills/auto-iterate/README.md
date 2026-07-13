# auto-iterate

Autonomous iteration and benchmarking toolkit, inspired by karpathy/autoresearcher. Define what to optimize, how to measure it, and let an agent loop forever — trying things, evaluating, keeping what works, discarding what doesn't.

- **Core principle:** fixed budget + single metric + infinite loop = automatic optimization.
- **Pairs with:** the [`auto-iterator`](../../agents/auto-iterator/README.md) agent, which executes the loop this skill sets up.
- **Definition:** [`SKILL.md`](./SKILL.md)

## When to use it

Optimizing code for speed/correctness/quality, iterating on a prompt, tuning config parameters, comparing many approaches, or running a benchmark — anything that's "try → evaluate → keep/discard → repeat."

## How it works

1. The skill asks what you're optimizing, what files are involved, how to run/test it, how to measure success, the time budget per experiment, and when to stop.
2. It researches the domain, establishes a baseline, and designs 3–5 weighted evaluation criteria (or uses your existing metric/test script).
3. It creates a `.auto-iterate/` workspace: `config.yaml`, `research.md`, `workspace/current/` + `workspace/best/`, `history.json`, and `run.sh` if using shell evaluation.
4. You invoke the `auto-iterator` agent to run the loop against that workspace.

## Install

```bash
./install.sh --target claude-code --skill auto-iterate --global
```

See the [root README](../../README.md#installation) for other targets/scopes, and [`SKILL.md`](./SKILL.md) for the full phase-by-phase setup process.
