# 🧠 Template de Desenvolupament Cognitiu amb IA

Un repositori base estructurat i reutilitzable per construir software utilitzant agents d’IA, workflows controlats i gestió de context net.

---

## 🚀 Propòsit

Aquest template proporciona un **sistema de desenvolupament cognitiu** per treballar amb IA de manera:

* estructurada
* escalable
* controlada
* professional

Està dissenyat per:

* evitar la saturació de context
* separar pensament i implementació
* fer el comportament de la IA previsible
* integrar validació humana (human-in-the-loop)
* construir projectes reals amb qualitat

---

## 🧩 Conceptes clau

### 1. Workflow cognitiu

El desenvolupament es divideix en fases:

```text
Proposal → Spec → Tasks → Implementation → Review → Archive
```

Cada fase és executada per un agent especialitzat.

---

### 2. Context net

Només hi ha un canvi actiu:

```text
docs/active/current-change/
```

Tot el que està acabat s’arxiva:

```text
docs/archive/
```

Això evita soroll i millora el rendiment de la IA.

---

### 3. Agents

Defineixen el comportament de la IA:

```text
agents/
```

Exemples:

* planner
* spec-writer
* implementer
* reviewer

---

### 4. Workflows

Prompts reutilitzables per executar cada fase:

```text
workflows/run-*.md
```

S’utilitzen dins Codex (o eines similars).

---

### 5. Skills

Coneixement modular que es carrega només quan cal:

```text
skills/
```

Exemples:

* backend
* frontend
* testing
* security

---

### 6. Scripts

Ajuda des de terminal per gestionar el sistema:

```text
scripts/
```

* `start-change.sh` → crear un nou canvi
* `archive-change.sh` → arxivar un canvi
* `status.sh` → veure estat actual

---

### 7. Templates

Estructures base dels documents:

```text
templates/
```

Asseguren consistència i qualitat.

---

## 📦 Estructura del projecte

```text
.
├── AGENTS.md
├── ORCHESTRATOR.md
├── agents/
├── workflows/
├── skills/
├── scripts/
├── templates/
├── docs/
│   ├── active/current-change/
│   └── archive/
```

---

## ⚙️ Com utilitzar-lo

### 1. Crear un nou canvi

```bash
./scripts/start-change.sh <nom-del-canvi>
```

---

### 2. Executar el workflow (a Codex)

Exemple:

```text
Segueix workflows/run-planner.md i escriu el resultat a docs/active/current-change/01_proposal.md
```

Després:

```text
run-spec-writer → 02_spec_delta.md  
run-task-writer → 04_tasks.md
```

---

### 3. Validació humana (IMPORTANT)

Abans d’implementar, revisa:

* proposal
* spec
* tasks

---

### 4. Implementació

```text
Segueix workflows/run-implementer.md
```

---

### 5. Revisió

```text
Segueix workflows/run-reviewer.md
```

Opcional:

* tester
* security-reviewer

---

### 6. Arxivar el canvi

```bash
./scripts/archive-change.sh <nom-del-canvi>
```

---

## 🔍 Consultar estat

```bash
./scripts/status.sh
```

Mostra:

* fase actual
* fitxers existents
* següent pas recomanat

---

## 🧠 Model mental

| Component | Funció              |
| --------- | ------------------- |
| scripts   | control del sistema |
| workflows | instruccions        |
| agents    | comportament        |
| skills    | coneixement modular |
| docs      | memòria             |
| templates | estructura          |

---

## ❌ Què NO fer

* implementar sense spec
* saltar fases
* barrejar canvis
* modificar fora de scope
* carregar massa context

---

## ✅ Bones pràctiques

* fer canvis petits
* validar abans de codificar
* seguir el workflow
* revisar sempre el resultat
* arxivar correctament

---

## 🎯 Per a qui és aquest template

* estudiants que aprenen a programar amb IA
* desenvolupadors que volen control i qualitat
* projectes reals amb workflows estructurats
* equips que volen evitar el caos amb IA

---

## 🚀 Extensions futures

* CLI (`ai-flow`)
* memòria persistent (Engram)
* orquestració multi-agent avançada
* càrrega automàtica de skills
* integració amb CI/CD

---

## 📌 Nota final

Això no és només un template.

És una manera de pensar i construir software amb IA.

**Si controles el procés, controles el resultat.**

---
