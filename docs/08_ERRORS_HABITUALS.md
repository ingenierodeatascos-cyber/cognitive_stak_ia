# Errors Habituals i Com Recuperar-se

## 1. He començat a implementar sense spec

### Simptoma

Hi ha codi, pero no esta clar que havia de complir.

### Causa probable

S'ha saltat la fase de definicio.

### Correccio recomanada

- tornar a `proposal`
- escriure la `spec`
- revisar si el codi actual esta dins de scope

## 2. He carregat massa context

### Simptoma

La IA respon de manera difusa o barreja parts del projecte.

### Causa probable

S'han obert massa fitxers o massa memoria alhora.

### Correccio recomanada

- tancar context
- tornar a la fase actual
- carregar nomes els fitxers necessaris

## 3. No se si aixo va a `docs/project` o a `docs/memory`

### Simptoma

Dubte sobre on guardar una nota.

### Causa probable

La nota barreja context estable del projecte amb aprenentatge reusable.

### Correccio recomanada

- si defineix el projecte actual -> `docs/project`
- si serveix per futurs canvis -> `docs/memory`
- si es temporal -> no va a cap dels dos

## 4. Tinc un canvi massa gran

### Simptoma

El canvi toca massa peces i costa revisar-lo.

### Causa probable

S'han agrupat massa objectius en un sol canvi.

### Correccio recomanada

- dividir el canvi
- activar `task-writer` si cal
- tancar primer la part mes petita i clara

## 5. Estic omplint memoria amb soroll

### Simptoma

La memoria creix pero costa trobar coses utiles.

### Causa probable

S'hi estan guardant notes temporals o historics.

### Correccio recomanada

- netejar entrades no reutilitzables
- deixar només decisions, patrons i context estable

## Idea final

El sistema no es trenca perquè hi hagi errors.

Es trenca quan no saps detectar-los ni recuperar el control.
