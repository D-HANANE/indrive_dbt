# InDrive Analytics avec dbt

L’objectif est de transformer les données brutes d’InDrive en tables permettant d’analyser les courses et les gains des chauffeurs.

## Données utilisées

Le projet utilise quatre fichiers CSV :

- `raw_drivers` : chauffeurs et notes.
- `raw_vehicles` : véhicules.
- `raw_zones` : zones.
- `raw_ride_events` : courses.

## Organisation du projet

| Dossier                            | Contenu                                        |
| ---------------------------------- | ---------------------------------------------- |
| `dbt_project/seeds/`               | Données CSV                                    |
| `dbt_project/models/staging/`      | Typage des données sources                     |
| `dbt_project/models/intermediate/` | Enrichissement des courses                     |
| `dbt_project/models/marts/`        | Dimensions, table de faits et gains quotidiens |
| `dbt_project/snapshots/`           | Historique des notes des chauffeurs            |
| `dbt_project/macros/`              | Classement des notes par tranche               |

## Installation

Docker et Python doivent être installés.

Depuis le dossier contenant `docker-compose.yml` :

```bash
docker compose up -d
pip install dbt-postgres==1.9.1 dbt-core==1.10.15
```

Copier `dbt_project/profiles.yml.example` dans le dossier personnel `.dbt`, en le renommant `profiles.yml`.

Entrer ensuite dans le projet :

```bash
cd dbt_project
dbt debug
```

## Exécution

Exécuter les commandes dans cet ordre :

```bash
dbt seed
dbt run --select staging
dbt snapshot
dbt run
dbt test
```

La variable `start_date`, définie dans `dbt_project.yml`, permet de choisir la date de début des courses à traiter.

## Tables principales

- `dim_driver` : informations actuelles des chauffeurs.
- `dim_vehicle` : véhicules.
- `dim_zone` : zones.
- `fact_rides` : une ligne par course.
- `fct_driver_daily_earnings` : gains quotidiens, cumul et classement des chauffeurs.

Le snapshot conserve les changements de notes. `fact_rides` utilise un chargement incrémental.

## Tests

Les tests vérifient les clés uniques, les valeurs nulles, les types de véhicules et les relations entre les courses, les chauffeurs et les zones.

Résultat vérifié :

```text
dbt run  : 9 modèles exécutés, 0 erreur
dbt test : 34 tests réussis, 0 erreur
```

## Documentation

```bash
dbt docs generate
dbt docs serve
```

La documentation est accessible à l’adresse [http://localhost:8080](http://localhost:8080).
