#!/usr/bin/env bash

set -euo pipefail

CHANGE_DIR="docs/active/current-change"
META_FILE="$CHANGE_DIR/00_meta.md"

echo "=================================="
echo " AI COGNITIVE TEMPLATE - STATUS"
echo "=================================="
echo ""

has_active_change_files() {
  find "$CHANGE_DIR" -mindepth 1 -maxdepth 1 ! -name '.gitkeep' -print -quit | grep -q .
}

if [ ! -d "$CHANGE_DIR" ] || ! has_active_change_files; then
  echo "No hi ha cap canvi actiu."
  echo ""
  echo "Per començar un canvi nou:"
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
check_file "$CHANGE_DIR/03_design.md" "03_design.md"
check_file "$CHANGE_DIR/04_tasks.md" "04_tasks.md"
check_file "$CHANGE_DIR/05_implementation_report.md" "05_implementation_report.md"
check_file "$CHANGE_DIR/06_review.md" "06_review.md"
check_file "$CHANGE_DIR/07_test_report.md" "07_test_report.md"
check_file "$CHANGE_DIR/08_security_review.md" "08_security_review.md"
check_file "$CHANGE_DIR/09_human_approval.md" "09_human_approval.md"

echo ""
echo "---- FASE ESTIMADA ----"

if is_coherent_file "$CHANGE_DIR/09_human_approval.md"; then
  echo "Canvi practicament llest per arxivar"
elif is_completed_file "$CHANGE_DIR/08_security_review.md"; then
  echo "Revisio de seguretat completada"
elif is_completed_file "$CHANGE_DIR/07_test_report.md"; then
  echo "Testing completat"
elif is_coherent_file "$CHANGE_DIR/06_review.md"; then
  echo "Review completada"
elif is_coherent_file "$CHANGE_DIR/05_implementation_report.md"; then
  echo "Implementacio completada"
elif is_completed_file "$CHANGE_DIR/04_tasks.md"; then
  echo "Tasks definides - llest per implementar"
elif is_completed_file "$CHANGE_DIR/03_design.md"; then
  echo "Design completat"
elif is_coherent_file "$CHANGE_DIR/02_spec_delta.md"; then
  echo "Spec definida"
elif is_coherent_file "$CHANGE_DIR/01_proposal.md"; then
  echo "Proposal creada"
else
  echo "Canvi creat pero sense contingut util encara"
fi

echo ""
echo "---- PROPER PAS SUGGERIT ----"

if ! is_coherent_file "$CHANGE_DIR/01_proposal.md"; then
  echo "Executa Planner"
  echo "Workflow: workflows/run-planner.md"
elif ! is_coherent_file "$CHANGE_DIR/02_spec_delta.md"; then
  echo "Executa Spec Writer"
  echo "Workflow: workflows/run-spec-writer.md"
elif ! is_coherent_file "$CHANGE_DIR/05_implementation_report.md"; then
  echo "Fes revisio humana de proposal/spec i despres Implementer"
  echo "Workflow: workflows/run-implementer.md"
elif ! is_coherent_file "$CHANGE_DIR/06_review.md"; then
  echo "Executa Reviewer"
  echo "Workflow: workflows/run-reviewer.md"
elif ! is_coherent_file "$CHANGE_DIR/09_human_approval.md"; then
  echo "Fes aprovacio humana final i prepara arxiu"
else
  echo "Executa Archivist i despres arxiva el canvi"
  echo "Workflow: workflows/run-archivist.md"
  echo "Script: ./scripts/archive-change.sh <nom-canvi>"
fi

echo ""
echo "---- MODE BASE RECOMANAT ----"
echo "Planner -> Spec Writer -> Implementer -> Reviewer -> Archivist"
echo "Task Writer, Tester i Security Reviewer son opcionals."

echo ""
echo "=================================="
