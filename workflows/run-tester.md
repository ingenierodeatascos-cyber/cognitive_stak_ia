# RUN TESTER

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/activation-matrix.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/tester.md
- docs/active/current-change/04_tasks.md
- docs/active/current-change/05_implementation_report.md
- docs/active/current-change/06_review.md
- docs/project/03_CONSTRAINTS.md
- skills/registry.md
- skills/testing/SKILL.md

Revisa també el codi modificat i els tests existents, si n'hi ha.

## Missió

Validar el comportament del canvi actual.

No implementis funcionalitat nova.  
No reescriguis l'abast del canvi.  
Només testa i documenta el resultat.

## Objectiu del resultat

Generar el contingut de:

- docs/active/current-change/07_test_report.md

## Regles obligatòries

- Verifica casos principals
- Verifica edge cases rellevants
- Indica clarament què s'ha testejat
- Indica clarament què NO s'ha testejat
- Marca errors, regressions o dubtes amb honestedat

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/tester.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.