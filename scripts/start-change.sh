#!/usr/bin/env bash

set -euo pipefail

if [ -z "$1" ]; then
  echo "Has d'indicar el nom del canvi"
  echo "Exemple: ./scripts/start-change.sh feature-login"
  exit 1
fi

CHANGE_NAME=$1
CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"

has_active_change_files() {
  find "$CHANGE_DIR" -mindepth 1 -maxdepth 1 ! -name '.gitkeep' -print -quit | grep -q .
}

if [ -d "$CHANGE_DIR" ] && has_active_change_files; then
  echo "Ja hi ha un canvi actiu a docs/active/current-change"
  echo "Arxiva'l abans de crear-ne un de nou:"
  echo "  ./scripts/archive-change.sh <nom-canvi>"
  exit 1
fi

echo "Creant nou canvi: $CHANGE_NAME"

mkdir -p "$CHANGE_DIR"
touch "$CHANGE_DIR/.gitkeep"

touch "$CHANGE_DIR/00_meta.md"
touch "$CHANGE_DIR/01_proposal.md"
touch "$CHANGE_DIR/02_spec_delta.md"
touch "$CHANGE_DIR/03_design.md"
touch "$CHANGE_DIR/04_tasks.md"
touch "$CHANGE_DIR/05_implementation_report.md"
touch "$CHANGE_DIR/06_review.md"
touch "$CHANGE_DIR/07_test_report.md"
touch "$CHANGE_DIR/08_security_review.md"
touch "$CHANGE_DIR/09_human_approval.md"

cat <<EOF > "$META_FILE"
# CHANGE META

name: $CHANGE_NAME
status: draft
created_at: $(date +"%Y-%m-%d %H:%M:%S")

EOF

cat <<EOF > "$CHANGE_DIR/01_proposal.md"
# PROPOSAL

<!-- TEMPLATE_STATUS: TODO -->

## Change summary

## Problem

## Scope

### Included

### Out of scope

## Impact

## Risks

## Open questions
EOF

cat <<EOF > "$CHANGE_DIR/02_spec_delta.md"
# SPEC DELTA

<!-- TEMPLATE_STATUS: TODO -->

## Functional requirements

## Non-functional requirements

## Acceptance criteria

## Edge cases

## Out of scope
EOF

cat <<EOF > "$CHANGE_DIR/03_design.md"
# DESIGN

<!-- TEMPLATE_STATUS: TODO -->

## Notes

Aquest fitxer es opcional.
Utilitza'l nomes si el canvi necessita definir UI, pantalles o fluxos d'usuari.

## Screens

## User flows

## Components

## States
EOF

cat <<EOF > "$CHANGE_DIR/04_tasks.md"
# TASKS

<!-- TEMPLATE_STATUS: TODO -->

## Notes

Aquest fitxer es opcional.
Utilitza'l nomes si el canvi es prou gran com per necessitar tasks separades.

## Task list

- task 1
- task 2
EOF

cat <<EOF > "$CHANGE_DIR/05_implementation_report.md"
# IMPLEMENTATION RESULT

<!-- TEMPLATE_STATUS: TODO -->

## Tasks executed

## Files modified

## Changes made

## Technical decisions

## Pending tests

## Risks
EOF

cat <<EOF > "$CHANGE_DIR/06_review.md"
# REVIEW RESULT

<!-- TEMPLATE_STATUS: TODO -->

## Status

PASS / FAIL

## Problems found

## Architecture violations

## Risks

## Recommended improvements
EOF

cat <<EOF > "$CHANGE_DIR/07_test_report.md"
# TEST REPORT

<!-- TEMPLATE_STATUS: TODO -->

## Notes

Aquest fitxer es opcional.
Utilitza'l si el canvi necessita una fase explicita de testing.

## Tested scenarios

## Results

## Edge cases

## Failures

## Not tested
EOF

cat <<EOF > "$CHANGE_DIR/08_security_review.md"
# SECURITY REVIEW

<!-- TEMPLATE_STATUS: TODO -->

## Notes

Aquest fitxer es opcional.
Utilitza'l si el canvi toca auth, dades sensibles, permisos o inputs externs.

## Risk level

LOW / MEDIUM / HIGH / CRITICAL

## Issues found

## Attack vectors

## Recommendations
EOF

cat <<EOF > "$CHANGE_DIR/09_human_approval.md"
# HUMAN APPROVAL

<!-- TEMPLATE_STATUS: TODO -->

## Notes

Aquest fitxer s'utilitza quan cal un gate huma explicit.

## Phase

## Decision

APPROVED / REJECTED / NEEDS CHANGES

## Notes

## Risks accepted

## Approved by

## Date
EOF

echo "Estructura del canvi creada correctament"
echo "Ubicacio: $CHANGE_DIR"
echo "Seguent pas recomanat: ./scripts/status.sh"
