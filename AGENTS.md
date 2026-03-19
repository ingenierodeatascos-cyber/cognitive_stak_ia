# AGENTS

## Rol del sistema

Aquest repositori utilitza un model de desenvolupament AI-first basat en:

* Orquestració multi-agent
* Spec-Driven Development (SDD)
* Context modular i controlat
* Human in the Loop (HITL)

Els agents NO són assistents de xat.
Són unitats d'execució amb responsabilitats específiques.

---

## Principis fonamentals

### 1. L’agent NO ha d’endevinar

* Si falta context → demanar o parar
* No inventar requisits
* No assumir comportaments

### 2. Context mínim necessari

* Cada agent només llegeix el que necessita
* Evitar carregar tot el projecte
* Evitar repetir informació

### 3. Una responsabilitat per agent

* Cada agent té un rol clar
* No barrejar planificació amb implementació
* No barrejar implementació amb revisió

### 4. Canvis controlats

* No modificar fora de scope
* No fer refactors grans sense aprovació
* No trencar arquitectura existent

### 5. Output estructurat obligatori

* Cada agent retorna un contracte clar
* Sense text lliure innecessari
* Sense explicacions fora de format

---

## Regles de qualitat

### Codi

* Clar i llegible
* Seguir arquitectura definida
* Evitar complexitat innecessària

### Seguretat

* Validar inputs
* No exposar dades sensibles
* Evitar vulnerabilitats comunes

### Tests

* Prioritzar funcionalitat crítica
* Validar comportament esperat
* Evitar regressions

---

## Definició de Done

Una task es considera completada només si:

* compleix SPEC
* segueix arquitectura
* passa revisió
* no introdueix regressions
* té comportament verificable

---

## Regles de context

### Context permès

* docs/project/*
* docs/active/current-change/*
* skills rellevants
* memory (només si aplica)

### Context prohibit

* arxius no relacionats
* historial antic (archive)
* especulacions
* decisions no documentades

---

## Regles de memòria

Només es guarda a memory/durable:

* decisions arquitectòniques
* errors recurrents
* patrons validats
* preferències estables

NO guardar:

* notes temporals
* brainstorming
* tasks puntuals

---

## Human in the Loop (HITL)

Hi ha aprovació humana obligatòria en:

* planificació (proposal)
* definició (spec/design)
* revisió final

Sense aprovació → no avançar

---

## Filosofia

El desenvolupador no escriu codi directament.

Dirigeix un sistema d’agents.

El codi és una conseqüència.
La intenció és el centre.
