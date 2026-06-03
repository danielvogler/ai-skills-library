# AGENTS.md

Instructions and workflow rules for any AI agent (Claude Code, Cursor, Codex, etc.) working with this repository. Read this file fully before touching anything.

---

## What this repo is

`danielvogler/ai-skills-library` is a curated, version-locked distribution of [Agent Skills](https://agentskills.io) — plain Markdown instruction files that AI coding assistants invoke to perform specialised tasks. It aggregates skills from multiple official upstream GitHub repositories and makes them installable with a single command.

Canonical skill files live under `.agents/skills/<name>/SKILL.md`. Agent-specific directories (`.claude/skills/`, `.gemini/skills/`, `.codex/skills/`) contain symlinks into `.agents/`. Provenance and content hashes are locked in `skills-lock.json`. This repo ships no application code.

---

## Prerequisites

Before working with this repo, verify these tools are available:

| Tool | Purpose | Install |
|------|---------|---------|
| `git` | Version control | pre-installed on most systems |
| `gh` | GitHub CLI — PRs, releases, API access | `brew install gh` or https://cli.github.com |
| `node` / `npx` | `skills` CLI — add, update, remove skills | https://nodejs.org or `brew install node` |
| `pipx` | Run `skills-ref validate` without a venv | `brew install pipx` |
| `python3` | Scripting and hash computation | pre-installed on macOS |

Check everything is present:

```bash
git --version && gh --version && npx --version && pipx --version
```

---

## Initial setup

```bash
# 1. Clone the repo
git clone https://github.com/danielvogler/ai-skills-library.git
cd ai-skills-library

# 2. Pull latest upstream skill content
npx skills update

# 3. Authenticate gh if not already done
gh auth login
```

---

## Using skills in another project

```bash
# Install a single skill into a project
cd ~/work/my-project
npx skills add danielvogler/ai-skills-library --skill terraform-skill

# Install a curated team profile (see profiles/ directory)
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s analytics-engineering

# List all available skills
npx skills add danielvogler/ai-skills-library --list

# Global install (all agents on this machine)
npx skills add danielvogler/ai-skills-library --skill karpathy-guidelines -g

# Target a specific agent (Cursor, etc.)
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent cursor
```

---

## Commit convention

Use [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

```text
<type>(<scope>): <short imperative description>
```

**Types:**

| Type | When to use |
|------|-------------|
| `feat` | A new skill or profile is added |
| `fix` | A bug or error in an existing skill is corrected |
| `chore` | Dependency sync (`npx skills update`), lock file update, tooling |
| `docs` | README, CONTRIBUTING, CHANGELOG, or other documentation only |
| `ci` | GitHub Actions workflow changes |
| `refactor` | Reorganising skill files or profile structure without changing content |
| `remove` | A skill or profile is deleted |

**Scopes** (use the skill name, profile name, or area):

```text
feat(gcp-bigquery): add BigQuery skill
fix(langgraph-state-machines): correct checkpointer example
chore(lock): sync upstream skills
docs(readme): add team profiles section
ci(validate): add skills validation workflow
```

One commit per logical unit of work. Do not batch unrelated skill additions into a single commit.

---

## Changelog

Maintain `CHANGELOG.md` using [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) format. **Update it in the same commit as the change** — never retroactively.

```markdown
## [Unreleased]

### Added
- `gcp-bigquery` skill — BigQuery SQL, partitioning, cost optimisation

### Changed
- `langgraph-state-machines` — updated checkpointer API examples for LangGraph 0.3

### Fixed
- `gitlab-cicd-basics` — corrected `needs` vs `dependencies` explanation

### Removed
- `deprecated-skill-name` — superseded by `new-skill-name`
```

Rules:
- All unreleased changes go under `## [Unreleased]`
- When cutting a release, rename `[Unreleased]` to `## [x.y.z] — YYYY-MM-DD` and add a new empty `[Unreleased]` section above it
- Do not add changelog entries for CI-only or docs-only changes unless they affect how contributors use the repo

---

## Skills workflow

### Where skills live in this repo

Canonical skill files live in `.agents/skills/<name>/SKILL.md`. Agent-specific directories (`.claude/skills/`, `.gemini/skills/`, `.codex/skills/`) are symlinks into `.agents/` — zero duplication. When downstream projects install FROM this repo, the `--agent` flag controls where skills land on their machine:

```bash
# Claude Code
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent claude-code
# Cursor
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent cursor
# OpenCode
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent opencode
# Gemini CLI
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent gemini
```

The CLI reads skill content from `.agents/skills/` in this repo and installs it into the agent-appropriate directory in the target project. Skills themselves (SKILL.md) are agent-agnostic Markdown — the directory location is the only agent-specific thing.

### Adding a skill from an upstream source

```bash
npx skills add <owner>/<repo> --copy --skill <name> --agent claude-code -y
```

Then immediately — **all four steps are mandatory, not optional**:

1. Run `npx skills update` to lock the hash in `skills-lock.json`
2. Validate: `pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref skills-ref validate .agents/skills/<name>`
3. Update `CHANGELOG.md` under `## [Unreleased] → ### Added`
4. Update `profiles/*.json` — add to every profile where this skill belongs
5. **Update `README.md`** — both the "Skills by Domain" table AND the "Upstream sources" table (count + license). The pre-commit hook will block your commit if README.md is not staged when skills-lock.json changes.

### Authoring a local skill (no upstream)

1. Create `.agents/skills/<name>/SKILL.md` following the [agentskills spec](https://agentskills.io), then add symlinks in `.claude/skills/`, `.gemini/skills/`, and `.codex/skills/` pointing to `../../.agents/skills/<name>`
2. Do **not** add it to `skills-lock.json` manually — local skills are intentionally absent from the lock
3. Validate it: `pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref skills-ref validate .agents/skills/<name>`
4. Add to `CHANGELOG.md`, relevant `profiles/*.json`, and `README.md`

### Syncing upstreams

```bash
npx skills update
git add skills-lock.json .agents/skills/ .claude/skills/ .gemini/skills/ .codex/skills/
git commit -m "chore(lock): sync upstream skills"
```

Do this before starting any other skill work to avoid stale-hash conflicts.

### Removing a skill

```bash
npx skills remove <name>
```

Then remove it from any `profiles/*.json` that reference it, update `README.md`, and add a `### Removed` entry to `CHANGELOG.md`.

---

## Profiles

Every time you add or remove a skill, ask: does this skill belong in one or more profiles?

Profiles live in `profiles/<name>.json`. Each file has this shape:

```json
{
  "name": "<profile-name>",
  "description": "One sentence describing the team this is for.",
  "skills": [
    "skill-name-one",
    "skill-name-two"
  ]
}
```

Rules:
- Skills in a profile must exist in `.agents/skills/` — do not reference skills that haven't been added yet
- Keep profiles lean: include what the team actually needs, not everything tangentially related
- `full-stack.json` is auto-derived — do not hand-edit it; it always lists every skill in the lock file

---

## README maintenance

**Every skill addition or removal requires three README changes. This is enforced by the pre-commit hook.**

### Skills by Domain table

Add or remove the skill row under the correct `###` section. If it comes from a new upstream source, add a new section. Keep the skill count in the section heading accurate.

### Upstream sources table

- If a new upstream was added: add a row with `owner/repo`, SPDX license ID, and skill count.
- If a skill count changed: update the count for that upstream.
- License must be the actual SPDX ID from the repo — check with `gh api repos/<owner>/<repo> --jq '.license.spdx_id'`. If no LICENSE file exists, write `no license file` and add a footnote.

### Skill count badge

Update the number in `[![Skills](https://img.shields.io/badge/skills-N-informational)]` at the top of README.md.

### What else triggers a README update

- Profile added or changed → update "Team Profiles" section
- Install command or CLI flags change → update "Quick install" section
- Do NOT update README for internal refactors, hook changes, or CI-only changes.

---

## Quality bar for skills

Before committing a skill (local or upstream):

- [ ] `skills-ref validate` passes with no errors
- [ ] The skill has a clear, specific trigger condition — agents must know exactly when to invoke it
- [ ] Examples in the skill use real, runnable commands (not pseudocode)
- [ ] No secrets, tokens, or personal data appear anywhere in the skill files
- [ ] The skill name is kebab-case and matches the directory name exactly

---

## Branch and PR rules

- Branch name: `<type>/<short-description>` — e.g. `feat/gcp-skills`, `fix/langgraph-checkpointer`, `chore/sync-upstreams`
- One PR per domain or logical batch — do not mix GCP skills and GitLab skills in one PR
- PR title must follow the same conventional commit format as the commit messages
- After opening a PR, do not push additional commits unless addressing review feedback

---

## What NOT to do

- Do not edit `skills-lock.json` manually — the CLI manages it
- Do not commit `.env`, `*.key`, `*.pem`, or anything under `secrets/`
- Do not amend commits that have already been pushed
- Do not squash or rebase on `main` without explicit instruction
- Do not add skills to profiles that haven't been added to the repo yet
