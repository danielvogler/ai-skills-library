# Changelog

All notable changes to this repository are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

## [0.2.0] — 2026-06-02

### Added
- `AGENTS.md` — self-contained setup guide and workflow rules for any AI agent: prerequisites, initial setup, install-into-project instructions, conventional commits, changelog format, skills workflow, profile maintenance, quality bar
- `CONTRIBUTING.md` — contributor guide covering upstream skills, local skill authoring, and PR checklist
- `SECURITY.md` — responsible disclosure policy
- `CODE_OF_CONDUCT.md` — Contributor Covenant 2.1
- `CHANGELOG.md` — Keep a Changelog format with this entry as v0.2.0
- `.editorconfig` — consistent whitespace across all Markdown skill files
- `.markdownlint.json` — permissive linting config for SKILL.md files
- `profiles/` directory with seven team profiles: `analytics-engineering`, `platform-engineering`, `ml-platform`, `ai-agents`, `frontend`, `backend-python`, `full-stack`
- `scripts/install-profile.sh` — one-command profile installer for any project
- `.github/workflows/validate-skills.yml` — CI: validate changed skills on every PR
- `.github/workflows/check-profiles.yml` — CI: verify all profile skill references exist
- `.github/workflows/release.yml` — auto-create GitHub Releases from CHANGELOG on tag push
- `.github/workflows/stale.yml` — auto-label stale issues and PRs
- `.github/workflows/lint-markdown.yml` — lint SKILL.md and docs Markdown files
- `.github/ISSUE_TEMPLATE/` — structured templates for skill requests and bug reports
- `.github/pull_request_template.md` — PR checklist
- `.github/CODEOWNERS` — default code ownership routing

### Changed
- `README.md` — full overhaul: badges, Skills by Domain index, Team Profiles install section, updated sources table
- `CLAUDE.md` — reference to `AGENTS.md`; updated commit message convention to Conventional Commits

## [0.1.0] — 2026-05-01

### Added
- Initial aggregation of 46 skills from 7 upstream sources: dbt-labs, hashicorp, antonbabenko, callstackincubator, forrestchang, google-gemini, langchain-ai
- `skills-lock.json` manifest with SHA-256 hashes for drift detection
- `CLAUDE.md` with safety rules, architecture overview, and skill management commands
- `.claude/settings.json` with permission allowlist and deny rules
