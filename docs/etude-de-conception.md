@'
# Étude de conception — LogiAI

## 1. Besoin
*À compléter lors d'un prochain atelier.*

## 2. Données
*À compléter lors d'un prochain atelier.*

## 3. Modèle et métriques
*À compléter lors d'un prochain atelier.*

## 4. Critères d'acceptation
*À compléter lors d'un prochain atelier.*

## 5. Cycle de vie
*À compléter lors d'un prochain atelier.*

## 6. Architecture

```text
+-----------------------------------------------------------------------+
|                       Poste Utilisateur / Client                      |
|                                                                       |
|   +----------------------------+     +----------------------------+   |
|   |    Page Web (HTML / JS)    |     |   CLI : logiai-predict     |   |
|   +-------------+--------------+     +-------------+--------------+   |
+-----------------|----------------------------------|------------------+
                  | HTTP (:8080)                     | Appel direct
                  v                                  |
+------------------------------------+               |
|          Conteneur Nginx           |               |
|  (Reverse Proxy + Fichiers Web)    |               |
+-----------------+------------------+               |
                  | /api/* -> :8000                  |
                  v                                  v
+-----------------------------------------------------------------------+
|                    Conteneur API (FastAPI / Uvicorn)                  |
|                                                                       |
|   +---------------------------------------------------------------+   |
|   |          Package Python : logiai (site-packages)              |   |
|   |   logiai.api (FastAPI, Pydantic)  |  logiai.predict / cli     |   |
|   +-------------------------------+-------------------------------+   |
|                                   | Lecture via LOGIAI_HOME           |
|                                   v                                   |
|   +-------------------------------+-------------------------------+   |
|   |        Artefacts externes (/app/models & /app/data)           |   |
|   |   - models/model.joblib & models/model_info.json              |   |
|   |   - data/livraisons.csv                                       |   |
|   +---------------------------------------------------------------+   |
+-----------------------------------------------------------------------+