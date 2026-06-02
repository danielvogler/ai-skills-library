#!/usr/bin/env bash
# Pre-commit quality checks invoked by the Claude Code PreToolUse hook.
# Receives Claude's tool-input JSON on stdin; exits non-zero to block the commit.
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

# Only act on git commit commands
command=$(jq -r '.tool_input.command')
case "$command" in
  git\ commit*) ;;
  *) exit 0 ;;
esac

DOCS="README.md AGENTS.md CONTRIBUTING.md CHANGELOG.md SECURITY.md CODE_OF_CONDUCT.md"

echo "→ Markdown lint"
markdownlint-cli2 --config .markdownlint.json $DOCS

echo "→ GitHub Actions lint"
actionlint .github/workflows/*.yml

echo "→ README staged check"
staged=$(git diff --cached --name-only)
if echo "$staged" | grep -qE 'skills-lock\.json|\.claude/skills/'; then
  if ! echo "$staged" | grep -q 'README\.md'; then
    echo ""
    echo "ERROR: skills changed but README.md is not staged."
    echo "  Required: Skills by Domain table, Upstream sources table, skill count badge."
    exit 1
  fi
fi

echo "✓ All pre-commit checks passed."
