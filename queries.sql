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
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;



















-- -- 
-- BEGIN
-- DELETE
-- FROM animals
-- WHERE date_of_birth > 'January 1, 2022';
-- SAVEPOINT younger_deleted
-- UPDATE animals

