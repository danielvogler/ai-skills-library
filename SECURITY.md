# Security Policy

## Scope

This repository distributes Markdown instruction files (skills) for AI coding assistants. There is no executable application code. Security concerns are most likely to arise from:

- A skill that instructs an AI agent to execute a dangerous command
- A skill that leaks or requests secrets/credentials
- A skill that could mislead an agent into a destructive action

## Reporting a vulnerability

Do **not** open a public GitHub issue for security concerns.

Report privately via [GitHub Security Advisories](../../security/advisories/new) or email the maintainer directly (address on the GitHub profile).

Include:
- The skill name and the specific instruction or example that is problematic
- A description of the potential harm
- A suggested fix if you have one

## Response timeline

- Acknowledgement within **3 business days**
- Assessment and triage within **7 business days**
- Fix or removal of the affected skill within **14 business days** for confirmed issues

## Skill review criteria

Every skill in this library is expected to:
- Never instruct agents to store, log, or transmit credentials
- Never use `rm -rf`, `chmod 777`, or other destructive shell patterns without explicit user confirmation steps
- Never make outbound network calls in ways that could exfiltrate data
- Be scoped to the stated use case — skills should not instruct agents to perform actions outside their declared domain

## Out of scope

- Vulnerabilities in upstream tools (`npx skills`, `skills-ref`, etc.) — report these to the respective maintainers
- General security questions about Claude Code or other AI assistants — contact Anthropic
