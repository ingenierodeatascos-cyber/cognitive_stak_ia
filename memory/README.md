# MEMORY SYSTEM

`memory/` es memoria interna del sistema. No es la memoria reusable principal para la IA.

## Capas

- `memory/ephemeral/`: notas temporales de ejecucion
- `memory/durable/`: metaconocimiento interno pequeno y estable
- `memory/engram/`: configuracion o futura memoria automatizada

## Regla principal

Si el conocimiento debe ser reutilizable por agentes en cambios futuros, debe vivir en `docs/memory/`, no aqui.
