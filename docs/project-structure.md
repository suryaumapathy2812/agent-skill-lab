# Project Structure

## Skills

Each skill is independent and lives at:

```txt
skills/<skill-name>/SKILL.md
```

Skill names should be lowercase and hyphen-separated.

## Agents

Agent definitions will live in `agents/`. Keep one agent per markdown file unless an agent requires supporting reference files.

## Reports

Use `reports/skills-and-agents-report.md` as the single inventory and summary report for the repository.

## References

References are intentionally chunked so agents can load only relevant context.

```txt
references/products/        Product-specific research notes
references/modern-design/   Modern UI/component polish references
references/ai-design/       AI workspace/product architecture references
```

Prefer adding a focused markdown file over expanding a skill into one very large file.

## skills.sh

The `skills.sh.json` file controls how skills are grouped on skills.sh repository pages.
