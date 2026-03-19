# ROUTING

## Objectiu

Definir com es decideix quin workflow executar i en quin ordre.

Aquest fitxer és la capa de decisió operativa entre:
- tipus de canvi
- agents necessaris
- fitxers a llegir
- fase actual

---

## Principi general

El sistema no funciona com un xat lineal.

Funciona com un pipeline:
1. identificar tipus de canvi
2. activar agents necessaris
3. limitar context
4. executar per fases
5. validar gates
6. arxivar

---

## Entrada del sistema

Qualsevol canvi ha de començar amb una d’aquestes entrades:

### 1. Nova idea
Exemple:
- vull afegir login
- vull crear dashboard
- vull suportar pagaments manuals

### 2. Bug
Exemple:
- el formulari falla
- un endpoint retorna error
- el càlcul està malament

### 3. Refactor
Exemple:
- simplificar un servei
- separar responsabilitats
- reordenar arquitectura interna

### 4. Documentació
Exemple:
- actualitzar SPEC
- revisar arquitectura
- escriure Definition of Done

### 5. Tancament
Exemple:
- arxivar canvi
- registrar decisions
- netejar current-change

---

## Rutes principals

### Ruta A — Canvi funcional nou
Executar:
1. run-planner.md
2. run-spec-writer.md
3. run-task-writer.md
4. human gate
5. run-implementer.md
6. run-reviewer.md
7. run-tester.md si aplica
8. run-security-reviewer.md si aplica
9. human gate final
10. run-archivist.md

---

### Ruta B — Bug petit i clar
Executar:
1. run-planner.md
2. run-implementer.md
3. run-reviewer.md
4. run-tester.md si aplica
5. run-archivist.md

Només es pot usar aquesta ruta si:
- el bug és clar
- el scope és petit
- no cal redefinir requisits
- no toca seguretat crítica

---

### Ruta C — Refactor controlat
Executar:
1. run-planner.md
2. run-spec-writer.md
3. run-task-writer.md
4. human gate
5. run-implementer.md
6. run-reviewer.md
7. run-tester.md
8. run-archivist.md

---

### Ruta D — Canvi de documentació
Executar:
1. run-planner.md
2. run-spec-writer.md
3. run-reviewer.md
4. run-archivist.md

Si només és una correcció menor de text:
- es pot ometre planner
- es pot anar directe a review

---

### Ruta E — Canvi sensible de seguretat
Executar:
1. run-planner.md
2. run-spec-writer.md
3. run-task-writer.md
4. human gate
5. run-implementer.md
6. run-reviewer.md
7. run-tester.md
8. run-security-reviewer.md
9. human gate final
10. run-archivist.md

---

### Ruta F — Canvi de UI / UX
Executar:
1. run-planner.md
2. run-spec-writer.md
3. run-designer.md
4. run-task-writer.md
5. human gate
6. run-implementer.md
7. run-reviewer.md
8. run-tester.md si aplica
9. run-archivist.md

---

## Decisió de ruta

### Pregunta 1
És un canvi nou, un bug, un refactor, documentació o tancament?

### Pregunta 2
Afecta:
- lògica de negoci?
- UI?
- seguretat?
- múltiples fitxers?
- experiència d’usuari?
- arquitectura?

### Pregunta 3
És prou petit per evitar SPEC i TASKS?

Només si és:
- trivial
- clar
- localitzat
- de baix risc

---

## Regles de routing

### No saltar a implementació si:
- el canvi és ambigu
- el comportament desitjat no està clar
- el scope no està delimitat
- hi ha risc arquitectònic
- toca auth o dades sensibles

### Activar designer si:
- hi ha pantalles noves
- canvia l’experiència d’usuari
- es modifiquen components rellevants
- cal definir estructura visual o flux

### Activar tester si:
- hi ha regressions possibles
- el canvi té lògica important
- el canvi té edge cases
- el canvi toca dades o transformacions

### Activar security-reviewer si:
- hi ha auth
- hi ha permisos
- hi ha inputs externs
- hi ha dades sensibles
- hi ha secrets
- hi ha endpoints públics

---

## Context mínim per ruta

### Planner
- docs/project/00_PROJECT_STATE.md
- docs/project/01_SPEC.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md
- docs/active/06_CURRENT_SPRINT.md

### Spec Writer
- docs/active/current-change/01_proposal.md
- docs/project/01_SPEC.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md

### Task Writer
- docs/active/current-change/02_spec_delta.md
- docs/project/02_ARCHITECTURE.md

### Designer
- docs/active/current-change/02_spec_delta.md
- docs/project/01_SPEC.md
- docs/project/03_CONSTRAINTS.md
- skills/frontend/SKILL.md si existeix

### Implementer
- docs/active/current-change/04_tasks.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md
- skills rellevants

### Reviewer
- docs/active/current-change/04_tasks.md
- docs/active/current-change/05_implementation_report.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md
- codi modificat

### Tester
- docs/active/current-change/04_tasks.md
- docs/active/current-change/05_implementation_report.md
- docs/active/current-change/06_review.md
- skills/testing/SKILL.md

### Security Reviewer
- docs/active/current-change/04_tasks.md
- docs/active/current-change/05_implementation_report.md
- docs/project/03_CONSTRAINTS.md
- skills/security/SKILL.md

### Archivist
- docs/active/current-change/*
- memory/durable/*
- decisions/*

---

## Anti-patterns

No fer:
- run-implementer sense tasks si el canvi és mitjà o gran
- run-reviewer sense implementation report
- run-archivist sense decisió final
- carregar docs/archive com a context per defecte
- activar tots els agents “per si de cas”

---

## Filosofia

Routing correcte = menys soroll, menys errors, més precisió.