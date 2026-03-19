#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$ROOT_DIR"

echo "Checking required documentation..."

required_files=(
  "README.md"
  "AGENTS.md"
  "ORCHESTRATOR.md"
  "docs/00_CODEX_CHEATSHEET.md"
  "docs/01_MANUAL_ESTUDIANT_DAM.md"
  "docs/02_GUIA_CANVI_ACTIU.md"
  "docs/03_GUIA_SCRIPTS.md"
  "docs/04_GUIA_MEMORIA.md"
  "docs/05_GUIA_WORKFLOWS_AVANCATS.md"
  "docs/06_TREBALL_SETMANAL.md"
  "docs/07_EXEMPLE_LONGITUDINAL.md"
  "docs/08_ERRORS_HABITUALS.md"
  "docs/09_CHECKLIST_DOCUMENTAL.md"
  "docs/project/00_PROJECT_STATE.md"
  "docs/project/01_SPEC.md"
  "docs/project/02_ARCHITECTURE.md"
  "docs/project/03_CONSTRAINTS.md"
  "docs/project/07_CONTEXT_RULES.md"
  "docs/project/08_DEFINITION_OF_DONE.md"
  "docs/project/09_GLOSSARY.md"
  "docs/memory/index.md"
)

for file in "${required_files[@]}"; do
  if [ ! -s "$file" ]; then
    echo "Missing or empty required file: $file"
    exit 1
  fi
done

echo "Checking markdown for local absolute paths..."

if rg -n "/Users/" --glob '*.md' . >/dev/null; then
  echo "Found local absolute paths in markdown files."
  rg -n "/Users/" --glob '*.md' .
  exit 1
fi

echo "Checking internal markdown links..."

python3 - <<'PY'
import re
import sys
from pathlib import Path

root = Path(".").resolve()
pattern = re.compile(r'\[[^\]]+\]\(([^)]+)\)')
issues = []

for md in root.rglob("*.md"):
    text = md.read_text(encoding="utf-8", errors="ignore")
    for line_no, line in enumerate(text.splitlines(), 1):
        for match in pattern.finditer(line):
            target = match.group(1)
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            rel = target.split("#", 1)[0]
            if not rel:
                continue
            candidate = (md.parent / rel).resolve()
            if not candidate.exists():
                issues.append(f"{md.relative_to(root)}:{line_no}: broken link -> {target}")

if issues:
    print("\n".join(issues))
    sys.exit(1)
PY

echo "Checking shell scripts syntax..."

for script in scripts/*.sh; do
  bash -n "$script"
done

echo "Documentation validation OK"
