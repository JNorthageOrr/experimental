DROP TABLE IF EXISTS animals;

CREATE TABLE animals(
  id SERIAL PRIMARY KEY,
  species VARCHAR NOT NULL,
  sex VARCHAR(6) NOT NULL,
  is_carnivore BOOLEAN NOT NULL
);

INSERT INTO animals
( species, sex, is_carnivore)
VALUES
( 'rhino', 'male', FALSE ),
( 'Lion', 'female', TRUE ),
( 'Capybara', 'male', TRUE );
