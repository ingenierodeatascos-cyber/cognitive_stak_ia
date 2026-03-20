#!/usr/bin/env bash

set -euo pipefail

CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"
CORE_FILES=(
  "01_proposal.md"
  "02_spec_delta.md"
  "05_implementation_report.md"
  "06_review.md"
  "09_human_approval.md"
)

echo "=================================="
echo " AI COGNITIVE TEMPLATE - STATUS"
echo "=================================="
echo ""

has_active_change_files() {
  find "$CHANGE_DIR" -mindepth 1 -maxdepth 1 ! -name '.gitkeep' -print -quit | grep -q .
}

if [ ! -d "$CHANGE_DIR" ] || ! has_active_change_files; then
  echo "---- ESTAT ACTUAL ----"
  echo "No hi ha cap canvi actiu."
  echo ""
  echo "---- OBRE ARA ----"
  echo "- docs/00_CODEX_CHEATSHEET.md"
  echo ""
  echo "---- IGNORA PER ARA ----"
  echo "- README.md"
  echo "- docs/01_MANUAL_ESTUDIANT_DAM.md"
  echo ""
  echo "---- SEGUENT PAS ----"
  echo "./scripts/start-change.sh <nom-canvi>"
  exit 0
fi

echo "Hi ha un canvi actiu a: $CHANGE_DIR"
echo ""

if [ -f "$META_FILE" ]; then
  echo "---- META ----"
  grep -E '^(name|status|created_at|archived_at|archived_path):' "$META_FILE" || true
  echo ""
fi

echo "---- FITXERS DEL CANVI ----"

is_completed_file() {
  local file="$1"
  [ -f "$file" ] && [ -s "$file" ] && ! grep -q "<!-- TEMPLATE_STATUS: TODO -->" "$file"
}

section_has_content() {
  local file="$1"
  local heading="$2"

  awk -v heading="$heading" '
    $0 == heading {
      in_section = 1
      next
    }

    in_section && /^## / {
      exit
    }

    in_section && /^[[:space:]]*$/ {
      next
    }

    in_section && /^<!--/ {
      next
    }

    in_section {
      found = 1
      exit
    }

    END {
      if (found) {
        exit 0
      }

      exit 1
    }
  ' "$file"
}

is_coherent_file() {
  local file="$1"

  if ! is_completed_file "$file"; then
    return 1
  fi

  case "$(basename "$file")" in
    01_proposal.md)
      section_has_content "$file" "## Change summary" &&
        section_has_content "$file" "## Problem" &&
        section_has_content "$file" "### Included" &&
        section_has_content "$file" "### Out of scope" &&
        section_has_content "$file" "## Risks"
      ;;
    02_spec_delta.md)
      section_has_content "$file" "## Functional requirements" &&
        section_has_content "$file" "## Acceptance criteria" &&
        section_has_content "$file" "## Out of scope"
      ;;
    05_implementation_report.md)
      section_has_content "$file" "## Tasks executed" &&
        section_has_content "$file" "## Files modified" &&
        section_has_content "$file" "## Changes made" &&
        section_has_content "$file" "## Risks"
      ;;
    06_review.md)
      section_has_content "$file" "## Status" &&
        section_has_content "$file" "## Problems found" &&
        section_has_content "$file" "## Risks"
      ;;
    09_human_approval.md)
      section_has_content "$file" "## Phase" &&
        section_has_content "$file" "## Decision" &&
        section_has_content "$file" "## Approved by" &&
        section_has_content "$file" "## Date"
      ;;
    *)
      is_completed_file "$file"
      ;;
  esac
}

check_file() {
  local file="$1"
  local label="$2"

  if is_coherent_file "$file"; then
    echo "OK  $label"
  elif is_completed_file "$file"; then
    echo "WARN $label (contingut present pero camps minims incomplets)"
  elif [ -f "$file" ] && grep -q "<!-- TEMPLATE_STATUS: TODO -->" "$file"; then
    echo "WARN $label (plantilla pendent d'omplir)"
  elif [ -f "$file" ]; then
    echo "WARN $label (existeix pero buit)"
  else
    echo "MISS $label"
  fi
}

check_file "$CHANGE_DIR/01_proposal.md" "01_proposal.md"
check_file "$CHANGE_DIR/02_spec_delta.md" "02_spec_delta.md"
check_file "$CHANGE_DIR/05_implementation_report.md" "05_implementation_report.md"
check_file "$CHANGE_DIR/06_review.md" "06_review.md"
check_file "$CHANGE_DIR/09_human_approval.md" "09_human_approval.md"

echo ""
echo "---- FASE ESTIMADA ----"

if is_coherent_file "$CHANGE_DIR/09_human_approval.md"; then
  echo "Canvi practicament llest per arxivar"
elif is_coherent_file "$CHANGE_DIR/06_review.md"; then
  echo "Review completada"
elif is_coherent_file "$CHANGE_DIR/05_implementation_report.md"; then
  echo "Implementacio completada"
elif is_coherent_file "$CHANGE_DIR/02_spec_delta.md"; then
  echo "Spec definida"
elif is_coherent_file "$CHANGE_DIR/01_proposal.md"; then
  echo "Proposal creada"
else
  echo "Canvi creat pero sense contingut util encara"
fi

echo ""
echo "---- ESTAT ACTUAL ----"

if ! is_coherent_file "$CHANGE_DIR/01_proposal.md"; then
  current_state="Planner pendent"
  next_step="Executa Planner"
  next_workflow="workflows/run-planner.md"
  open_now=(
    "docs/active/current-change/01_proposal.md"
    "agents/planner.md"
    "workflows/run-planner.md"
  )
elif ! is_coherent_file "$CHANGE_DIR/02_spec_delta.md"; then
  current_state="Spec Writer pendent"
  next_step="Executa Spec Writer"
  next_workflow="workflows/run-spec-writer.md"
  open_now=(
    "docs/active/current-change/02_spec_delta.md"
    "agents/spec-writer.md"
    "workflows/run-spec-writer.md"
  )
elif ! is_coherent_file "$CHANGE_DIR/05_implementation_report.md"; then
  current_state="Implementacio pendent"
  next_step="Fes revisio humana de proposal/spec i despres Implementer"
  next_workflow="workflows/run-implementer.md"
  open_now=(
    "docs/active/current-change/02_spec_delta.md"
    "agents/implementer.md"
    "workflows/run-implementer.md"
  )
elif ! is_coherent_file "$CHANGE_DIR/06_review.md"; then
  current_state="Review pendent"
  next_step="Executa Reviewer"
  next_workflow="workflows/run-reviewer.md"
  open_now=(
    "docs/active/current-change/05_implementation_report.md"
    "agents/reviewer.md"
    "workflows/run-reviewer.md"
  )
elif ! is_coherent_file "$CHANGE_DIR/09_human_approval.md"; then
  current_state="Aprovacio humana pendent"
  next_step="Fes aprovacio humana final i prepara arxiu"
  next_workflow=""
  open_now=(
    "docs/active/current-change/06_review.md"
    "docs/active/current-change/09_human_approval.md"
    "agents/archivist.md"
  )
else
  current_state="Canvi llest per arxivar"
  next_step="Executa Archivist i despres arxiva el canvi"
  next_workflow="workflows/run-archivist.md"
  open_now=(
    "docs/active/current-change/06_review.md"
    "docs/active/current-change/09_human_approval.md"
    "workflows/run-archivist.md"
  )
fi

echo ""
echo "$current_state"
echo ""
echo "---- OBRE ARA ----"
for file in "${open_now[@]}"; do
  echo "- $file"
done
echo ""
echo "---- IGNORA PER ARA ----"
echo "- design"
echo "- tasks"
echo "- tests"
echo "- security"
echo ""
echo "---- SEGUENT PAS ----"
echo "$next_step"
if [ -n "${next_workflow:-}" ]; then
  echo "Workflow: $next_workflow"
fi
if [ "$current_state" = "Canvi llest per arxivar" ]; then
  echo "Script: ./scripts/archive-change.sh"
fi
echo ""
echo "---- MODE BASE RECOMANAT ----"
echo "Planner -> Spec Writer -> Implementer -> Reviewer -> Archivist"
echo "Task Writer, Tester i Security Reviewer son opcionals."

echo ""
echo "=================================="
