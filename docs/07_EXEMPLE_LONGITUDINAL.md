# Exemple Longitudinal Complet

Aquest exemple mostra un recorregut complet amb una app web CRUD de tasques.

## 1. Projecte nou

Projecte: app per crear, llistar, editar i eliminar tasques.

Context base:

- `docs/project/00_PROJECT_STATE.md`
- `docs/project/01_SPEC.md`
- `docs/project/02_ARCHITECTURE.md`
- `docs/project/03_CONSTRAINTS.md`

## 2. Primer canvi

Canvi:

`create-and-list-tasks`

Comanda:

```bash
./scripts/start-change.sh create-and-list-tasks
```

## 3. Proposal

Objectiu:

- afegir creacio i llistat de tasques

Inclou:

- formulari simple
- persistencia basica
- llistat visible

No inclou:

- login
- edicio
- categories

## 4. Spec

Requisits:

- l'usuari pot crear una tasca amb titol
- la tasca queda guardada
- el llistat mostra les tasques creades
- si el titol es buit, es mostra error

## 5. Implementacio

Canvis tipics:

- component de formulari
- logica de creacio
- llistat de tasques
- persistencia simple

## 6. Review

Preguntes de revisio:

- es pot crear una tasca?
- el titol buit dona error?
- el llistat es veu correctament?

## 7. Memoria

Exemples de coses que si podrien entrar a memoria:

- patro “create task”
- decisio sobre on validar les dades

Exemples de coses que no:

- intents fallits de debug
- canvis temporals

## 8. Arxiu

Quan el canvi esta tancat:

```bash
./scripts/archive-change.sh create-and-list-tasks
```

## 9. Que aprens d'aquest exemple

- el projecte es construeix per canvis petits
- cada canvi te proposal, spec, implementacio, review i tancament
- la memoria nomes guarda el que es reutilitzable
