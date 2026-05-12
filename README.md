# ai-skills-library

An aggregated collection of [Agent Skills](https://agentskills.io) pulled from multiple upstream sources and managed by [`npx skills`](https://github.com/vercel-labs/skills). Installable into any project with a single command.

Skill folders live under `.claude/skills/`; provenance for every skill is tracked in `skills-lock.json`.

## Layout

```
ai-skills-library/
├── .claude/
│   └── skills/                # installed skills, one folder each
│       ├── terraform-skill/
│       ├── running-dbt-commands/
│       ├── gemini-api-dev/
│       └── ...
├── skills-lock.json           # auto-generated manifest: skill -> source repo + hash
├── LICENSE
└── README.md
```

## Sources

| Upstream | License | Skills |
|---|---|---|
| `dbt-labs/dbt-agent-skills` | Apache-2.0 | 14 |
| `hashicorp/agent-skills` | MPL-2.0 | 16 (terraform, packer) |
| `antonbabenko/terraform-skill` | Apache-2.0 | 1 |
| `callstackincubator/agent-skills` | MIT | ~10 (github, react-native, etc.) |
| `forrestchang/andrej-karpathy-skills` | MIT | 1 |
| `google-gemini/gemini-skills` | Apache-2.0 | 3 |
| `langchain-ai/langchain-skills` | unspecified | 3 (deep-agents-core/memory/orchestration) |

## Using a skill in another project

From inside the target project, point `npx skills add` at this repo on GitHub:

```bash
# install one
npx skills add danielvogler/ai-skills-library --skill terraform-skill

# install several
npx skills add danielvogler/ai-skills-library --skill running-dbt-commands gemini-api-dev karpathy-guidelines

# user-global (~/.claude/skills/) instead of project-scope
npx skills add danielvogler/ai-skills-library --skill terraform-skill -g

# target a different agent
npx skills add danielvogler/ai-skills-library --skill terraform-skill --agent cursor

# list what's available without installing
npx skills add danielvogler/ai-skills-library --list
```

## Updating

```bash
# in this repo: re-pull all upstreams to their latest commits
npx skills update
git add -A && git commit -m "skills: sync"

# in a downstream project: pull the latest after this repo is pushed
npx skills update
```

## Adding a new upstream source

```bash
# from this repo's root
npx skills add <owner>/<repo> --copy --skill '*' --agent claude-code -y

# selectively:
npx skills add <owner>/<repo> --copy --skill <name1> <name2> --agent claude-code -y
```

`--copy` writes real files instead of symlinks so the repo is shareable on GitHub.

## Removing a skill

```bash
npx skills remove <skill-name>
```

## Proprietary skills (reference only — do not copy here)

Anthropic's [`anthropics/skills`](https://github.com/anthropics/skills) ships under a proprietary per-skill `LICENSE.txt` that forbids redistribution. They are NOT copied into this repo. Add them directly in the project where they are needed:

```bash
cd ~/work/some-project

# document formats
npx skills add anthropics/skills --skill pptx
npx skills add anthropics/skills --skill xlsx
npx skills add anthropics/skills --skill docx
npx skills add anthropics/skills --skill pdf

# building / authoring
npx skills add anthropics/skills --skill skill-creator
npx skills add anthropics/skills --skill mcp-builder
npx skills add anthropics/skills --skill claude-api

# design / visual
npx skills add anthropics/skills --skill brand-guidelines
npx skills add anthropics/skills --skill canvas-design
npx skills add anthropics/skills --skill frontend-design
npx skills add anthropics/skills --skill theme-factory
npx skills add anthropics/skills --skill web-artifacts-builder
npx skills add anthropics/skills --skill algorithmic-art

# documents / comms
npx skills add anthropics/skills --skill doc-coauthoring
npx skills add anthropics/skills --skill internal-comms
npx skills add anthropics/skills --skill slack-gif-creator

# QA
npx skills add anthropics/skills --skill webapp-testing
```

## Discovery & specification

- Browse the wider ecosystem: <https://skills.sh/>
- Format spec: <https://agentskills.io/specification>
- Validate any skill folder:
  ```bash
  pipx run --spec git+https://github.com/agentskills/agentskills.git#subdirectory=skills-ref skills-ref validate .claude/skills/<name>
  ```
