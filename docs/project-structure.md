# Project Structure

## Skills

Each skill is independent and lives at:

```txt
skills/<skill-name>/SKILL.md
skills/<skill-name>/README.md      Human-facing overview; links back to the root README and out to SKILL.md
skills/<skill-name>/references/    Optional supporting reference files
```

Skill names should be lowercase and hyphen-separated. `SKILL.md` is the model-facing instruction file (what an agent loads); `README.md` is the human-facing summary — keep them separate rather than duplicating one into the other.

## Agents

Each agent lives in its own directory:

```txt
agents/<agent-name>/agent.md    The actual agent definition (frontmatter + system prompt)
agents/<agent-name>/README.md  Human-facing overview; links back to the root README
```

`install.sh` copies `agent.md` into the target CLI's agents directory, renamed to `<agent-name>.md` (the filename is what the CLI uses as the agent's identifier — `agent.md` itself is never copied verbatim). Keep one `agent.md` per agent unless it needs supporting reference files, in which case add them alongside inside the same `<agent-name>/` directory.

## Commands

OpenCode slash command definitions live in `commands/`. Keep one command per markdown file and use `$ARGUMENTS` for user input.

## Reports

Use `reports/skills-and-agents-report.md` as the single inventory and summary report for the repository.

## References

References are intentionally chunked so agents can load only relevant context.

```txt
references/products/        Product-specific research notes
references/modern-design/   Modern UI/component polish references
references/ai-design/       AI workspace/product architecture references
skills/modern-design/references/ OpenCode Design Engineer constraint references
```

Prefer adding a focused markdown file over expanding a skill into one very large file.

## skills.sh

The `skills.sh.json` file controls how skills are grouped on skills.sh repository pages.
