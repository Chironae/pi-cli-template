# AGENTS.md

## Purpose
Pi CLI Template is a reusable starter for Raspberry Pi command-line tools and release workflows.

## Operating rules
- Changes to this repository can propagate into future projects; prefer generic, portable patterns.
- Keep template placeholders obvious and safe.
- Avoid hard-coded user-specific paths, credentials, hosts, or project names.
- Preserve release/versioning behavior unless the task explicitly changes it.
- Do not trigger releases, tags, or pushes merely to test a change.

## Validation
Before marking a change complete:
- run `make test`
- run `bash -n` on changed shell scripts when applicable
- review workflow/template changes for downstream impact

## Agent workflow
- INVESTIGATE: inspect and report.
- BUILD: implement on a feature branch and validate.
- FIX: reproduce using a generated/test project when practical, then fix.
- REVIEW: check portability, shell safety, release side effects, and downstream template impact.

## Approval gates
Human approval is required before release/tag automation, publishing releases, or changing defaults that affect newly generated projects.
