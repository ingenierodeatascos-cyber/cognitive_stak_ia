# RUN SECURITY REVIEWER

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/activation-matrix.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/security-reviewer.md
- docs/active/current-change/04_tasks.md
- docs/active/current-change/05_implementation_report.md
- docs/project/03_CONSTRAINTS.md
- skills/registry.md
- skills/security/SKILL.md

Revisa també el codi modificat.

## Missió

Fer revisió de seguretat del canvi actual.

No implementis funcionalitat nova.  
No redefineixis l'abast.  
No et limitis a comentaris genèrics: revisa riscos reals.

## Objectiu del resultat

Generar el contingut de:

- docs/active/current-change/08_security_review.md

## Regles obligatòries

- Revisa validació d'inputs
- Revisa permisos i control d'accés si aplica
- Revisa tractament de dades sensibles si aplica
- Revisa superfície d'atac rellevant
- Identifica riscos crítics, mitjans o menors

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/security-reviewer.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.