# Guia Didactica de Memoria

La memoria no es un lloc on guardar-ho tot.

Només ha de contenir el que pot ser util en futurs canvis.

## Capes del sistema

### `docs/memory/`

Memoria reusable principal.

### `memory/`

Memoria interna del sistema. No s'ha de carregar per defecte.

### `docs/project/`

Context estable del projecte, no memoria d'aprenentatge.

### `docs/archive/`

Historic de canvis tancats.

## Que va a `docs/memory/decisions/`

Decisions que segueixen vigents i condicionen futurs canvis.

### Bon exemple

- “La proteccio de rutes es fa amb middleware centralitzat”

### Mal exemple

- “Durant aquest canvi vam dubtar entre dues opcions”

## Que va a `docs/memory/patterns/`

Patrons que ja s'han validat i que es poden repetir.

### Bon exemple

- “Per crear una tasca: validar input, validar usuari, guardar, retornar resposta”

### Mal exemple

- “En aquest fitxer concret vam fer un pegat temporal”

## Que va a `docs/memory/context/`

Context estable que ajuda a entendre el domini o una integracio.

### Bon exemple

- “Els usuaris normals només poden veure les seves tasques”

### Mal exemple

- “Aquesta setmana estem prioritzant acabar el login”

## Que no s'hi ha de guardar

- notes temporals
- brainstorming
- debugging puntual
- tasques concretes d'un canvi
- historics complets

## Exemples concrets

### Una decisio bona

“En aquest projecte, les validacions importants sempre es fan al backend.”

### Un patro bo

“Per formularis CRUD: validar camps, mostrar errors clars, reenviar dades valides.”

### Una entrada de context bona

“Una tasca sempre pertany a un usuari concret.”

### Exemple de soroll

“Ahir la IA va proposar una altra estructura pero no ens va agradar.”

## Paper de l'Archivist

L'`archivist` ha de filtrar:

- que val la pena recordar
- que no s'ha de guardar

No ha de convertir cada canvi en un resum llarg dins de la memoria.

## Regla final

Si una nota no t'ajudara en futurs canvis, probablement no ha d'anar a `docs/memory/`.
