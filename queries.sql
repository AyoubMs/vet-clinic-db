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
