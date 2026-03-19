# Manual d'Inici per a Estudiants de DAM

Aquest manual explica com començar a programar amb aquest sistema quan el teu projecte encara no existeix o acaba de començar.

La idea no és “fer servir la IA perquè ho faci tot”, sinó aprendre a treballar amb ordre, amb poc context i amb control.

## 1. Que es aquest sistema

Aquest template serveix per desenvolupar software amb IA sense dependre de converses llargues ni de prompts improvisats.

El sistema es basa en:

- fases curtes
- fitxers concrets
- rols separats
- context carregat sota demanda

Aixo vol dir que no treballes dient-li a la IA “fes-me el projecte sencer”, sino que vas tancant petits canvis amb un flux controlat.

## 2. Que no es aquest sistema

No es:

- un chatbot per anar provant idees sense ordre
- una metodologia per fer deu coses alhora
- una excusa per programar sense pensar
- una memoria on guardar-ho tot

Si l'utilitzes be, aquest sistema t'ajuda a pensar millor. Si l'utilitzes malament, nomes afegeix carpetes.

## 3. Que has d'entendre abans de comencar

Abans de fer servir el sistema, un estudiant de DAM hauria d'entendre aquestes quatre idees:

### Un canvi actiu

Sempre es treballa en un sol canvi alhora.

No facis diversos canvis en paral lel dins del mateix context actiu.

### No carregar tot el repo

La IA no ha de llegir tot el projecte cada vegada. Nomes ha de veure els fitxers que necessita per la fase actual.

### No barrejar fases

Pensar no es el mateix que implementar.

Per aixo hi ha fases diferents:

- `planner`
- `spec-writer`
- `implementer`
- `reviewer`
- `archivist`

### La memoria no es un magatzem de tot

Només es guarda el que sigui reutilitzable.

## 4. Quines carpetes has de coneixer el primer dia

Aquestes son les mes importants:

- `docs/project/`: defineix el projecte
- `docs/active/current-change/`: canvi actual
- `docs/memory/`: coneixement reusable
- `agents/`: que fa cada rol
- `workflows/`: com executar cada fase
- `scripts/`: eines de terminal

La regla practica es:

- si defineix el projecte -> `docs/project/`
- si pertany al canvi actual -> `docs/active/current-change/`
- si pot servir en futurs canvis -> `docs/memory/`

## 5. Com iniciar un projecte des de zero

Quan el projecte encara no esta preparat, primer has d'omplir el context base del projecte.

Els fitxers importants son:

- [00_PROJECT_STATE.md](/Users/damiacosta/Desktop/Projectes/Templates/ai-cognitive-template/docs/project/00_PROJECT_STATE.md)
- [01_SPEC.md](/Users/damiacosta/Desktop/Projectes/Templates/ai-cognitive-template/docs/project/01_SPEC.md)
- [02_ARCHITECTURE.md](/Users/damiacosta/Desktop/Projectes/Templates/ai-cognitive-template/docs/project/02_ARCHITECTURE.md)
- [03_CONSTRAINTS.md](/Users/damiacosta/Desktop/Projectes/Templates/ai-cognitive-template/docs/project/03_CONSTRAINTS.md)

No cal escriure documents perfectes. Cal que siguin prou clars per respondre:

- quin projecte es
- quin problema resol
- quina arquitectura base tindra
- quines limitacions hi ha

### Exemple senzill

Suposem que vols fer una app web CRUD de tasques.

El projecte base podria quedar aixi:

- `00_PROJECT_STATE.md`: projecte buit o en fase inicial
- `01_SPEC.md`: app per crear, llistar, editar i eliminar tasques
- `02_ARCHITECTURE.md`: app web amb frontend i backend simples
- `03_CONSTRAINTS.md`: prioritzar simplicitat, validacio basica i mantenibilitat

## 6. Com crear el primer canvi

Quan ja tens el context base, pots obrir el primer canvi.

Executa:

```bash
./scripts/start-change.sh init-task-crud
```

Aixo et crea la carpeta:

- `docs/active/current-change/`

Despres mira l'estat:

```bash
./scripts/status.sh
```

Aquest script et diu:

- si hi ha canvi actiu
- quins fitxers estan plens o buits
- en quina fase estas
- quin es el seguent pas recomanat

## 7. Flux base pas a pas

Aquest es el flux recomanat per un estudiant de DAM:

1. `planner`
2. `spec-writer`
3. `implementer`
4. `reviewer`
5. `archivist`

La resta d'agents son opcionals i no els has de fer servir al principi si no fan falta.

### Pas 1: Planner

Llegeix:

- `AGENTS.md`
- `ORCHESTRATOR.md`
- `agents/planner.md`
- `workflows/run-planner.md`
- `docs/project/*`

Objectiu:

- definir be el canvi
- delimitar que entra i que queda fora
- detectar riscos

Output:

- `docs/active/current-change/01_proposal.md`

Pregunta que has de respondre:

“Que vull canviar exactament?”

### Pas 2: Spec Writer

Llegeix:

- `agents/spec-writer.md`
- `workflows/run-spec-writer.md`
- `01_proposal.md`
- `docs/project/*`

Objectiu:

- transformar la proposta en requisits clars
- definir criteris d'acceptacio

Output:

- `docs/active/current-change/02_spec_delta.md`

Pregunta que has de respondre:

“Com sabre si aquesta funcionalitat esta ben feta?”

### Pas 3: Implementer

Llegeix:

- `agents/implementer.md`
- `workflows/run-implementer.md`
- `02_spec_delta.md`
- `docs/project/02_ARCHITECTURE.md`
- `docs/project/03_CONSTRAINTS.md`

Si cal, carrega nomes la memoria relacionada a la tasca:

- `docs/memory/decisions/`
- `docs/memory/patterns/`
- `docs/memory/context/`

Objectiu:

- implementar nomes el que diu la spec
- no afegir funcionalitat extra

Output:

- `docs/active/current-change/05_implementation_report.md`

Pregunta que has de respondre:

“Que he canviat realment?”

### Pas 4: Reviewer

Llegeix:

- `agents/reviewer.md`
- `workflows/run-reviewer.md`
- `02_spec_delta.md`
- `05_implementation_report.md`
- codi modificat

Objectiu:

- validar si el canvi compleix la spec
- detectar riscos i errors

Output:

- `docs/active/current-change/06_review.md`

Pregunta que has de respondre:

“Aixo esta be o nomes funciona mes o menys?”

### Pas 5: Archivist

Llegeix:

- `agents/archivist.md`
- `workflows/run-archivist.md`
- `docs/active/current-change/*`
- `docs/memory/index.md`

Objectiu:

- tancar el canvi
- guardar nomes decisions, patrons o context reutilitzable

Pregunta que has de respondre:

“Que val la pena recordar per a futurs canvis?”

## 8. Exemple complet: app web CRUD de tasques

Suposem aquest primer objectiu:

“Vull crear la primera funcionalitat del projecte: afegir i llistar tasques.”

### Proposal

El `planner` pot tancar una proposta com aquesta:

- canvi: afegir creacio i llistat de tasques
- inclou: formulari simple, persistencia basica i llistat
- no inclou: login, filtres, categories, edicio

### Spec

El `spec-writer` pot definir:

- l'usuari pot crear una tasca amb titol
- la tasca es guarda
- es mostra en un llistat
- si el titol es buit, es mostra error

### Implementacio

L'`implementer` podria tocar:

- formulari
- logica de creacio
- component de llistat
- persistencia basica

I documentar-ho a `05_implementation_report.md`.

### Review

El `reviewer` comprova:

- es pot crear una tasca?
- es valida el titol?
- el llistat es veu be?
- hi ha algun risc clar?

### Archivist

L'`archivist` decideix si val la pena guardar:

- un patro “create task”
- una decisio sobre validacio o persistencia

No guarda:

- proves temporals
- errors puntuals de debugging

## 9. Quan has de carregar cada tipus de context

### `docs/project/`

Carrega'l quan necessitis entendre el projecte.

S'utilitza sobretot a l'inici de cada fase.

### `docs/active/current-change/`

Es el cor del treball actual.

Sempre es la primera carpeta del canvi actiu que has de mirar.

### `docs/memory/`

Només quan hi hagi alguna decisio, patro o context estable que ajudi a la tasca.

No la carreguis tota.

### `memory/`

No es memoria reusable principal.

No l'has de fer servir com a font per defecte quan estiguis implementant.

## 10. Mode base i mode ampliat

### Mode base

El recomanat per a tu si estas comencant:

- `planner`
- `spec-writer`
- `implementer`
- `reviewer`
- `archivist`

### Mode ampliat

Només quan realment faci falta:

- `task-writer`: si necessites descompondre feina
- `designer`: si hi ha una part de disseny o UI important
- `tester`: si el canvi te risc funcional
- `security-reviewer`: si toques auth, dades sensibles o inputs externs

No els converteixis en obligatoris si el canvi es petit.

## 11. Errors habituals que has d'evitar

- començar a programar sense `proposal` ni `spec`
- obrir massa fitxers alhora
- donar tot el repo a la IA
- afegir funcionalitats no demanades
- guardar memoria inutil
- saltar-se la revisio
- voler fer canvis massa grans

## 12. Forma recomanada de treballar setmana a setmana

Si vols que el projecte no es descontroli, treballa aixi:

- un canvi petit cada vegada
- un objectiu clar per canvi
- proposal curta
- spec verificable
- implementacio ajustada a scope
- review abans de donar-ho per bo
- archivist nomes per guardar aprenentatge util

Una bona setmana de treball no es la que fa mes fitxers. Es la que deixa el projecte mes clar que abans.

## 13. Manual de supervivencia rapid

Si algun dia et perds, torna a aquestes preguntes:

- quin canvi estic fent ara?
- en quina fase estic?
- quin fitxer he d'omplir ara?
- quins fitxers necessito realment?
- que no hauria de carregar?

Si pots respondre aquestes preguntes, no has perdut el control del context.

## 14. Ruta recomanada per començar avui

1. Llegeix [README.md](/Users/damiacosta/Desktop/Projectes/Templates/ai-cognitive-template/README.md)
2. Llegeix aquest manual una vegada sencera
3. Omple `docs/project/`
4. Crea un primer canvi petit
5. Fes el flux base complet
6. No activis flux ampliat fins que el base et surti natural

## 15. Idea final

Aquest sistema no existeix per impressionar. Existeix per ajudar-te a pensar i construir millor.

Si el fas servir be, cada canvi tindra:

- una intencio clara
- una spec clara
- una implementacio controlada
- una revisio real
- una memoria neta

I aixo es el que fa que un projecte pugui creixer sense perdre context.
