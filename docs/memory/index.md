# MEMORY INDEX

## Decisions
`docs/memory/decisions/`

Usa esta carpeta para decisiones tecnicas o arquitectonicas reutilizables.

## Patterns
`docs/memory/patterns/`

Usa esta carpeta para soluciones repetibles ya validadas.

## Context
`docs/memory/context/`

Usa esta carpeta para contexto estable de dominio, integraciones o restricciones permanentes.

## Rules

- Load only what is needed
- Do not load full memory
- Prefer reuse over reinvention
- `docs/memory/` es la fuente de verdad de memoria reusable
- `memory/` es memoria interna del sistema y no debe cargarse por defecto
- si algo no es reutilizable o estable, no debe vivir aqui
