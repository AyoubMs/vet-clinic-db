/*Queries that provide answers to the questions from all projects.*/
SELECT *
FROM animals
WHERE NAME LIKE '%mon';

SELECT *
FROM animals
WHERE
  date_of_birth BETWEEN 'January 1, 2016' AND 'December 31, 2019';

SELECT *
FROM animals
WHERE neutered = TRUE ANDescape_attempts < 3;

SELECT date_of_birth
FROM animals
WHERE NAME IN ('Agumon', 'Pikachu');

SELECT escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT *
FROM animals
WHERE neutered = TRUE;

SELECT *
FROM animals
WHERE NAME <> 'Gabumon';

SELECT *
FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;  

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN
DELETE
FROM animals;
ROLLBACK;
-- this will show that the table exists
\d animals

BEGIN;
DELETE
FROM animals
WHERE date_of_birth > 'January 1, 2022';
SAVEPOINT younger_deleted;
UPDATE animals
SET weight_kg = weight_kg * (-1);
ROLLBACK TO younger_deleted;
UPDATE animals
SET weight_kg = weight_kg * (-1)
WHERE weight_kg < 0;
COMMIT;

SELECT count(*) FROM animals;
SELECT count(*) FROM animals
WHERE escape_attempts = 0;
SELECT AVG(weight_kg) AS average_weight FROM animals;
SELECT * FROM animals
ORDER BY escape_attempts DESC
LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals
GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals
WHERE date_of_birth BETWEEN 'January 1, 1990' AND 'December 31, 2000'
GROUP BY species;


SELECT * FROM animals
JOIN owners ON owner_id = owners.id
WHERE full_name = 'Melody Pond';

SELECT * FROM animals
JOIN species ON species_id = species.id
WHERE species.name = 'Pokemon';

SELECT full_name AS owner_name, animals.name AS animal_name FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

SELECT species.name AS species, count(*)  FROM animals
JOIN species ON species_id = species.id
GROUP BY species.id;

SELECT animals.name AS animal 
FROM animals
JOIN species ON species_id = species.id
WHERE species.name = 'Digimon' AND owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell');

SELECT animals.name AS animal 
FROM animals
JOIN owners ON owner_id = owners.id
WHERE animals.escape_attempts = 0 AND owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester');


SELECT full_name, count(animals.name) AS animal_count
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY animal_count DESC
LIMIT 1;

-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'William Tatcher')
ORDER BY visits.date_of_visit DESC
LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT count(*) FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
WHERE visits.vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, (SELECT name as specialization FROM species WHERE specializations.species_id = species.id) FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals
LEFT JOIN visits ON animals.id = visits.animals_id
WHERE visits.date_of_visit BETWEEN 'April 1, 2020' AND 'August 30, 2020';

-- What animal has the most visits to vets?
SELECT animals.name, count(visits.date_of_visit) AS visit_count  FROM animals
LEFT JOIN visits ON animals.id = visits.animals_id
GROUP BY animals.name
ORDER BY visit_count DESC
LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name FROM animals
LEFT JOIN visits ON animals.id = visits.animals_id
ORDER BY visits.date_of_visit
LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT 
    animals.*,
    vets.*
FROM animals
INNER JOIN visits ON animals.id = visits.animals_id
INNER JOIN vets ON vets.id = visits.vets_id
ORDER BY visits.date_of_visit
LIMIT 1;


-- How many visits were with a vet that did not specialize in that animal's species?
SELECT count(*) as visits FROM visits
LEFT JOIN specializations ON specializations.vets_id = visits.vets_id
LEFT JOIN animals ON visits.animals_id = animals.id
WHERE animals.species_id <> specializations.species_id;

-- What specialty should Maisy Smith consider getting?
CREATE VIEW Maisy_top_visit AS
SELECT visits.animals_id, count(vets.name) AS number_of_visits  FROM vets
LEFT JOIN visits ON visits.vets_id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY visits.animals_id
ORDER BY number_of_visits DESC
LIMIT 1;

SELECT animals.name FROM animals
WHERE animals.id = (SELECT animals_id FROM Maisy_top_visit);
