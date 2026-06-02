# AI Skills Library

[![Version](https://img.shields.io/badge/version-0.2.0-blue)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-45-informational)](#skills-by-domain)
[![License](https://img.shields.io/github/license/danielvogler/ai-skills-library)](LICENSE)
[![Validate Skills](https://github.com/danielvogler/ai-skills-library/actions/workflows/validate-skills.yml/badge.svg)](https://github.com/danielvogler/ai-skills-library/actions/workflows/validate-skills.yml)
[![Check Profiles](https://github.com/danielvogler/ai-skills-library/actions/workflows/check-profiles.yml/badge.svg)](https://github.com/danielvogler/ai-skills-library/actions/workflows/check-profiles.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Upstreams](https://img.shields.io/badge/upstreams-7-orange)](#upstream-sources)

A curated, version-locked collection of [Agent Skills](https://agentskills.io) aggregated from multiple upstream GitHub repositories. Skills are plain Markdown instruction files consumed by AI coding assistants (Claude Code, Cursor, and others). This repo is a distribution mechanism — it contains no application code.

Skill folders live under `.claude/skills/`. Every skill's provenance and content hash is tracked in `skills-lock.json`.

---

## Quick install

```bash
# Install a single skill into your project
npx skills add danielvogler/ai-skills-library --skill terraform-skill

# Install a curated team profile (see Team Profiles below)
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s analytics-engineering

# List all available skills without installing
npx skills add danielvogler/ai-skills-library --list
```

---

## Team Profiles

Instead of picking skills individually, install a pre-curated bundle for your team type.

| Profile | Description | Install |
|---------|-------------|---------|
| `analytics-engineering` | dbt (full suite), GitHub, CI | `install-profile.sh analytics-engineering` |
| `platform-engineering` | Terraform, AWS/Azure/cloud, GitHub | `install-profile.sh platform-engineering` |
| `ml-platform` | Gemini API, Deep Agents, GitHub | `install-profile.sh ml-platform` |
| `ai-agents` | Deep Agents, Gemini, LLM patterns | `install-profile.sh ai-agents` |
| `frontend` | React Native, GitHub | `install-profile.sh frontend` |
| `backend-python` | GitHub, CI — more skills planned | `install-profile.sh backend-python` |
| `full-stack` | Everything in the library | `install-profile.sh full-stack` |

**Install a profile:**

```bash
# From inside your target project — installs to .claude/skills/
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s <profile-name>

# With agent flag (e.g. Cursor)
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s <profile-name> -- --agent cursor

# Global install
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s <profile-name> -- -g
```

Profile definitions live in [`profiles/`](profiles/). See [`scripts/install-profile.sh`](scripts/install-profile.sh) for how it works.

---

## Skills by Domain

### dbt (14 skills)
Source: `dbt-labs/dbt-agent-skills` · Apache-2.0

| Skill | Description |
|-------|-------------|
| `running-dbt-commands` | Run dbt commands (run, test, build, compile) |
| `adding-dbt-unit-test` | Write unit tests for dbt models |
| `building-dbt-semantic-layer` | Build MetricFlow semantic models and metrics |
| `using-dbt-for-analytics-engineering` | General dbt analytics engineering patterns |
| `using-dbt-index` | Index and navigate the dbt project |
| `fetching-dbt-docs` | Retrieve dbt documentation pages |
| `troubleshooting-dbt-job-errors` | Debug dbt job failures |
| `working-with-dbt-mesh` | Multi-project dbt Mesh patterns |
| `migrating-dbt-core-to-fusion` | Migrate to dbt Fusion |
| `migrating-dbt-project-across-platforms` | Cross-platform dbt migration |
| `creating-mermaid-dbt-dag` | Visualise dbt lineage as a Mermaid diagram |
| `answering-natural-language-questions-with-dbt` | Answer data questions via the Semantic Layer |
| `configuring-dbt-mcp-server` | Configure the dbt MCP server for AI tools |
| `auditing-skills` | Audit skills for quality issues |

### Terraform / Infrastructure (16 skills)
Source: `hashicorp/agent-skills` · MPL-2.0 + `antonbabenko/terraform-skill` · Apache-2.0

| Skill | Description |
|-------|-------------|
| `terraform-skill` | General Terraform patterns |
| `terraform-style-guide` | Terraform style and conventions |
| `terraform-stacks` | Terraform Stacks (preview feature) |
| `terraform-test` | Write and run Terraform tests |
| `terraform-search-import` | Import existing resources |
| `new-terraform-provider` | Scaffold a new provider |
| `provider-docs` | Write provider documentation |
| `provider-resources` | Implement provider resources |
| `provider-actions` | GitHub Actions for provider CI |
| `provider-test-patterns` | Provider testing patterns |
| `refactor-module` | Refactor Terraform modules |
| `run-acceptance-tests` | Run provider acceptance tests |
| `aws-ami-builder` | Build AWS AMIs with Packer |
| `azure-image-builder` | Build Azure images with Packer |
| `azure-verified-modules` | AVM certification requirements |
| `windows-builder` | Build Windows images with Packer |
| `push-to-registry` | Push images to a container registry |

### Google AI / Gemini (3 skills)
Source: `google-gemini/gemini-skills` · Apache-2.0

| Skill | Description |
|-------|-------------|
| `gemini-api-dev` | Build with the Gemini API |
| `gemini-interactions-api` | Gemini interactions API patterns |
| `gemini-live-api-dev` | Gemini Live API development |

### LangChain Deep Agents (3 skills)
Source: `langchain-ai/langchain-skills`

| Skill | Description |
|-------|-------------|
| `deep-agents-core` | Create Deep Agents with LangChain |
| `deep-agents-memory` | State, store, and filesystem backends |
| `deep-agents-orchestration` | Subagents, TodoList, human-in-the-loop |

### React Native (5 skills)
Source: `callstackincubator/agent-skills` · MIT

| Skill | Description |
|-------|-------------|
| `react-native-best-practices` | React Native development best practices |
| `react-native-brownfield-migration` | Migrate existing apps to React Native |
| `upgrading-react-native` | Upgrade React Native versions |
| `github` | GitHub CLI patterns, PRs, branching |
| `github-actions` | GitHub Actions workflow patterns |

### Engineering Guidelines (1 skill)
Source: `forrestchang/andrej-karpathy-skills` · MIT

| Skill | Description |
|-------|-------------|
| `karpathy-guidelines` | LLM coding guidelines from Andrej Karpathy |

### Local / Utility (3 skills)

| Skill | Description |
|-------|-------------|
| `final-checks` | Pre-commit quality checks |
| `validate-skills` | Validate skills against the spec |
| `auditing-skills` | Audit skills for quality |

---

## Upstream sources

| Upstream | License | Skills added |
|----------|---------|-------------|
| `dbt-labs/dbt-agent-skills` | Apache-2.0 | 14 |
| `hashicorp/agent-skills` | MPL-2.0 | 16 |
| `antonbabenko/terraform-skill` | Apache-2.0 | 1 |
| `callstackincubator/agent-skills` | MIT | 5 |
| `forrestchang/andrej-karpathy-skills` | MIT | 1 |
| `google-gemini/gemini-skills` | Apache-2.0 | 3 |
| `langchain-ai/langchain-skills` | — | 3 |

---

## Installing skills into another project

```bash
# Install one skill
npx skills add danielvogler/ai-skills-library --skill terraform-skill

# Install several
npx skills add danielvogler/ai-skills-library \
  --skill running-dbt-commands gemini-api-dev karpathy-guidelines

# Global install (~/.claude/skills/)
npx skills add danielvogler/ai-skills-library --skill terraform-skill -g

# Target a different agent
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent cursor
```

---

## Keeping skills up to date

```bash
# In this repo — re-pull all upstreams to their latest commits
npx skills update
git add -A && git commit -m "chore(lock): sync upstream skills"

# In a downstream project — pull the latest from this repo
npx skills update
```

---

## Adding a new upstream source

```bash
# Copy all skills from an upstream into this library
npx skills add <owner>/<repo> --copy --skill '*' --agent claude-code -y

# Selectively copy specific skills
npx skills add <owner>/<repo> --copy --skill <name1> <name2> --agent claude-code -y
```

`--copy` writes real files instead of symlinks so the repo is shareable on GitHub.

After adding, validate each new skill:

```bash
pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref \
  skills-ref validate .claude/skills/<name>
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to propose a skill, add from an upstream, or author a local skill. All contributors (human and AI) must follow [AGENTS.md](AGENTS.md) for commit conventions and workflow rules.

---

## Proprietary skills (do not copy here)

Anthropic's [`anthropics/skills`](https://github.com/anthropics/skills) are under a proprietary per-skill licence that forbids redistribution. Add them directly in the project that needs them:

```bash
# Examples
npx skills add anthropics/skills --skill claude-api
npx skills add anthropics/skills --skill skill-creator
npx skills add anthropics/skills --skill pptx
```

---

## Discovery & specification

- Browse the wider ecosystem: <https://skills.sh/>
- Format spec: <https://agentskills.io/specification>
- Validate any skill folder:
  ```bash
  pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref \
    skills-ref validate .claude/skills/<name>
  ```
