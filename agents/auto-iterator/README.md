# auto-iterator

Autonomous iteration agent. Runs experiments, evaluates results against a single metric, keeps improvements, discards failures — and never stops on its own until a stopping condition is met or you interrupt it.

- **Mode:** subagent
- **Pairs with:** the [`auto-iterate`](../../skills/auto-iterate/README.md) skill, which sets up the `.auto-iterate/` workspace (config, research summary, baseline files) this agent then loops against.
- **Definition:** [`agent.md`](./agent.md)

## When to use it

Only after `auto-iterate` has created a workspace for the thing you want to optimize (code, a prompt, a config). This agent doesn't ask questions or design evaluation criteria itself — it executes the loop the skill already defined.

## Install

```bash
./install.sh --target claude-code --agent auto-iterator --global
```

(Swap `claude-code` for `opencode` or `antigravity` as needed — see the [root README](../../README.md#installation) for every target and scope.)

## Invoke

Once installed alongside the `auto-iterate` workspace: `@auto-iterator start the loop`.

Full behavior — the loop, evaluation protocols, error recovery, stopping conditions — is documented in [`agent.md`](./agent.md).
