#!/usr/bin/env bash
# Regenerates profiles/full-stack.json from skills-lock.json.
# Run after any skill add/remove, or let the pre-commit hook call it automatically.
set -euo pipefail
REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "$REPO_ROOT"

node -e "
const fs = require('fs');
const lock = JSON.parse(fs.readFileSync('skills-lock.json', 'utf8'));
const skills = Object.keys(lock.skills).sort();
const profile = {
  name: 'full-stack',
  description: 'All skills currently in the library.',
  skills
};
fs.writeFileSync('profiles/full-stack.json', JSON.stringify(profile, null, 2) + '\n');
"

echo "✓ profiles/full-stack.json regenerated ($(jq '.skills | length' profiles/full-stack.json) skills)"
