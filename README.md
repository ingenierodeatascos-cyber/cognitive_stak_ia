# AI Cognitive Stack Template

Plantilla per desenvolupar software amb IA de forma estructurada, amb context controlat i validacio humana.

## Per a qui es

Aquest repo esta pensat sobretot per a:

- estudiants de DAM que volen aprendre a treballar amb IA amb control
- desenvolupadors que volen una base reusable per projectes petits o mitjans

La prioritat del sistema es:

- poca carrega contextual
- flux curt i repetible
- rols clars
- memòria reusable sota demanda

## Idea central

El problema principal no es només el model. Es com s'organitza el context.

Aquest template intenta resoldre-ho amb quatre regles:

1. un sol canvi actiu
2. un workflow curt
3. separacio entre pensar, implementar i revisar
4. memòria consultada només quan cal

## Flux base

El cami recomanat per defecte es:

1. `planner`
2. `spec-writer`
3. `implementer`
4. `reviewer`
5. `archivist`

Peces com `task-writer`, `designer`, `tester` o `security-reviewer` son opcionals.

## Quickstart

### 1. Mira l'estat

```bash
./scripts/status.sh
```

### 2. Crea un canvi nou

```bash
./scripts/start-change.sh feature-login
```

Aixo genera el workspace temporal dins `docs/active/current-change/`.

### 3. Segueix el flux base

- `workflows/run-planner.md`
- `workflows/run-spec-writer.md`
- `workflows/run-implementer.md`
- `workflows/run-reviewer.md`
- `workflows/run-archivist.md`

### 4. Arxiva quan estigui tancat

```bash
./scripts/archive-change.sh feature-login
```

L'arxiu queda a `docs/archive/<any>/<nom-canvi>/` com a historic local per defecte.

## Estructura minima

```text
agents/                      rols dels agents
workflows/                   instruccions per cada fase
templates/                   formats de sortida
scripts/                     operativa de terminal
docs/project/                context estable del projecte
docs/active/current-change/  workspace temporal del canvi actual
docs/memory/                 coneixement reusable
memory/                      memòria interna del sistema
```

## Per on comencar

### Guia principal

- [Manual d'inici per a estudiants de DAM](docs/01_MANUAL_ESTUDIANT_DAM.md)

### Guia rapida

- [Cheatsheet del flux](docs/00_CODEX_CHEATSHEET.md)

### Guies complementaries

- [Guia del canvi actiu](docs/02_GUIA_CANVI_ACTIU.md)
- [Guia dels scripts](docs/03_GUIA_SCRIPTS.md)
- [Guia de memoria](docs/04_GUIA_MEMORIA.md)
- [Guia de workflows avancats](docs/05_GUIA_WORKFLOWS_AVANCATS.md)
- [Forma de treball setmanal](docs/06_TREBALL_SETMANAL.md)
- [Exemple longitudinal complet](docs/07_EXEMPLE_LONGITUDINAL.md)
- [Errors habituals i recuperacio](docs/08_ERRORS_HABITUALS.md)
- [Checklist documental](docs/09_CHECKLIST_DOCUMENTAL.md)
- [Punt de represa](docs/10_PUNT_REPRESA.md)

## Regla final

Si tens dubtes, no obris mes context: obre menys context i segueix la fase actual.
