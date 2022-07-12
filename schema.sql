/* Database schema to keep the structure of entire database. */
CREATE TABLE animals
(
    id integer,
    name character varying(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species character varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE owners 
( 
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    full_name character varying(100), 
    age integer
);


CREATE TABLE species (id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, name character varying(100));

ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;


ALTER TABLE animals ALTER COLUMN species_id TYPE character varying(100);


ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);


CREATE TABLE vets 
( 
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name character varying(100),
    age integer,
    date_of_graduation date 
);



CREATE TABLE specializations (
    species_id integer NOT NULL,
    vets_id integer NOT NULL,
    CONSTRAINT "fk_species" FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE SET NULL,
    CONSTRAINT "fk_vets" FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE SET NULL,
    PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
    animals_id integer NOT NULL,
    vets_id integer NOT NULL,
    visit_date date NOT NULL,
    CONSTRAINT "fk_animals" FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE SET NULL,
    CONSTRAINT "fk_vets" FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE SET NULL,
    PRIMARY KEY (animals_id, vets_id, visit_date)
);


