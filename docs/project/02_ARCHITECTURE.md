# ARCHITECTURE

Aquest document explica com esta organitzat el projecte.

No cal fer una arquitectura enterprise. Cal deixar clar com es reparteixen les responsabilitats principals.

## Com omplir aquest document

Explica:

- quines capes hi ha
- on viu la logica principal
- com es guarda la informació
- quines tecnologies base fas servir

## Plantilla recomanada

### Architectural style

Exemple:

- app web monolitica
- frontend + backend separats
- API REST + client web

### Main parts

- frontend
- backend
- persistencia
- autenticacio si aplica

### Data flow

Explica en poques linies com es mou la informació.

### Technology choices

- framework
- llenguatge
- base de dades
- llibreries importants

### Key rules

- on va la logica de negoci
- on va la validacio
- que no s'hauria de barrejar

## Exemple per a un estudiant de DAM

### Architectural style

app web simple amb frontend i backend dins del mateix projecte

### Main parts

- frontend per mostrar formularis i llistats
- backend per gestionar logica CRUD
- persistencia amb base de dades simple o sqlite

### Data flow

L'usuari interactua amb formularis o pantalles. El frontend envia dades al backend. El backend valida, guarda o consulta dades i retorna la resposta.

### Technology choices

- frontend: framework web del projecte
- backend: API o rutes del mateix projecte
- persistencia: sqlite o sistema equivalent simple

### Key rules

- la logica de negoci no ha d'estar barrejada amb la UI
- la validacio important s'ha de fer al backend
- els canvis han de respectar una estructura simple i mantenible
