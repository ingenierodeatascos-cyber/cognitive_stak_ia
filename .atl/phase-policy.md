# PHASE POLICY

## Objectiu

Definir quan una fase es pot considerar completa i quan es pot avançar a la següent.

Aquest document evita:
- salts de fase
- canvis mal definits
- implementació prematura
- revisió sense criteri
- tancaments bruts

---

## Principi general

No es pot avançar de fase perquè "sembla suficient".

Només es pot avançar si:
- el contracte de sortida està complet
- no hi ha bloquejos crítics
- el context és suficient
- la fase següent pot operar sense ambigüitat

---

## Fases oficials

1. Proposal
2. Spec Delta
3. Design
4. Tasks
5. Implementation
6. Review
7. Test Report
8. Security Review
9. Human Approval
10. Archive

---

## Política per fase

### 1. Proposal

#### Es considera completa si:
- el problema està definit
- el scope està delimitat
- l’impacte està identificat
- els riscos principals estan llistats
- els dubtes oberts són visibles

#### No es pot avançar si:
- el problema és ambigu
- el canvi és massa ampli i no delimitat
- hi ha contradiccions amb el projecte
- no s’entén què queda fora

#### Pot passar a:
- Spec Delta
- directament Implementation només si el bug és trivial i clar

---

### 2. Spec Delta

#### Es considera completa si:
- hi ha requisits funcionals clars
- hi ha criteris d’acceptació verificables
- hi ha out of scope explícit
- hi ha edge cases si apliquen
- no hi ha llenguatge ambigu

#### No es pot avançar si:
- els requisits no són testejables
- hi ha barreja entre requisits i implementació
- no queda clar què és èxit

#### Pot passar a:
- Design
- Tasks
- Human Gate

---

### 3. Design

#### Es considera completa si:
- s’ha definit l’experiència o estructura visual
- s’han aclarit fluxos d’usuari
- no hi ha contradiccions amb SPEC
- el resultat és executable per Task Writer o Implementer

#### No es pot avançar si:
- hi ha ambigüitat visual
- falten decisions de flux
- hi ha conflictes amb constraints o arquitectura

#### Pot passar a:
- Tasks
- Human Gate

---

### 4. Tasks

#### Es considera completa si:
- les tasks són concretes
- les tasks són petites i executables
- el conjunt cobreix la SPEC
- no hi ha duplicacions
- cada task té impacte clar

#### No es pot avançar si:
- hi ha tasks massa grans
- hi ha tasks vagues
- les tasks no cobreixen els requisits
- hi ha dependències ocultes

#### Pot passar a:
- Human Gate
- Implementation

---

### 5. Human Gate abans d’implementar

#### Es considera completa si:
- proposal / spec / design / tasks han estat revisats
- el canvi és acceptable
- el risc és assumible
- no hi ha dubtes crítics

#### No es pot avançar si:
- hi ha desacord sobre l’abast
- hi ha dubtes de negoci
- hi ha preocupacions d’arquitectura
- hi ha risc no resolt

#### Pot passar a:
- Implementation

---

### 6. Implementation

#### Es considera completa si:
- les tasks assignades s’han executat
- els fitxers modificats són coherents amb el scope
- hi ha implementation report
- no s’han introduït canvis fora de task
- el canvi és revisable

#### No es pot avançar si:
- falta report
- hi ha canvis fora de scope
- s’han redefinit requisits durant l’execució
- hi ha dubtes no documentats

#### Pot passar a:
- Review
- Test Report
- Security Review

---

### 7. Review

#### Es considera completa si:
- hi ha estat PASS o FAIL
- els problemes detectats són clars
- s’han identificat desviacions d’arquitectura
- el risc global està explicat

#### No es pot avançar si:
- la review és superficial
- no hi ha decisió clara
- no s’avaluen qualitat, arquitectura i correcció

#### Pot passar a:
- Test Report
- Security Review
- Human Approval final

---

### 8. Test Report

#### Es considera completa si:
- s’han validat casos principals
- s’han validat edge cases rellevants
- s’ha documentat què s’ha testejat
- s’ha documentat què NO s’ha testejat

#### No es pot avançar si:
- no queda clar què s’ha comprovat
- hi ha regressions sense tractar
- el comportament crític no s’ha validat

#### Pot passar a:
- Human Approval final

---

### 9. Security Review

#### Es considera completa si:
- s’han revisat inputs
- s’han revisat permisos
- s’han revisat dades sensibles
- s’han identificat riscos
- hi ha estat clar o recomanacions clares

#### No es pot avançar si:
- hi ha riscos crítics sense tractar
- la revisió no cobreix la superfície d’atac rellevant

#### Pot passar a:
- Human Approval final

---

### 10. Human Approval final

#### Es considera completa si:
- hi ha decisió explícita
- s’accepta o es rebutja el canvi
- els riscos residuals són coneguts
- hi ha autorització per tancar

#### No es pot avançar si:
- no hi ha decisió clara
- hi ha FAIL en review sense resolució
- hi ha test o seguretat crítics pendents

#### Pot passar a:
- Archive

---

### 11. Archive

#### Es considera completa si:
- el canvi actiu s’ha mogut a archive
- el context actiu s’ha netejat
- s’han actualitzat decisions o memory si cal
- no queda residu operatiu al current-change

#### No es pot avançar si:
- s’ha perdut informació rellevant
- hi ha documents en actiu que ja són històrics
- s’ha duplicat memòria sense criteri

---

## Regles globals

### Regla 1
Cap fase pot modificar el contracte d’una fase anterior sense deixar-ho documentat.

### Regla 2
Si canvia el scope, cal tornar enrere a Proposal o Spec Delta.

### Regla 3
Si apareix una decisió arquitectònica nova, s’ha de registrar a decisions/.

### Regla 4
Si una lliçó és durable i reutilitzable, s’ha de promoure a memory/durable/.

### Regla 5
Archive no és una paperera.
És un tancament net i consultable.

---

## Criteri de bloqueig

Qualsevol d’aquests casos bloqueja el pas a la següent fase:
- ambigüitat crítica
- contradicció amb SPEC
- contradicció amb arquitectura
- risc crític no resolt
- output obligatori incomplet
- falta d’aprovació humana on toca

---

## Filosofia

Una fase no s’acaba quan algú ha treballat.

S’acaba quan deixa el següent agent en condicions de treballar bé.
