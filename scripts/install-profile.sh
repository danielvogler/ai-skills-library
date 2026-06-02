#!/usr/bin/env bash
# Install all skills from a named profile into the current project.
#
# Usage:
#   ./scripts/install-profile.sh <profile-name> [extra npx skills flags]
#
# Examples:
#   ./scripts/install-profile.sh analytics-engineering
#   ./scripts/install-profile.sh platform-engineering --agent cursor
#   ./scripts/install-profile.sh ml-platform -g          # global install
#
# Available profiles: analytics-engineering, platform-engineering, ml-platform,
#                     ai-agents, frontend, backend-python, full-stack

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILES_DIR="$SCRIPT_DIR/../profiles"
REPO="danielvogler/ai-skills-library"

PROFILE="${1:-}"
if [[ -z "$PROFILE" ]]; then
  echo "Usage: $0 <profile-name> [extra flags]"
  echo ""
  echo "Available profiles:"
  for f in "$PROFILES_DIR"/*.json; do
    name=$(basename "$f" .json)
    desc=$(jq -r '.description' "$f")
    printf "  %-30s %s\n" "$name" "$desc"
  done
  exit 1
fi

shift  # remaining args passed through to npx skills add

PROFILE_FILE="$PROFILES_DIR/$PROFILE.json"
if [[ ! -f "$PROFILE_FILE" ]]; then
  echo "Error: profile '$PROFILE' not found in $PROFILES_DIR"
  exit 1
fi

SKILLS=$(jq -r '.skills[]' "$PROFILE_FILE")
SKILL_COUNT=$(echo "$SKILLS" | wc -l | tr -d ' ')

echo "Installing $SKILL_COUNT skills from profile '$PROFILE'..."
echo ""

# shellcheck disable=SC2086
npx skills add "$REPO" --skill $SKILLS "$@"

echo ""
echo "Done. $SKILL_COUNT skills installed from profile '$PROFILE'."
