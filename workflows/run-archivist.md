# RUN ARCHIVIST

Llegeix aquests fitxers abans d'actuar:

- AGENTS.md
- ORCHESTRATOR.md
- .atl/routing.md
- .atl/phase-policy.md
- agents/archivist.md
- docs/active/current-change/*
- docs/project/*
- docs/memory/index.md
- docs/memory/decisions/*
- docs/memory/patterns/*
- docs/memory/context/*
- memory/durable/*

## Missió

Tancar el canvi actual i convertir-lo en històric net, consultable i no resident.

No implementis res.  
No revisis codi.  
No redefineixis decisions.  
Només tanca, resumeix i arxiva correctament.

## Objectiu del resultat

Generar el contingut de:

- resum d'arxiu
- actualitzacions de memòria si apliquen
- moviment del canvi a `docs/archive/YYYY/change-slug/`

I deixar net:

- docs/active/current-change/

## Regles obligatòries

- No perdis informació rellevant
- No copiïs tot a `docs/memory/`
- Guarda només aprenentatge durable si realment aplica
- No deixis residu al context actiu
- Resumeix decisions i lliçons de forma compacta

## Format de sortida obligatori

Retorna només l'output estructurat definit a `agents/archivist.md`.

No afegeixis introduccions.
No afegeixis explicacions fora del format.
