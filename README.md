# AI Cognitive Stack Template

Plantilla per desenvolupar software amb IA de manera estructurada, amb context controlat i validacio humana.

## Per a qui es

Aquest repositori esta pensat sobretot per a:

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

Si es la teva primera vegada, fes nomes aixo.

### 1. Mira si ja hi ha un canvi actiu

```bash
./scripts/status.sh
```

### 2. Si no hi ha canvi actiu, crea'n un

```bash
./scripts/start-change.sh mi-primer-canvi
```

Aixo genera el workspace temporal dins `docs/active/current-change/`.

### 3. Fes la teva primera task

Comenca per aqui:

- `agents/planner.md`
- `workflows/run-planner.md`
- `docs/active/current-change/01_proposal.md`

Quan acabis, executa una altra vegada `./scripts/status.sh` i segueix el que et digui.

### 4. Quan tanquis el canvi, arxiva'l

```bash
./scripts/archive-change.sh
```

L'arxiu queda a `docs/archive/<any>/<nom-canvi>/` com a historic local per defecte.

## Regla del primer dia

Si dubtes, no obris mes context: obre nomes els fitxers de la fase actual.

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

Segueix sempre el flux curt abans d'activar cap peça opcional.
