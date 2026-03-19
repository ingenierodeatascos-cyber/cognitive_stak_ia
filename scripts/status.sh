#!/usr/bin/env bash

set -e

CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"

echo "=================================="
echo " AI COGNITIVE TEMPLATE - STATUS"
echo "=================================="
echo ""

# =========================
# VALIDAR SI HI HA CANVI ACTIU
# =========================

if [ ! -d "$CHANGE_DIR" ] || [ -z "$(ls -A "$CHANGE_DIR" 2>/dev/null)" ]; then
  echo "ℹ️ No hi ha cap canvi actiu."
  echo ""
  echo "Per començar un canvi nou:"
  echo "./scripts/start-change.sh <nom-canvi>"
  exit 0
fi

echo "✅ Hi ha un canvi actiu a: $CHANGE_DIR"
echo ""

# =========================
# LLEGIR META SI EXISTEIX
# =========================

if [ -f "$META_FILE" ]; then
  echo "---- META ----"
  grep -E '^(name|status|created_at|archived_at|archived_path):' "$META_FILE" || true
  echo ""
else
  echo "⚠️ No existeix 00_meta.md"
  echo ""
fi

# =========================
# COMPROVAR FITXERS CLAU
# =========================

echo "---- FITXERS DEL CANVI ----"

check_file() {
  local file="$1"
  local label="$2"

  if [ -f "$file" ] && [ -s "$file" ]; then
    echo "✅ $label"
  elif [ -f "$file" ]; then
    echo "🟡 $label (existeix però buit)"
  else
    echo "❌ $label (no existeix)"
  fi
}

check_file "$CHANGE_DIR/01_proposal.md" "01_proposal.md"
check_file "$CHANGE_DIR/02_spec_delta.md" "02_spec_delta.md"
check_file "$CHANGE_DIR/03_design.md" "03_design.md"
check_file "$CHANGE_DIR/04_tasks.md" "04_tasks.md"
check_file "$CHANGE_DIR/05_implementation_report.md" "05_implementation_report.md"
check_file "$CHANGE_DIR/06_review.md" "06_review.md"
check_file "$CHANGE_DIR/07_test_report.md" "07_test_report.md"
check_file "$CHANGE_DIR/08_security_review.md" "08_security_review.md"
check_file "$CHANGE_DIR/09_human_approval.md" "09_human_approval.md"

echo ""

# =========================
# INFERIR FASE ACTUAL
# =========================

echo "---- FASE ESTIMADA ----"

if [ -s "$CHANGE_DIR/09_human_approval.md" ]; then
  echo "🏁 Canvi pràcticament llest per arxivar"
elif [ -s "$CHANGE_DIR/08_security_review.md" ]; then
  echo "🔐 Revisió de seguretat completada"
elif [ -s "$CHANGE_DIR/07_test_report.md" ]; then
  echo "🧪 Testing completat"
elif [ -s "$CHANGE_DIR/06_review.md" ]; then
  echo "🔍 Review completada"
elif [ -s "$CHANGE_DIR/05_implementation_report.md" ]; then
  echo "🛠️ Implementació completada"
elif [ -s "$CHANGE_DIR/04_tasks.md" ]; then
  echo "📋 Tasks definides - llest per implementar"
elif [ -s "$CHANGE_DIR/03_design.md" ]; then
  echo "🎨 Design completat"
elif [ -s "$CHANGE_DIR/02_spec_delta.md" ]; then
  echo "📐 Spec definida"
elif [ -s "$CHANGE_DIR/01_proposal.md" ]; then
  echo "🧠 Proposal creada"
else
  echo "⚠️ Canvi creat però sense contingut útil encara"
fi

echo ""

# =========================
# PROPER PAS SUGGERIT
# =========================

echo "---- PROPER PAS SUGGERIT ----"

if [ ! -s "$CHANGE_DIR/01_proposal.md" ]; then
  echo "Executa Planner"
  echo "Workflow: workflows/run-planner.md"
elif [ ! -s "$CHANGE_DIR/02_spec_delta.md" ]; then
  echo "Executa Spec Writer"
  echo "Workflow: workflows/run-spec-writer.md"
elif [ ! -s "$CHANGE_DIR/04_tasks.md" ]; then
  echo "Executa Task Writer"
  echo "Workflow: workflows/run-task-writer.md"
elif [ ! -s "$CHANGE_DIR/05_implementation_report.md" ]; then
  echo "Revisió humana de proposal/spec/tasks i després Implementer"
  echo "Workflow: workflows/run-implementer.md"
elif [ ! -s "$CHANGE_DIR/06_review.md" ]; then
  echo "Executa Reviewer"
  echo "Workflow: workflows/run-reviewer.md"
elif [ ! -s "$CHANGE_DIR/07_test_report.md" ]; then
  echo "Considera Tester si el canvi té risc funcional"
  echo "Workflow: workflows/run-tester.md"
elif [ ! -s "$CHANGE_DIR/08_security_review.md" ]; then
  echo "Considera Security Reviewer si el canvi toca auth, dades sensibles o inputs externs"
  echo "Workflow: workflows/run-security-reviewer.md"
elif [ ! -s "$CHANGE_DIR/09_human_approval.md" ]; then
  echo "Fes aprovació humana final i prepara arxiu"
else
  echo "Executa Archivist i després arxiva el canvi"
  echo "Workflow: workflows/run-archivist.md"
  echo "Script: ./scripts/archive-change.sh <nom-canvi>"
fi

echo ""
echo "=================================="