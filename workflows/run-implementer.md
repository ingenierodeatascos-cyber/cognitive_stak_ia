# RUN IMPLEMENTER

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/implementer.md
- docs/active/current-change/04_tasks.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md
- skills/registry.md

I activa només les skills rellevants segons el tipus de canvi.

If relevant, use memory from:

- docs/memory/decisions/
- docs/memory/patterns/
- docs/memory/context/

Do not load all memory.
Load only what is needed for the current task.
Prefer existing decisions and validated patterns.

## Missió

Implementa exclusivament les tasks actuals definides.

No redefineixis l'abast.  
No afegeixis funcionalitat extra.  
No facis refactors grans no demanats.  
No modifiquis fora de scope.

## Objectiu del resultat

Generar el contingut de:

- docs/active/current-change/05_implementation_report.md

I executar els canvis de codi necessaris.

## Regles obligatòries

- Toca només el necessari
- Respecta l'arquitectura existent
- Respecta constraints i convencions del projecte
- Documenta només les decisions tècniques necessàries
- Indica riscos i tests pendents amb honestedat

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/implementer.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.

Use memory from docs/memory/ if relevant.
Do not load all memory.
Prefer existing decisions and patterns.
