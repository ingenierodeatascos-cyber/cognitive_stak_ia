```bash
#!/usr/bin/env bash

set -e

# =========================
# VALIDACIÓ INPUT
# =========================

if [ -z "$1" ]; then
  echo "❌ Has d'indicar el nom del canvi"
  echo "Exemple: ./scripts/start-change.sh feature-login"
  exit 1
fi

CHANGE_NAME=$1
CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"

# =========================
# VALIDAR SI JA HI HA CANVI ACTIU
# =========================

if [ -d "$CHANGE_DIR" ] && [ "$(ls -A $CHANGE_DIR 2>/dev/null)" ]; then
  echo "⚠️ Ja hi ha un canvi actiu a docs/active/current-change"
  echo "👉 Arxiva'l abans de crear-ne un de nou:"
  echo "   ./scripts/archive-change.sh <nom-canvi>"
  exit 1
fi

# =========================
# CREAR ESTRUCTURA
# =========================

echo "🚀 Creant nou canvi: $CHANGE_NAME"

mkdir -p $CHANGE_DIR

touch $CHANGE_DIR/00_meta.md
touch $CHANGE_DIR/01_proposal.md
touch $CHANGE_DIR/02_spec_delta.md
touch $CHANGE_DIR/03_design.md
touch $CHANGE_DIR/04_tasks.md
touch $CHANGE_DIR/05_implementation_report.md
touch $CHANGE_DIR/06_review.md
touch $CHANGE_DIR/07_test_report.md
touch $CHANGE_DIR/08_security_review.md
touch $CHANGE_DIR/09_human_approval.md

# =========================
# INICIALITZAR META
# =========================

cat <<EOF > $META_FILE
# CHANGE META

name: $CHANGE_NAME
status: draft
created_at: $(date +"%Y-%m-%d %H:%M:%S")

EOF

# =========================
# INICIALITZAR PROPOSAL
# =========================

cat <<EOF > $CHANGE_DIR/01_proposal.md
# Change: $CHANGE_NAME

## Context

## Problem

## Proposed Solution

## Impact

EOF

echo "✅ Estructura de canvi creada correctament"
echo "📂 Ubicació: $CHANGE_DIR"
```
