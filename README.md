# AI Cognitive Stack Template

Plantilla para desarrollar software con IA de forma estructurada, con contexto controlado y validacion humana.

Esta base esta pensada para dos usos:

- aprender a trabajar con IA sin saturarte de contexto
- reutilizar un flujo limpio en proyectos reales pequenos o medianos

## Para quien es

Esta plantilla esta optimizada para un estudiante de DAM que quiere aprender a trabajar con IA con control.

Tambien puede servir a desarrolladores que quieran una base reusable, pero el modo por defecto prioriza:

- pocos pasos
- pocos archivos abiertos a la vez
- roles claros
- minima carga contextual

## La idea central

El problema principal no es solo el modelo. Es como se organiza el contexto.

Esta plantilla intenta resolver eso con cuatro reglas:

1. Un solo cambio activo.
2. Un workflow corto y repetible.
3. Roles separados para no mezclar pensar, implementar y revisar.
4. Memoria reutilizable cargada solo bajo demanda.

## Flujo base

El camino recomendado para empezar es este:

1. `planner`
2. `spec-writer`
3. `implementer`
4. `reviewer`
5. `archivist`

Agentes como `task-writer`, `designer`, `tester` o `security-reviewer` existen como apoyo, pero no forman parte del camino minimo obligatorio.

## Estructura minima que debes entender el primer dia

```text
agents/                      roles de los agentes
workflows/                   instrucciones para ejecutar cada fase
templates/                   formato esperado de cada output
scripts/                     interfaz operativa desde terminal
docs/project/                contexto estable del proyecto
docs/active/current-change/  cambio actual
docs/memory/                 conocimiento reusable para cargar bajo demanda
memory/                      memoria interna del sistema
```

## Quickstart real

### 1. Inicializa o revisa el estado

```bash
./scripts/status.sh
```

### 2. Crea un cambio nuevo

```bash
./scripts/start-change.sh feature-login
```

### 3. Sigue el flujo base

Abre solo lo necesario:

- `AGENTS.md`
- `ORCHESTRATOR.md`
- `docs/project/*`
- `docs/active/current-change/*`
- el workflow del agente actual

Orden recomendado:

- `workflows/run-planner.md` -> `docs/active/current-change/01_proposal.md`
- `workflows/run-spec-writer.md` -> `docs/active/current-change/02_spec_delta.md`
- `workflows/run-implementer.md` -> `docs/active/current-change/05_implementation_report.md`
- `workflows/run-reviewer.md` -> `docs/active/current-change/06_review.md`
- `workflows/run-archivist.md` -> memoria y archivo

### 4. Usa memoria solo si aplica

Memoria reusable:

- `docs/memory/decisions/`
- `docs/memory/patterns/`
- `docs/memory/context/`

Memoria interna del sistema:

- `memory/ephemeral/`
- `memory/durable/`
- `memory/engram/`

Regla clave:

- no cargues toda la memoria
- carga solo la pieza que ayude a la tarea actual

### 5. Arxiva cuando el cambio este cerrado

```bash
./scripts/archive-change.sh feature-login
```

## Que carpeta responde a que pregunta

- `agents/`: como se comporta cada rol
- `workflows/`: en que orden se ejecuta el trabajo
- `templates/`: que forma debe tener cada documento
- `docs/project/`: que contexto estable define el proyecto
- `docs/active/current-change/`: que estamos haciendo ahora
- `docs/memory/`: que conocimiento reusable conviene cargar
- `memory/`: que memoria interna usa el sistema
- `scripts/`: como operamos todo esto sin depender de instrucciones largas

## Reglas para no saturar contexto

- No trabajes en varios cambios a la vez.
- No cargues todo el repo por defecto.
- No cargues toda la memoria por defecto.
- Si algo ya esta documentado, referencialo en vez de repetirlo.
- Guarda solo conocimiento reutilizable.

## Que no hacer

- implementar sin proposal o spec
- mezclar varias tareas no relacionadas
- inventar requisitos
- usar memoria como vertedero de notas
- saltarte la revision humana cuando el cambio no esta claro

## Evolucion del sistema

El template ya incluye piezas mas avanzadas, pero la recomendacion es activarlas por fases:

- primero flujo base y contratos
- despues memoria reusable mas fuerte
- luego testing y CI/CD
- finalmente archivado inteligente y automatizacion

## Resumen

No se trata de pedirle mas cosas a la IA.

Se trata de darle menos ruido, mejores limites y un proceso que puedas entender y repetir.
