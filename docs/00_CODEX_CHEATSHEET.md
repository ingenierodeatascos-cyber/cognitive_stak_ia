# 🧠 CODEX WORKFLOW CHEATSHEET

Guia ràpida per treballar amb Codex app utilitzant el sistema de workflows, agents i scripts.

---

# 📦 ESTRUCTURA NECESSÀRIA

Aquest sistema assumeix que el repositori té:

```
AGENTS.md
ORCHESTRATOR.md

agents/
workflows/
scripts/

docs/
  active/
    current-change/
  archive/
```

---

# 🚀 FLUX COMPLET

```
1. start-change.sh
2. planner
3. spec-writer
4. task-writer
5. (review manual)
6. implementer
7. reviewer
8. tester (opcional)
9. security-reviewer (opcional)
10. archivist
11. archive-change.sh
```

---

# ⚙️ PAS 1 — CREAR CANVI

📍 Terminal (Codex o local)

```bash
./scripts/start-change.sh <nom-canvi>
```

Exemple:

```bash
./scripts/start-change.sh manual-payments
```

---

# 🧠 PAS 2 — PLANNER

📍 Codex (chat)

```text
Segueix exactament workflows/run-planner.md.

El canvi actual és: <descriu el canvi>

Escriu el resultat a:
docs/active/current-change/01_proposal.md

No implementis res.
```

---

# 📐 PAS 3 — SPEC WRITER

```text
Segueix exactament workflows/run-spec-writer.md.

Escriu el resultat a:
docs/active/current-change/02_spec_delta.md

No implementis res.
```

---

# 🎨 PAS 4 — DESIGNER (OPCIONAL)

Només si hi ha UI / UX.

```text
Segueix exactament workflows/run-designer.md.

Escriu el resultat a:
docs/active/current-change/03_design.md

No implementis codi.
```

---

# 🧩 PAS 5 — TASK WRITER

```text
Segueix exactament workflows/run-task-writer.md.

Escriu el resultat a:
docs/active/current-change/04_tasks.md

No implementis res.
```

---

# 🧠 PAS 6 — REVISIÓ HUMANA (HITL)

📍 Revisa manualment:

* 01_proposal.md
* 02_spec_delta.md
* 03_design.md (si existeix)
* 04_tasks.md

✔ L’abast és correcte?
✔ Falta alguna cosa?
✔ Tasks massa grans?

Si cal, demana refinament a Codex.

---

# 🛠️ PAS 7 — IMPLEMENTER

```text
Segueix exactament workflows/run-implementer.md.

Implementa només les tasks actuals.

Escriu el report a:
docs/active/current-change/05_implementation_report.md

No afegeixis funcionalitat extra.
```

---

# 🔍 PAS 8 — REVIEWER

```text
Segueix exactament workflows/run-reviewer.md.

Escriu el resultat a:
docs/active/current-change/06_review.md

No implementis res.
```

---

# 🧪 PAS 9 — TESTER (OPCIONAL)

```text
Segueix exactament workflows/run-tester.md.

Escriu el resultat a:
docs/active/current-change/07_test_report.md
```

---

# 🔐 PAS 10 — SECURITY REVIEWER (OPCIONAL)

```text
Segueix exactament workflows/run-security-reviewer.md.

Escriu el resultat a:
docs/active/current-change/08_security_review.md
```

---

# 🔧 CORRECCIONS

Si hi ha errors:

```text
Corregeix els problemes detectats a:
docs/active/current-change/06_review.md

No canviïs l’abast.
```

---

# 🧾 PAS 11 — ARCHIVIST

```text
Segueix exactament workflows/run-archivist.md.

Resumeix el canvi i prepara’l per arxiu.

No implementis res.
```

---

# 📦 PAS 12 — ARXIVAR

📍 Terminal

```bash
./scripts/archive-change.sh <nom-canvi>
```

---

# 🧠 REGLES CLAU

## ❌ NO fer

* implementar sense spec
* saltar planner
* modificar fora de scope
* fer refactors grans sense control

## ✅ FER

* seguir ordre de fases
* validar abans d’implementar
* mantenir canvis petits
* revisar sempre output

---

# 🧩 COMPONENTS DEL SISTEMA

| Component  | Funció                      |
| ---------- | --------------------------- |
| AGENTS.md  | Normes globals del projecte |
| workflows/ | Prompts reutilitzables      |
| agents/    | Definició de comportament   |
| scripts/   | Automatització de terminal  |
| docs/      | Memòria i canvis            |

---

# 🧠 MODEL MENTAL

* Scripts → filesystem
* Workflows → instruccions
* Agents → comportament
* Codex → executor

---

# ⚡ SHORTCUTS

## Planner

```
Segueix workflows/run-planner.md → 01_proposal.md
```

## Spec

```
Segueix workflows/run-spec-writer.md → 02_spec_delta.md
```

## Tasks

```
Segueix workflows/run-task-writer.md → 04_tasks.md
```

## Implement

```
Segueix workflows/run-implementer.md → 05_implementation_report.md
```

## Review

```
Segueix workflows/run-reviewer.md → 06_review.md
```

---

# 🧠 RECORDATORI FINAL

👉 Els .md NO s’executen sols
👉 Tu llances la fase
👉 Codex executa
👉 Scripts només ajuden amb estructura

---

# 🚀 NIVELL PRO (FUTUR)

* Afegir CLI (`ai-flow`)
* Integrar Engram (memòria)
* Skills registry modular
* Multi-worktree amb Codex

---
