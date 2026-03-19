# Guia del Canvi Actiu

Aquest document explica com s'ha d'entendre `docs/active/current-change/`.

La idea clau es simple: aqui nomes viu el que estàs fent ara. No es memoria permanent ni descripcio general del projecte.

## Que es un canvi actiu

Un canvi actiu es una unitat de treball concreta.

Exemples:

- afegir login basic
- crear el primer CRUD de tasques
- corregir validacio d'un formulari

No s'hi haurien de barrejar diverses funcionalitats grans alhora.

## Fitxers del canvi actiu

### `00_meta.md`

Serveix per guardar metadades del canvi:

- nom
- estat
- dates

### `01_proposal.md`

L'omple el `planner`.

Respon:

- que es vol canviar
- quin problema es resol
- que entra i que queda fora

### `02_spec_delta.md`

L'omple el `spec-writer`.

Respon:

- quins requisits ha de complir el canvi
- com sabrem si esta ben fet

### `03_design.md`

L'omple el `designer` si cal.

Es opcional.

Només s'utilitza quan hi ha una part visual o de flux d'usuari que val la pena definir abans d'implementar.

### `04_tasks.md`

L'omple el `task-writer` si cal.

Es opcional.

Només s'utilitza quan el canvi es massa gran o ambigu i cal descompondre'l en tasques petites.

### `05_implementation_report.md`

L'omple l'`implementer`.

Explica:

- que s'ha fet
- quins fitxers s'han tocat
- quins riscos o tests pendents queden

### `06_review.md`

L'omple el `reviewer`.

Decideix si el canvi passa o falla i deixa visibles els problemes.

### `07_test_report.md`

L'omple el `tester` si cal.

Es opcional.

S'utilitza quan hi ha prou risc funcional com per documentar explicitament els tests.

### `08_security_review.md`

L'omple el `security-reviewer` si cal.

Es opcional.

S'utilitza quan el canvi toca auth, permisos, dades sensibles o inputs externs.

### `09_human_approval.md`

L'omple una persona quan cal un gate explicit.

No sempre cal, pero es recomanable quan hi ha risc, dubtes importants o decisions sensibles.

## Flux base recomanat

Per defecte:

1. `01_proposal.md`
2. `02_spec_delta.md`
3. `05_implementation_report.md`
4. `06_review.md`
5. `09_human_approval.md` si cal
6. arxiu i memoria

## Flux ampliat opcional

Activa peces extra nomes si fan falta:

- `03_design.md`
- `04_tasks.md`
- `07_test_report.md`
- `08_security_review.md`

## Regles practiques

- no converteixis el canvi actiu en un historial enorme
- no hi posis memoria reusable
- no hi barregis altres canvis
- si el canvi es tanca, s'arxiva

## Idea final

`docs/active/current-change/` ha de respondre una sola pregunta:

“Que estem fent ara mateix?”
