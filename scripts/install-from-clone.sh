#!/usr/bin/env bash
# Workaround for a known npx-skills CLI bug: when installing directly from
# danielvogler/ai-skills-library via GitHub URL, the CLI misreads this repo's
# own provenance manifest (skills-lock.json) as the *target* project's "already
# installed" lock, and filters out every skill — resulting in
# "No valid skills found".
#
# This script clones the repo to a temp dir, removes the colliding lock file
# from that throwaway copy (our real skills-lock.json is untouched), and
# installs from the local clone instead — which the CLI handles correctly.
#
# Usage:
#   ./scripts/install-from-clone.sh --skill terraform-skill --agent claude-code
#   ./scripts/install-from-clone.sh --skill terraform-skill terraform-test --agent cursor
#   ./scripts/install-from-clone.sh --list
#
# Any arguments are passed through to `npx skills add`.
#
# IMPORTANT: always pass --agent explicitly. If you omit it, the CLI
# auto-detects the agent you're running in and installs to every "universal"
# agent directory it knows about (15+ agents) plus the detected one, instead
# of just the one you want — there's no interactive agent picker once the CLI
# detects an agent context.

set -euo pipefail

REPO_URL="https://github.com/danielvogler/ai-skills-library.git"
TMP_DIR="$(mktemp -d -t aisl-clone-XXXXXX)"
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "Cloning danielvogler/ai-skills-library into a temp directory..."
git clone --depth 1 -q "$REPO_URL" "$TMP_DIR/repo"
rm -f "$TMP_DIR/repo/skills-lock.json"

npx skills add "$TMP_DIR/repo" "$@"
