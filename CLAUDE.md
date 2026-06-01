# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A curated, version-locked collection of [Agent Skills](https://agentskills.io) aggregated from multiple upstream GitHub repositories. Skills are plain Markdown instruction files consumed by AI coding assistants (Claude Code, Cursor, etc.). This repo itself contains no application code — it is a distribution mechanism.

## Safety rules

- Never read or modify `.env`, `*.pem`, `*.key`, `secrets/**`, or `**/*.secret` files
- Always run tests before committing (if a test command exists for the change being made)
- Work only within this repository directory

## Managing skills

```bash
# Sync all skills to their latest upstream commits
npx skills update

# List available skills in this repo without installing
npx skills add danielvogler/ai-skills-library --list

# Add a new upstream source (copies real files, not symlinks)
npx skills add <owner>/<repo> --copy --skill '*' --agent claude-code -y

# Add specific skills from an upstream
npx skills add <owner>/<repo> --copy --skill <name1> <name2> --agent claude-code -y

# Remove a skill
npx skills remove <skill-name>

# Validate a skill folder against the spec
pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref skills-ref validate .claude/skills/<name>
```

After `npx skills update`, commit with:
```bash
git add -A && git commit -m "skills: sync"
```

## Architecture

### File layout

- `.claude/skills/<name>/SKILL.md` — the skill itself; some skills include `references/` and `agents/` subdirectories
- `skills-lock.json` — auto-generated manifest recording `source` (GitHub `owner/repo`), `skillPath` (path inside that repo), and `computedHash` for every installed skill

### How `skills-lock.json` works

Each key is a skill name. The `computedHash` locks the exact upstream content so drift is detectable. Editing skill files manually will cause hash mismatches on the next `npx skills update`. Always use the CLI to add or update; only edit a skill directly when intentionally diverging from upstream (and accept that `update` will overwrite it).

### Installing skills into other projects

```bash
# From inside the target project:
npx skills add danielvogler/ai-skills-library --skill <name>

# Global install (~/.claude/skills/)
npx skills add danielvogler/ai-skills-library --skill <name> -g

# Target a different agent (e.g. cursor)
npx skills add danielvogler/ai-skills-library --skill <name> --agent cursor
```

### Anthropic proprietary skills

Skills from `anthropics/skills` are **not** copied here (license forbids redistribution). Add them directly in the project that needs them via `npx skills add anthropics/skills --skill <name>`.
