# Contributing

Thank you for helping grow this skills library. There are two ways to contribute: adding a skill from an existing upstream GitHub repo, or authoring a new skill locally.

## Before you start

- Open an issue first if you are proposing a brand-new domain or a large batch of skills — it avoids duplicate work.
- For small fixes (typos, broken examples), open a PR directly.
- Read [AGENTS.md](AGENTS.md) — it defines the commit convention, changelog rules, and skill quality bar every contributor (human or AI) must follow.

## Adding a skill from an upstream source

1. Check the [skills.sh](https://skills.sh/) ecosystem and the upstream repo for an existing skill before authoring from scratch.
2. From this repo's root:
   ```bash
   npx skills add <owner>/<repo> --copy --skill <name> --agent claude-code -y
   ```
3. Validate it:
   ```bash
   pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref \
     skills-ref validate .claude/skills/<name>
   ```
4. Update `CHANGELOG.md` under `## [Unreleased] > ### Added`.
5. Add the skill to the relevant `profiles/*.json` if it belongs there.
6. Update the "Skills by Domain" table in `README.md`.
7. Commit using [Conventional Commits](https://www.conventionalcommits.org/) — see `AGENTS.md`.

## Authoring a new local skill

Local skills have no upstream and are not tracked in `skills-lock.json`. Use them when no upstream exists.

1. Create `.claude/skills/<name>/SKILL.md` following the [agentskills spec](https://agentskills.io/specification). Required frontmatter:
   ```yaml
   ---
   name: your-skill-name
   description: One sentence. Exactly when an agent should invoke this skill.
   ---
   ```
2. Write practical, runnable content — not pseudocode. Real CLI commands, real config snippets.
3. Validate: `pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref skills-ref validate .claude/skills/<name>`
4. Follow steps 4–7 from the section above.

## Proposing a new upstream source

Open an issue with the label `upstream-source` and include:
- The GitHub `owner/repo`
- A list of skill names it would add
- The license (must be permissive — MIT, Apache-2.0, MPL-2.0)

## PR checklist

Before marking a PR ready for review:

- [ ] `skills-ref validate` passes for every new or changed skill
- [ ] `CHANGELOG.md` is updated in the same commit as the change
- [ ] Skill(s) are added to the correct `profiles/*.json`
- [ ] `README.md` "Skills by Domain" table is updated
- [ ] Commits follow Conventional Commits format
- [ ] No secrets, tokens, or credentials appear in skill files
- [ ] PR title matches the commit convention (e.g. `feat(gcp-bigquery): add BigQuery skill`)

## Skill quality bar

A skill is ready when:
- The `description` field tells an agent *exactly* when to invoke it — specific, not generic
- Examples use real, copy-pasteable commands
- It doesn't duplicate content already covered by another skill in the repo
- It passes `skills-ref validate` with no errors or warnings
