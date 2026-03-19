# MEMORY INDEX

## Decisions
`docs/memory/decisions/`

Usa esta carpeta para decisiones tecnicas o arquitectonicas reutilizables.

Exemple bo:

- estrategia d'autenticacio
- proteccio de rutes
- lloc on es fa la validacio important

## Patterns
`docs/memory/patterns/`

Usa esta carpeta para soluciones repetibles ya validadas.

Exemple bo:

- patro de creacio de tasques
- patro de formularis
- patro de control d'errors

## Context
`docs/memory/context/`

Usa esta carpeta para contexto estable de dominio, integraciones o restricciones permanentes.

Exemple bo:

- rols d'usuari
- regles del domini
- restriccions d'una API externa

## Rules

- Load only what is needed
- Do not load full memory
- Prefer reuse over reinvention
- `docs/memory/` es la fuente de verdad de memoria reusable
- `memory/` es memoria interna del sistema y no debe cargarse por defecto
- si algo no es reutilizable o estable, no debe vivir aqui
- debugging puntual, brainstormings o notes temporals no s'han de guardar aqui
