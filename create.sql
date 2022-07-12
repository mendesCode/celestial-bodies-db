DROP TABLE IF EXISTS galaxy;
CREATE TABLE IF NOT EXISTS galaxy
(
    galaxy_id SERIAL NOT NULL CONSTRAINT galaxy_pk PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT,
    apparent_magnitude NUMERIC(4, 2),
    type VARCHAR(32) NOT NULL,
    age_in_billions_of_years NUMERIC(12, 6)
);

DROP TABLE IF EXISTS star;
CREATE TABLE IF NOT EXISTS star
(
    star_id SERIAL NOT NULL CONSTRAINT star_pk PRIMARY KEY,
    galaxy_id INTEGER NOT NULL CONSTRAINT star_fk_galaxy_id REFERENCES galaxy (galaxy_id),
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT,
    is_sun BOOLEAN NOT NULL DEFAULT false,
    diameter_in_km NUMERIC(18, 6),
    temperature_in_celsius INTEGER NOT NULL,
    apparent_magnitude NUMERIC (4, 2)
);

DROP TABLE IF EXISTS planet;
CREATE TABLE IF NOT EXISTS planet
(
    planet_id SERIAL NOT NULL CONSTRAINT planet_pk PRIMARY KEY,
    star_id INTEGER NOT NULL CONSTRAINT planet_fk_star_id REFERENCES star (star_id),
    name VARCHAR(64) NOT NULL UNIQUE,
    orbital_period INTEGER NOT NULL,
    description TEXT,
    has_rings BOOLEAN NOT NULL,
    diameter_in_km NUMERIC(18, 2),
    type VARCHAR(32) NOT NULL
);

DROP TABLE IF EXISTS moon;
CREATE TABLE IF NOT EXISTS moon
(
    moon_id SERIAL NOT NULL CONSTRAINT moon_pk PRIMARY KEY,
    planet_id INTEGER NOT NULL CONSTRAINT moon_fk_planet_id REFERENCES planet (planet_id),
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT,
    diameter_in_km NUMERIC(18, 2) NOT NULL,
    apoapsis INTEGER,
    periapsis INTEGER
);

DROP TABLE IF EXISTS comet;
CREATE TABLE IF NOT EXISTS comet
(
    comet_id SERIAL NOT NULL CONSTRAINT comet_pk PRIMARY KEY,
    galaxy_id INTEGER NOT NULL CONSTRAINT comet_fk_galaxy_id REFERENCES galaxy (galaxy_id),
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT,
    diameter_in_km NUMERIC(18, 2),
    apparent_magnitude NUMERIC(4, 2)
);
