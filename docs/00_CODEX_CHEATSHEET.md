# CODEX WORKFLOW CHEATSHEET

## Flux minim

```bash
./scripts/status.sh
./scripts/start-change.sh <nom-canvi>
```

Despres treballa nomes amb:

- `01_proposal.md`
- `02_spec_delta.md`
- `05_implementation_report.md`
- `06_review.md`

## Que obrir ara

Planner:

- `agents/planner.md`
- `workflows/run-planner.md`
- `docs/project/*`
- `docs/active/current-change/01_proposal.md`

Spec Writer:

- `agents/spec-writer.md`
- `workflows/run-spec-writer.md`
- `docs/active/current-change/02_spec_delta.md`

Implementer:

- `agents/implementer.md`
- `workflows/run-implementer.md`
- `docs/active/current-change/05_implementation_report.md`

Reviewer:

- `agents/reviewer.md`
- `workflows/run-reviewer.md`
- `docs/active/current-change/06_review.md`

## Ignora per ara

- `03_design.md`
- `04_tasks.md`
- `07_test_report.md`
- `08_security_review.md`

## Tancament

```bash
./scripts/archive-change.sh
```

## Regla rapida

Si et perds, executa `./scripts/status.sh` i obre nomes el que et demana.
