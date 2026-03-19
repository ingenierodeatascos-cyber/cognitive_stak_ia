# CODEX WORKFLOW CHEATSHEET

Guia rapida de referencia.

Si es la teva primera vegada amb el sistema, comenca per aqui:

- [01_MANUAL_ESTUDIANT_DAM.md](01_MANUAL_ESTUDIANT_DAM.md)

Aquest fitxer no substitueix el manual. Nomes resumeix el flux.

## Flux base recomanat

```text
1. start-change.sh
2. planner
3. spec-writer
4. implementer
5. reviewer
6. archivist
7. archive-change.sh
```

## Flux ampliat opcional

Utilitza'l nomes si el canvi ho necessita:

```text
planner -> spec-writer -> designer/task-writer -> implementer -> reviewer -> tester/security-reviewer -> archivist
```

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

## Regles rapides

- no implementis sense `proposal` i `spec`
- no carreguis tot el repo
- no carreguis tota la memoria
- no surtis del scope del canvi
- revisa abans d'arxivar

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
- `docs/project/02_ARCHITECTURE.md`
- `docs/project/03_CONSTRAINTS.md`

Reviewer:

- `agents/reviewer.md`
- `workflows/run-reviewer.md`
- `02_spec_delta.md`
- `05_implementation_report.md`

Archivist:

- `agents/archivist.md`
- `workflows/run-archivist.md`
- `docs/active/current-change/*`
- `docs/memory/index.md`

## Model mental

- `docs/project/` -> que es el projecte
- `docs/active/current-change/` -> que estic fent ara
- `docs/memory/` -> que val la pena recordar
- `memory/` -> memoria interna del sistema

## Recordatori final

Si et perds:

1. executa `./scripts/status.sh`
2. mira en quina fase estas
3. obre nomes els fitxers d'aquella fase
