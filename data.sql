/* Populate database with sample data. */


INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', 'feb 3, 2020', '0', true, '10.23');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', 'Nov 15, 2018', '2', true, '8');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', 'jan 7, 2021', '1', false, '15.04');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', 'may 12, 2017', '5', true, '11');

/* Day 2 data */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', 'feb 8, 2020', '0', false, '-11');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', 'nov 15, 2021', '2', true, '-5.7');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', 'Apr 2, 1993', '3', false, '-12.13');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', 'Jun 12, 2005', '1', true, '-45');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', 'Jun 7, 2005', '7', true, '20.4');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', 'Oct 13, 1998', '3', true, '17');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (11, 'Ditto', 'May 14, 2022', '4', true, '22');


BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;


BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' 
WHERE name NOT LIKE '%mon%';
COMMIT
SELECT * FROM animals;


BEGIN TRANSACTION;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK TRANSACTION;
SELECT * FROM animals;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT save1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK;
UPDATE animals SET weight_kg = weight_kg * -1 
WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;
