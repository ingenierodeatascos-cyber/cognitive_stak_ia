# Guia de Workflows Avancats

El flux base es suficient per a molts canvis.

Aquesta guia explica quan activar peces extra i quan no cal fer-ho.

## `task-writer`

### Activa'l si

- el canvi es massa gran
- la spec encara es massa abstracta
- necessites dividir la feina en passos petits

### No l'activis si

- el canvi es simple
- ja saps exactament que s'ha de fer

## `designer`

### Activa'l si

- hi ha UI o UX important
- necessites definir pantalles o fluxos d'usuari

### No l'activis si

- el canvi es purament tecnic
- el disseny ja esta clar

## `tester`

### Activa'l si

- el canvi te risc funcional
- hi ha edge cases rellevants
- vols deixar evidencia explicita del que s'ha provat

### No l'activis si

- el canvi es trivial i el risc es molt baix
- ja tens prou evidencia a la revisio

## `security-reviewer`

### Activa'l si

- toques auth
- toques permisos
- toques dades sensibles
- toques inputs externs o integracions

### No l'activis si

- el canvi no afecta la seguretat de forma rellevant

## Regla general

Els workflows avançats existeixen per reduir risc, no per omplir fitxers.

Si no aporten claredat o seguretat real, no els activis.
