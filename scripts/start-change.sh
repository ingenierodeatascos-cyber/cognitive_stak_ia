#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo "Has d'indicar el nom del canvi"
  echo "Exemple: ./scripts/start-change.sh feature-login"
  exit 1
fi

CHANGE_NAME=$1
CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"

if [ -d "$CHANGE_DIR" ] && [ "$(ls -A "$CHANGE_DIR" 2>/dev/null)" ]; then
  echo "Ja hi ha un canvi actiu a docs/active/current-change"
  echo "Arxiva'l abans de crear-ne un de nou:"
  echo "  ./scripts/archive-change.sh <nom-canvi>"
  exit 1
fi

echo "Creant nou canvi: $CHANGE_NAME"

mkdir -p "$CHANGE_DIR"

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

## Change summary

## Problem

## Scope

### Included

### Out of scope

## Impact

## Risks

## Open questions
EOF

echo "Estructura del canvi creada correctament"
echo "Ubicacio: $CHANGE_DIR"
echo "Seguent pas recomanat: ./scripts/status.sh"
