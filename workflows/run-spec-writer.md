# RUN SPEC WRITER

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/spec-writer.md
- docs/active/current-change/01_proposal.md
- docs/project/01_SPEC.md
- docs/project/02_ARCHITECTURE.md
- docs/project/03_CONSTRAINTS.md

## Missió

Converteix la proposta actual en una especificació clara, verificable i sense ambigüitats.

No implementis res.  
No parlis de codi.  
No defineixis detalls tècnics interns si no són estrictament necessaris per entendre el requisit.

## Objectiu del resultat

Generar el contingut de:

- docs/active/current-change/02_spec_delta.md

## Regles obligatòries

- Escriu requisits testejables
- Defineix criteris d'acceptació verificables
- Inclou edge cases quan apliqui
- Explicita l'out of scope
- No barregis requisits amb implementació

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/spec-writer.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.