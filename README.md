# InDrive Analytics avec dbt

## Partie C

### 4. Grain de fact_rides

Une ligne représente une course identifiée par `ride_id`.

### 5. Dimensions véhicule et zone

Le Type 1 suffit pour `dim_vehicle` et `dim_zone` car on a seulement besoin de leurs informations actuelles, sans historique.

### 6. Snapshot des chauffeurs

Le snapshot garde les anciennes notes et crée une nouvelle version quand `rating` change. Cet historique est utile pour les chauffeurs, mais il n’est pas demandé pour les véhicules et les zones.

### 7. Jointures du modèle intermédiaire

Le `LEFT JOIN` garde une course même si son chauffeur n’existe pas. Le test de relation peut alors repérer l’erreur, tandis qu’un `INNER JOIN` supprimerait la course.

## Partie D

### 9. Macro ou variable

Une macro convient car le classement des notes utilise des conditions SQL. Une variable contient seulement une valeur, comme la date de début.

### 10. Changement de note

Après le passage de 4.80 à 4.30, les anciennes courses gardent 4.80 car le filtre sur `requested_at` ne les reprend pas. Le flag `--full-refresh` reconstruit ces lignes avec la nouvelle note.

## Partie E

### 12. Chauffeur inexistant

Avec `driver_id = 999`, seul le test `relationships` entre `fact_rides.driver_id` et `dim_driver.driver_id` échoue. Le chauffeur n’existe pas, mais la course est conservée grâce au `LEFT JOIN`.

## Partie F

### 14. Lignage

Oui, `int_rides_enriched` apparaît dans le lignage même s’il est éphémère. dbt connaît ses liens grâce aux `ref()`, sans créer de table pour ce modèle.

## Preuve d’exécution

Après les essais et la remise des données d’origine :

```text
dbt run  : PASS=9  WARN=0 ERROR=0 SKIP=0 TOTAL=9
dbt test : PASS=34 WARN=0 ERROR=0 SKIP=0 TOTAL=34
```
