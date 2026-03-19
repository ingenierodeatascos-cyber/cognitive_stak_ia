#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$ROOT_DIR"

echo "Checking empty files in scripts/workflows/github workflows..."

empty_files="$(find scripts workflows .github/workflows -type f -empty | sort || true)"
if [ -n "$empty_files" ]; then
  echo "Found empty operational files:"
  echo "$empty_files"
  exit 1
fi

echo "Checking placeholder files are documented..."

for file in scripts/bootstrap.sh scripts/sync-memory.sh .github/workflows/release.yml .github/workflows/review.yml; do
  if [ ! -s "$file" ]; then
    echo "Placeholder file missing or empty: $file"
    exit 1
  fi
done

echo "Checking core docs describe the short flow..."

rg -q "planner" README.md
rg -q "spec-writer" README.md
rg -q "implementer" README.md
rg -q "reviewer" README.md
rg -q "archivist" README.md

rg -q "Flux base" ORCHESTRATOR.md
rg -q "Flux ampliat" ORCHESTRATOR.md

rg -q "Manual d'inici" README.md
rg -q "Guia rapida" README.md

echo "Checking advanced docs still describe optional pieces..."

rg -q "task-writer" docs/05_GUIA_WORKFLOWS_AVANCATS.md
rg -q "designer" docs/05_GUIA_WORKFLOWS_AVANCATS.md
rg -q "tester" docs/05_GUIA_WORKFLOWS_AVANCATS.md
rg -q "security-reviewer" docs/05_GUIA_WORKFLOWS_AVANCATS.md

echo "Checking active-change scaffolding remains documented..."

rg -q "01_proposal.md" docs/02_GUIA_CANVI_ACTIU.md
rg -q "05_implementation_report.md" docs/02_GUIA_CANVI_ACTIU.md
rg -q "06_review.md" docs/02_GUIA_CANVI_ACTIU.md

echo "Maintainability validation OK"
