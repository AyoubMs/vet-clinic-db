/* Populate database with sample data. */
INSERT INTO animals (NAME)
VALUES ('Luna');

INSERT INTO animals (NAME)
VALUES ('Daisy');

INSERT INTO animals (NAME)
VALUES ('Charlie');

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Agumon', 'February 3, 2020', 0, TRUE, 10.23);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Gabumon', 'November 15, 2018', 2, TRUE, 8);
