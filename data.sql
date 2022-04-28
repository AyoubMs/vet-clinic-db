/* Populate database with sample data. */
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

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Pikachu', 'January 7, 2021', 1, FALSE, 15.04);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Charmander', 'February 8, 2020', 0, TRUE, -11);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Plantmon', 'November 15, 2021', 2, TRUE, -5.7);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Squirtle', 'April 2, 1993', 3, FALSE, -12.13);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Angemon', 'June 12, 2005', 1, TRUE, 45);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Boarmon', 'June 7, 2005', 7, TRUE, 20.4);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    t t weight_kg
  )
VALUES ('Blossom', 'October 13, 1998', 3, TRUE, 17);

INSERT INTO
  animals (
    NAME,
    date_of_birth,
    escape_attempts,
    neutered,
    weight_kg
  )
VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

INSERT INTO species (NAME)
VALUES ('Pokemon');

INSERT INTO species (NAME)
VALUES ('Digimon');

BEGIN;

UPDATE animals
SET species_id = CASE
    WHEN NAME LIKE '%mon'
    THEN (
      SELECT id
      FROM species
      WHERE NAME = 'Digimon'
    )
    ELSE (
      SELECT id
      FROM species
      WHERE NAME = 'Pokemon'
    )
  END;

SELECT *
FROM animals;

COMMIT;

BEGIN;

UPDATE animals
SET owner_id = CASE
    WHEN NAME = 'Agumon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Sam Smith'
    )
    WHEN NAME = 'Gabumon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Jennifer Orwell'
    )
    WHEN NAME = 'Pikachu'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Jennifer Orwell'
    )
    WHEN NAME = 'Devimon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Bob'
    )
    WHEN NAME = 'Plantmon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Bob'
    )
    WHEN NAME = 'Charmander'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Squirtle'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Blossom'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Melody Pond'
    )
    WHEN NAME = 'Angemon'
    THEN (
      SELECT id
      FROM owners
      WHERE
        full_name = 'Dean Winchester'
    )
    WHEN NAME = 'Boarmon'
    THEN (
      SELECT id
      FROM owners
      WHERE full_name = 'Dean Winchester'
    )
  END;

SELECT *
FROM animals;

COMMIT;

INSERT INTO vets (NAME, age, date_of_graduation)
VALUES ('William Tatcher', 45, 'April 23, 2000');

INSERT INTO vets (NAME, age, date_of_graduation)
VALUES ('Maisy Smith', 26, 'January 17, 2019');

INSERT INTO vets (NAME, age, date_of_graduation)
VALUES ('Stephanie Mendez', 64, 'May 4, 1981');

INSERT INTO vets (NAME, age, date_of_graduation)
VALUES ('Jack Harkness', 38, 'April 8, 2008');

INSERT INTO specializations (species_id, vets_id)
VALUES ( (
      SELECT id
      FROM species
      WHERE NAME = 'Pokemon'
    ), (
      SELECT id
      FROM vets
      WHERE NAME = 'William Tatcher'
    )
  );

INSERT INTO specializations (species_id, vets_id)
VALUES ( (
      SELECT id
      FROM species
      WHERE NAME = 'Digimon'
    ), (
      SELECT id
      FROM vets
      WHERE NAME = 'Stephanie Mendez'
    )
  );

INSERT INTO specializations (species_id, vets_id)
VALUES ( (
      SELECT id
      FROM species
      WHERE NAME = 'Pokemon'
    ), (
      SELECT id
      FROM vets
      WHERE NAME = 'Stephanie Mendez'
    )
  );

INSERT INTO specializations (species_id, vets_id)
VALUES ( (
      SELECT id
      FROM species
      WHERE NAME = 'Digimon'
    ), (
      SELECT id
      FROM vets
      WHERE NAME = 'Jack Harkness'
    )
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Agumon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'William Tatcher'
    ),
    'May 24, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Agumon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Stephanie Mendez'
    ),
    'July 22, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Gabumon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Jack Harkness'
    ),
    'February 2, 2021'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Pikachu'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'January 5, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Pikachu'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    '2020-03-08'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Pikachu'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'May 14, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Devimon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Stephanie Mendez'
    ),
    'May 4, 2021'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Charmander'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Jack Harkness'
    ),
    'February 24, 2021'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Plantmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'December 21, 2019'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Plantmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'William Tatcher'
    ),
    'August 10, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Plantmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'April 7, 2021'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Squirtle'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Stephanie Mendez'
    ),
    'September 29, 2019'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Agumon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Jack Harkness'
    ),
    'October 3, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Agumon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Jack Harkness'
    ),
    'November 4, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Boarmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'January 24, 2019'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Boarmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'May 15, 2019'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Boarmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'February 27, 2019'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Boarmon'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Maisy Smith'
    ),
    'August 3, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Blossom'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'Stephanie Mendez'
    ),
    'May 24, 2020'
  );

INSERT INTO
  visits (animals_id, vets_id, date_of_visit)
VALUES ( (
      SELECT id
      FROM animals
      WHERE NAME = 'Blossom'
    ), (
      SELECT id
      FROM vets
      WHERE
        NAME = 'William Tatcher'
    ),
    'January 11, 2021'
  );
