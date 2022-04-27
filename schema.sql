/* Database schema to keep the structure of entire database. */
CREATE TABLE
  animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg REAL
  );

ALTER TABLE animals
ADD COLUMN species VARCHAR(250);

CREATE TABLE
  owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY(id)
  );

CREATE TABLE
  species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    PRIMARY KEY(id)
  );

ALTER TABLE animals
ADD PRIMARY KEY id;


ALTER TABLE animals
DROP COLUMN IF EXISTS species;

ALTER TABLE animals
ADD COLUMN species_id INT;
ALTER TABLE animals
ADD CONSTRAINT species_fk
FOREIGN KEY (species_id)
REFERENCES species(id)
ON DELETE CASCADE;
