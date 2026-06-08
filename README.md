# AI Skills Library

[![Version](https://img.shields.io/badge/version-0.2.0-blue)](CHANGELOG.md)
[![Skills](https://img.shields.io/badge/skills-81-informational)](#skills-by-domain)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Validate Skills](https://github.com/danielvogler/ai-skills-library/actions/workflows/validate-skills.yml/badge.svg)](https://github.com/danielvogler/ai-skills-library/actions/workflows/validate-skills.yml)
[![Check Profiles](https://github.com/danielvogler/ai-skills-library/actions/workflows/check-profiles.yml/badge.svg)](https://github.com/danielvogler/ai-skills-library/actions/workflows/check-profiles.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Upstreams](https://img.shields.io/badge/upstreams-9-orange)](#upstream-sources)

A curated, version-locked collection of [Agent Skills](https://agentskills.io) aggregated from multiple upstream GitHub repositories. Skills are plain Markdown instruction files consumed by AI coding assistants (Claude Code, Cursor, and others). This repo is a distribution mechanism — it contains no application code.

Skill files (SKILL.md) are agent-agnostic Markdown. Canonical storage lives in `.agents/skills/` — a neutral directory read by all AI coding assistants. Agent-specific directories (`.claude/skills/`, `.opencode/`, `.gemini/`) symlink into it. The `--agent` flag at install time controls where skills land in your own project.

Every skill's provenance and content hash is tracked in `skills-lock.json`.

---

## Quick install

```bash
# Claude Code (default)
npx skills add danielvogler/ai-skills-library --skill terraform-skill

# Cursor
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent cursor

# OpenCode
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent opencode

# Gemini CLI
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent gemini

# Global install — available to all agents on this machine
npx skills add danielvogler/ai-skills-library --skill terraform-skill -g

# Install a curated team profile (see Team Profiles below)
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-profile.sh \
  | bash -s analytics-engineering

# List all available skills without installing
npx skills add danielvogler/ai-skills-library --list
```

> **Seeing "No valid skills found"?** A known bug in the `npx skills` CLI causes
> direct GitHub installs from this repo to fail — see
> [Troubleshooting: install fails with "No valid skills found"](#troubleshooting-install-fails-with-no-valid-skills-found)
> for a one-line workaround.

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

### Engineering Best Practices (23 skills)

Source: `addyosmani/agent-skills` · no license file¹

| Skill | Description |
|-------|-------------|
| `api-and-interface-design` | Design stable APIs, module boundaries, REST/GraphQL endpoints |
| `browser-testing-with-devtools` | Test in real browsers via Chrome DevTools MCP |
| `ci-cd-and-automation` | Set up and modify build and deployment pipelines |
| `code-review-and-quality` | Structured code review and quality gate patterns |
| `code-simplification` | Identify and apply simplification opportunities |
| `context-engineering` | Structure context for AI coding agents effectively |
| `debugging-and-error-recovery` | Systematic debugging and error diagnosis workflows |
| `deprecation-and-migration` | Plan and execute deprecations and breaking changes |
| `documentation-and-adrs` | Write docs and Architecture Decision Records |
| `doubt-driven-development` | Surface assumptions before implementing |
| `frontend-ui-engineering` | Frontend architecture, components, and UX patterns |
| `git-workflow-and-versioning` | Branching strategies, commits, releases |
| `idea-refine` | Structure and sharpen an idea before building |
| `incremental-implementation` | Break large changes into safe incremental steps |
| `interview-me` | Interactive technical interview preparation |
| `performance-optimization` | Profile, measure, and improve performance |
| `planning-and-task-breakdown` | Decompose work into actionable tasks |
| `security-and-hardening` | Apply security best practices and hardening |
| `shipping-and-launch` | Pre-launch checklists and shipping patterns |
| `source-driven-development` | Ground implementation in authoritative sources |
| `spec-driven-development` | Write the spec before writing the code |
| `test-driven-development` | TDD workflows: red → green → refactor |
| `using-agent-skills` | Understand and use agent skills effectively |

### Google ADK (6 skills)

Source: `google/adk-python` · Apache-2.0

| Skill | Description |
|-------|-------------|
| `adk-agent-builder` | Build, test, and iterate on ADK agents; configure modes and graph workflows |
| `adk-architecture` | ADK graph orchestration, event flow, state management, and LLM context |
| `adk-debug` | Debug ADK agents, inspect sessions, troubleshoot tool calls and event flow |
| `adk-setup` | Set up a local ADK development environment |
| `adk-sample-creator` | Author new ADK samples and agent pattern demonstrations |
| `adk-style` | ADK Python style guide — idioms, typing, Pydantic patterns, conventions |

### OpenAI Codex (7 skills)

Source: `openai/codex` · Apache-2.0

| Skill | Description |
|-------|-------------|
| `babysit-pr` | Monitor a PR, handle CI failures, respond to review comments automatically |
| `code-review` | Run a final code review on a pull request |
| `code-breaking-changes` | Detect and document breaking changes in a diff |
| `code-review-change-size` | Enforce change size limits (800-line guideline) |
| `code-review-context` | Verify model-visible context is sufficient for review |
| `code-review-testing` | Test authoring guidance for PR reviewers |
| `codex-pr-body` | Update pull request titles and bodies |

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
| `forrestchang/andrej-karpathy-skills` | no license file¹ | 1 |
| `google-gemini/gemini-skills` | Apache-2.0 | 3 |
| `langchain-ai/langchain-skills` | no license file¹ | 3 |
| `addyosmani/agent-skills` | no license file¹ | 23 |
| `openai/codex` | Apache-2.0 | 7 |
| `google/adk-python` | Apache-2.0 | 6 |

¹ No LICENSE file in the upstream repo. Skills are included in good faith given their public distribution intent, but use at your own discretion. Consider opening an issue on the upstream repo to request a license.

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

## Troubleshooting: install fails with "No valid skills found"

If `npx skills add danielvogler/ai-skills-library --skill <name>` fails with:

```text
No valid skills found. Skills require a SKILL.md with name and description.
```

this is a known bug in the upstream `skills` CLI, not a problem with the skill
name you picked. The CLI reads this repo's own provenance manifest
(`skills-lock.json`) and mistakes it for the *target* project's "already
installed" lock — since the manifest lists every skill in the library by name,
the CLI concludes all of them are already installed and filters every single
one out, regardless of which `--skill` you asked for.

**Workaround — install from a local clone instead:**

```bash
./scripts/install-from-clone.sh --skill terraform-skill
```

(Run from a clone of this repo, or fetch and run the script directly:)

```bash
curl -sL https://raw.githubusercontent.com/danielvogler/ai-skills-library/main/scripts/install-from-clone.sh \
  | bash -s -- --skill terraform-skill
```

The script clones this repo to a temp directory, removes the colliding
`skills-lock.json` from that throwaway copy (the real one in this repo is
untouched), and installs from the local clone — which the CLI handles
correctly. Any flags you'd normally pass to `npx skills add` (`--agent`, `-g`,
multiple `--skill` names, `--list`, etc.) work the same way here.

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
