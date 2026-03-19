#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
TEST_REPO="$TMP_DIR/repo"

cleanup() {
  rm -rf "$TMP_DIR"
}

trap cleanup EXIT

cp -R "$ROOT_DIR" "$TEST_REPO"

cd "$TEST_REPO"

rm -f docs/active/current-change/* 2>/dev/null || true

echo "Checking start-change..."
./scripts/start-change.sh flow-test >/tmp/validate-flow-start.log

test -f docs/active/current-change/01_proposal.md
test -f docs/active/current-change/02_spec_delta.md
test -f docs/active/current-change/05_implementation_report.md
test -f docs/active/current-change/06_review.md

echo "Checking status after start-change..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Executa Planner"

cat <<'EOF' > docs/active/current-change/01_proposal.md
# PROPOSAL

## Change summary

Afegir creacio de tasques

## Problem

No es poden crear tasques

## Scope

### Included

- formulari de creacio

### Out of scope

- edicio

## Impact

- formulari

## Risks

- validacio d'input

## Open questions

- cap
EOF

echo "Checking status after proposal..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Executa Spec Writer"

cat <<'EOF' > docs/active/current-change/02_spec_delta.md
# SPEC DELTA

## Functional requirements

- crear tasques amb titol

## Non-functional requirements

- validacio basica

## Acceptance criteria

- si el titol es valid, es crea

## Edge cases

- titol buit

## Out of scope

- edicio
EOF

echo "Checking status after spec..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Implementer"

cat <<'EOF' > docs/active/current-change/05_implementation_report.md
# IMPLEMENTATION RESULT

## Tasks executed

- formulari de creacio

## Files modified

- src/task-form.ts

## Changes made

- formulari afegit

## Technical decisions

- validacio simple

## Pending tests

- cas de titol buit

## Risks

- cap de critic
EOF

echo "Checking status after implementation..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Executa Reviewer"

cat <<'EOF' > docs/active/current-change/06_review.md
# REVIEW RESULT

## Status

PASS

## Problems found

- cap

## Architecture violations

- cap

## Risks

- cap

## Recommended improvements

- afegir test
EOF

echo "Checking status after review..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Fes aprovacio humana final"

cat <<'EOF' > docs/active/current-change/09_human_approval.md
# HUMAN APPROVAL

## Phase

final

## Decision

APPROVED

## Notes

- correcte

## Risks accepted

- cap

## Approved by

tester

## Date

2026-03-19
EOF

echo "Checking status after approval..."
status_output="$(./scripts/status.sh)"
echo "$status_output" | grep -q "Executa Archivist i despres arxiva el canvi"

echo "Checking archive-change..."
./scripts/archive-change.sh flow-test >/tmp/validate-flow-archive.log

test -d "docs/archive/$(date +"%Y")/flow-test"

if find docs/active/current-change -mindepth 1 -print -quit | grep -q .; then
  echo "Current change directory is not empty after archive"
  exit 1
fi

echo "Operational flow validation OK"
