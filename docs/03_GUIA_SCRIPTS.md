# Guia dels Scripts

Aquest document explica quins scripts existeixen, quan s'han d'utilitzar i que pots esperar de cadascun.

## Objectiu dels scripts

Els scripts no substitueixen els agents ni els workflows.

Serveixen per:

- preparar estructura
- veure estat
- arxivar canvis
- evitar passos manuals repetitius

## `start-change.sh`

### Que fa

Crea un nou canvi actiu a `docs/active/current-change/`.

### Quan usar-lo

Quan comences una funcionalitat o millora nova.

### Que no fa

- no escriu la spec
- no implementa res
- no tanca decisions per tu

### Exemple

```bash
./scripts/start-change.sh feature-login
```

### Resultat esperat

- carpeta `docs/active/current-change/` preparada
- metadades inicials
- fitxers del canvi amb capçaleres base

## `status.sh`

### Que fa

Mostra l'estat del canvi actiu.

### Quan usar-lo

- abans de continuar un canvi
- quan no recordes en quina fase estas
- quan vols saber el seguent pas recomanat

### Que no fa

- no valida qualitat del codi
- no executa workflows

### Exemple

```bash
./scripts/status.sh
```

### Resultat esperat

- fitxers plens o buits
- fase estimada
- seguent pas recomanat

## `archive-change.sh`

### Que fa

Mou el canvi actiu a `docs/archive/<any>/<nom-canvi>/` i neteja el context actiu.

### Quan usar-lo

Quan el canvi esta tancat i llest per passar a historic.

### Que no fa

- no decideix si el canvi esta realment bé
- no genera memoria per si sol

### Exemple

```bash
./scripts/archive-change.sh feature-login
```

### Resultat esperat

- canvi arxivat
- `docs/active/current-change/` net

## `bootstrap.sh`

### Estat actual

Script placeholder documentat.

### Intencio prevista

Ha de servir per preparar la base inicial del projecte o validar que l'estructura minima existeix.

### Recomanacio

No el facis servir com a peça central fins que tingui comportament documentat.

## `sync-memory.sh`

### Estat actual

Script placeholder documentat.

### Intencio prevista

Ha de servir per ajudar a sincronitzar o indexar memoria si el sistema evoluciona.

### Recomanacio

No l'utilitzis com a part del flux base.

## `validate-docs.sh`

### Que fa

Comprova una qualitat documental minima del repositori.

### Quan usar-lo

- abans de fer commit
- quan afegeixes o mous documentacio
- quan vols revisar que els links interns continuen vius

### Que valida

- fitxers clau presents i no buits
- absencia de rutes absolutes locals en Markdown
- enllacos interns de Markdown
- sintaxi basica dels scripts `sh`

### Exemple

```bash
./scripts/validate-docs.sh
```

### Resultat esperat

- missatge final `Documentation validation OK`

## `validate-flow.sh`

### Que fa

Valida el flux operatiu basic en un entorn temporal.

### Quan usar-lo

- quan canvies scripts del flux
- quan canvies la logica de `status.sh`
- abans de confiar que el recorregut base continua funcionant

### Que valida

- `start-change.sh` crea l'estructura esperada
- `status.sh` recomana el seguent pas correcte
- `archive-change.sh` arxiva i neteja correctament

### Exemple

```bash
./scripts/validate-flow.sh
```

### Resultat esperat

- missatge final `Operational flow validation OK`

## `validate-maintainability.sh`

### Que fa

Comprova mantenibilitat basica del sistema.

### Quan usar-lo

- quan afegeixes workflows o scripts nous
- quan vols evitar placeholders buits
- quan vols revisar que el flux curt continua ben explicat

### Que valida

- no hi ha fitxers buits a `scripts/`, `workflows/` o `.github/workflows/`
- els placeholders coneguts no estan buits
- el flux curt continua reflectit als docs principals
- la capa avancada continua marcada com a opcional

### Exemple

```bash
./scripts/validate-maintainability.sh
```

### Resultat esperat

- missatge final `Maintainability validation OK`

## Ordre de treball recomanat

1. `./scripts/status.sh`
2. `./scripts/start-change.sh <nom>`
3. treballar el canvi
4. `./scripts/status.sh`
5. `./scripts/validate-docs.sh`
6. `./scripts/validate-flow.sh`
7. `./scripts/validate-maintainability.sh`
8. `./scripts/archive-change.sh <nom>`

## Idea final

Si dubtes:

- els scripts preparen i orienten
- els agents pensen i executen fases
- els workflows expliquen com s'ha d'actuar
