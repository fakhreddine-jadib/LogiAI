New-Item -ItemType Directory -Force "docs/adr" | Out-Null
@'
# ADR 005 — Packaging Python de LogiAI

- **Statut** : Accepté
- **Date** : 2026-11-25

## Décisions

1. **Bornes souples (`>=`) dans `pyproject.toml` vs figées (`==`) dans `requirements.txt`** : `pyproject.toml` déclare des versions minimales compatibles (`>=`) afin que le package `logiai` s'installe dans d'autres projets sans conflit de dépendances (figurer `==` dans `pyproject.toml` bloquerait l'intégration dès qu'un environnement utilise une version mineure différente). À l'inverse, `requirements.txt` fige les versions exactes en production Docker pour garantir la reproductibilité (des bornes souples en production exposeraient l'API à des régressions silencieuses lors d'un rebuild).
2. **Modèle (`models/`) conservé hors du package wheel** : Le wheel embarque uniquement le code Python (`logiai/`), tandis que `model.joblib` reste externe et localisé via `LOGIAI_HOME`. Inclure le modèle dans le wheel alourdirait l'archive et obligerait à rebuilder et republier le package logiciel à chaque réentraînement du modèle.
'@ | Set-Content -Encoding UTF8 "docs/adr/005-packaging.md"