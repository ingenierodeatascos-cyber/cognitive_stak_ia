# ACTIVATION MATRIX

## Objectiu

Definir quin agent s’ha d’activar segons el tipus de canvi.

Aquesta matriu evita:
- carregar agents innecessaris
- embrutar context
- barrejar responsabilitats
- activar workflows massa grans per canvis petits

---

## Principi general

No tots els agents participen en tots els canvis.

Només s’activen:
- els agents necessaris
- en l’ordre correcte
- amb el context mínim necessari

---

## Agents disponibles

### Core
- planner
- spec-writer
- task-writer
- implementer
- reviewer
- archivist

### Optional
- designer
- tester
- security-reviewer

---

## Matriu d’activació

| Tipus de canvi | Planner | Spec Writer | Task Writer | Designer | Implementer | Reviewer | Tester | Security Reviewer | Archivist |
|---|---|---|---|---|---|---|---|---|---|
| Documentació simple | Sí | Sí | No | No | No | Sí | No | No | Sí |
| Bug petit | Sí | No | No | No | Sí | Sí | Opcional | No | Sí |
| Feature petita backend | Sí | Sí | Sí | No | Sí | Sí | Opcional | Opcional | Sí |
| Feature petita frontend | Sí | Sí | Sí | Sí | Sí | Sí | Opcional | No | Sí |
| Feature mitjana | Sí | Sí | Sí | Segons cas | Sí | Sí | Sí | Segons cas | Sí |
| Refactor controlat | Sí | Sí | Sí | No | Sí | Sí | Sí | Opcional | Sí |
| Auth / permisos / dades sensibles | Sí | Sí | Sí | No | Sí | Sí | Sí | Sí | Sí |
| UI / UX important | Sí | Sí | Sí | Sí | Sí | Sí | Opcional | No | Sí |
| Canvi només CI/CD | Sí | Sí | Sí | No | Sí | Sí | Sí | Opcional | Sí |
| Release / tancament | No | No | No | No | No | No | No | No | Sí |

---

## Regles d’activació

### Planner
Activar sempre que hi hagi un canvi funcional, tècnic o documental amb impacte real.

### Spec Writer
Activar quan calgui definir o aclarir requisits.

No activar si:
- el canvi és trivial
- només es corregeix un error obvi sense impacte de comportament

### Task Writer
Activar quan:
- el canvi té múltiples passos
- hi ha més d’un fitxer afectat
- hi ha risc d’implantar malament per ambigüitat

### Designer
Activar quan:
- canvia UX
- canvia estructura visual
- apareixen components nous
- hi ha fluxos d’usuari nous

No activar per:
- canvis purament tècnics
- backend
- refactors interns

### Implementer
Activar quan hi ha codi o configuració a modificar.

### Reviewer
Activar sempre que hi hagi implementació o modificació de documents crítics.

### Tester
Activar quan:
- el canvi afecta lògica de negoci
- hi ha regressions possibles
- hi ha casos límit importants
- hi ha automatismes o integracions

### Security Reviewer
Activar quan el canvi toca:
- autenticació
- autorització
- dades sensibles
- inputs externs
- fitxers pujats
- secrets
- endpoints públics
- pagaments
- CI/CD o infraestructura

### Archivist
Activar sempre al tancament del canvi.

---

## Regla de simplificació

Si hi ha dubte entre activar o no un agent:

- activar si redueix risc
- no activar si només afegeix soroll

---

## Regla de seguretat

Qualsevol canvi sobre auth, permisos o dades sensibles obliga a activar:
- spec-writer
- task-writer
- reviewer
- tester
- security-reviewer

---

## Regla de frontend

Qualsevol canvi visible per usuari final que alteri experiència, navegació o components nous ha de considerar designer.

---

## Regla de documentació

Si el canvi només actualitza documentació no crítica:
- planner
- spec-writer
- reviewer
- archivist

Si afecta contractes, arquitectura o normes:
- planner
- spec-writer
- reviewer
- archivist

---

## Filosofia

Activar menys agents no és sempre millor.

Activar els agents correctes sí.