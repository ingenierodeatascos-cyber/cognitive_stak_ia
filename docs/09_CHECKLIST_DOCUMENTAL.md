# Checklist de Qualitat Documental

Utilitza aquesta llista per revisar si la documentacio del repo continua coherent.

## Enllacos

- tots els enllacos interns funcionen
- no hi ha rutes absolutes del disc local
- `./scripts/validate-docs.sh` passa correctament

## Flux base

- `README` explica el flux curt
- `ORCHESTRATOR` explica el flux curt
- `manual` explica el flux curt
- `cheatsheet` resumeix el flux curt

## Fitxers base

- `docs/project/*` no estan buits
- `docs/active/current-change/*` tenen estructura clara
- els documents clau tenen explicacio pedagogica

## Scripts

- els scripts documentats existeixen
- la documentacio dels scripts no promet coses que no fan

## Memoria

- la frontera entre `docs/memory/` i `memory/` esta clara
- hi ha exemples de que guardar i que no

## Workflows avançats

- s'explica quan activar-los
- no es presenten com a obligatoris si no ho son

## Regla final

Si un estudiant nou no pot entendre per on començar en 10 minuts, encara falta claredat.

## Tall segur de sessio

- existeix un punt de represa visible
- el seguent pas petit esta explicitat
- el repo passa les validacions basiques abans de tallar
