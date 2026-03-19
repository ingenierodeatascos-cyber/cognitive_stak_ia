# CONTEXT RULES

Aquest document explica com carregar context sense saturar la IA ni l'estudiant.

## Regles principals

### 1. Un sol canvi actiu

No treballis en diversos canvis alhora dins del mateix context.

### 2. Carregar nomes el necessari

Cada fase ha de veure nomes els fitxers que necessita.

### 3. No carregar tot el repositori

Obrir tot el repo per defecte gairebe sempre empitjora la qualitat del resultat.

### 4. No carregar tota la memoria

`docs/memory/` s'ha de consultar sota demanda.

### 5. Referenciar en lloc de repetir

Si una decisio o patro ja existeix, es referencia. No es torna a copiar.

## Context minim per fase

### Planner

- `docs/project/*`
- estat actual si aplica

### Spec Writer

- `01_proposal.md`
- `docs/project/*`

### Implementer

- `02_spec_delta.md`
- `docs/project/02_ARCHITECTURE.md`
- `docs/project/03_CONSTRAINTS.md`
- memoria rellevant si aplica

### Reviewer

- `02_spec_delta.md`
- `05_implementation_report.md`
- codi modificat

### Archivist

- `docs/active/current-change/*`
- `docs/memory/index.md`

## Regla final

Si dubtes entre carregar molt context o poc, carrega poc i afegeix nomes el que faltava.
