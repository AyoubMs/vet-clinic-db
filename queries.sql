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
