# RUN TASK WRITER

## Quan s'ha d'utilitzar

Utilitza aquest workflow nomes si la spec es massa gran, massa abstracta o necessita ser dividida en passos petits.

Si el canvi es petit i clar, no l'activis.

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/task-writer.md
- docs/active/current-change/02_spec_delta.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md

## Missió

Descompon la SPEC actual en tasques concretes, petites i executables.

No implementis res.  
No redefineixis requisits.  
No facis tasks vagues ni massa grans.

## Objectiu del resultat

Generar el contingut de:

- docs/active/current-change/04_tasks.md

## Regles obligatòries

- Cada task ha de tenir una sola responsabilitat principal
- Cada task ha de ser prou clara per ser implementada sense ambigüitat
- Cada task ha de ser revisable i testejable
- No agrupis massa objectius dins una sola task
- Indica fitxers afectats quan sigui possible

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/task-writer.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.
