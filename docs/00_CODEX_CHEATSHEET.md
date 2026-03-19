# CODEX WORKFLOW CHEATSHEET

Referencia rapida del sistema.

Si es la teva primera vegada, comenca per aqui:

- [Manual d'inici per a estudiants de DAM](01_MANUAL_ESTUDIANT_DAM.md)

## Flux base

```text
start-change.sh
planner
spec-writer
implementer
reviewer
archivist
archive-change.sh
```

## Flux ampliat opcional

```text
designer / task-writer / tester / security-reviewer
```

Activa'l nomes si el canvi ho necessita.

## Scripts basics

Crear canvi:

```bash
./scripts/start-change.sh <nom-canvi>
```

Veure estat:

```bash
./scripts/status.sh
```

Arxivar:

```bash
./scripts/archive-change.sh <nom-canvi>
```

## Fitxers clau del flux base

- `01_proposal.md`
- `02_spec_delta.md`
- `05_implementation_report.md`
- `06_review.md`

## Que obrir segons la fase

Planner:

- `agents/planner.md`
- `workflows/run-planner.md`
- `docs/project/*`

Spec Writer:

- `agents/spec-writer.md`
- `workflows/run-spec-writer.md`
- `01_proposal.md`

Implementer:

- `agents/implementer.md`
- `workflows/run-implementer.md`
- `02_spec_delta.md`

Reviewer:

- `agents/reviewer.md`
- `workflows/run-reviewer.md`
- `05_implementation_report.md`

Archivist:

- `agents/archivist.md`
- `workflows/run-archivist.md`
- `docs/active/current-change/*`

## Regles rapides

- no implementis sense `proposal` i `spec`
- no carreguis tot el repo
- no carreguis tota la memoria
- no surtis del scope
- revisa abans d'arxivar

## Si et perds

1. executa `./scripts/status.sh`
2. mira en quina fase estas
3. obre nomes els fitxers d'aquella fase
