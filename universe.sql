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

INSERT INTO galaxy (
    name,
    apparent_magnitude,
    type,
    age_in_billions_of_years,
    description
) VALUES
    ('Milky Way', null, 'spiral', 13.61, 'Milky Way Galaxy, large spiral system consisting of several hundred billion stars, one of which is the Sun. It takes its name from the Milky Way, the irregular luminous band of stars and gas clouds that stretches across the sky as seen from Earth. Although Earth lies well within the Milky Way Galaxy (sometimes simply called the Galaxy), astronomers do not have as complete an understanding of its nature as they do of some external star systems.'),
    ('Andromeda Galaxy', 3.44, 'spiral', 10.01, 'Andromeda Galaxy, also called Andromeda Nebula, (catalog numbers NGC 224 and M31), great spiral galaxy in the constellation Andromeda, the nearest large galaxy. The Andromeda Galaxy is one of the few visible to the unaided eye, appearing as a milky blur. It is located about 2,480,000 light-years from Earth; its diameter is approximately 200,000 light-years; and it shares various characteristics with the Milky Way system.'),
    ('Black Eye Galaxy', 8.52, 'spiral', 13.28, 'Easily identified by the spectacular band of absorbing dust partially obscuring its bright nucleus, M64, or the Black Eye galaxy, is characterized by its bizarre internal motion. The gas in the outer regions of this remarkable galaxy is rotating in the opposite direction from the gas and stars in its inner regions.'),
    ('Comet Galaxy', 18.7, 'spiral', null, 'The Comet Galaxy, a spiral galaxy located 3.2 billion light-years from Earth, in the galaxy cluster Abell 2667, was found with the Hubble Space Telescope. This galaxy has slightly more mass than our Milky Way. It was detected on 2 March 2007. Comet Galaxy. The Comet Galaxy, as taken by the Hubble Space Telescope.'),
    ('Centaurus A', 6.84, 'elliptical', 13.27, 'Centaurus A, also known as NGC 5128, is a peculiar massive elliptical galaxy with a supermassive black hole at its heart. It lies about 12 million light-years away in the southern constellation of Centaurus (The Centaur) and has the distinction of being the most prominent radio galaxy in the sky. Astronomers think that the bright nucleus, strong radio emission and jet features of Centaurus A are produced by a central black hole with a mass of about 100 million times that of the Sun. Matter from the dense central parts of the galaxy releases vast amounts of energy as it falls towards the black hole.'),
    ('Whirlpool Galaxy', 8.4, 'spiral', 0.4003, 'The graceful, winding arms of the majestic spiral galaxy M51 appear like a grand spiral staircase sweeping through space. They are actually long lanes of stars and gas laced with dust. Such striking arms are a hallmark of so-called grand-design spiral galaxies. In M51, also known as the Whirlpool galaxy, these arms serve an important purpose: they are star-formation factories, compressing hydrogen gas and creating clusters of new stars.');

INSERT INTO star (
    galaxy_id,
    name,
    apparent_magnitude,
    diameter_in_km,
    temperature_in_celsius,
    is_sun,
    description
) VALUES
    (1, 'Polaris', 1.98, 70000000, 5742, false, 'The North Star or Pole Star - aka Polaris - is famous for holding nearly still in our sky while the entire northern sky moves around it. That''s because it''s located nearly at the north celestial pole, the point around which the entire northern sky turns. Polaris is not the brightest star in the nighttime sky, as is commonly believed. It''s only about 50th brightest.'),
    (1, 'Sun', -26.74, 1390000, 5505, true, 'The Sun is the largest object in our solar system. The Sun''s volume would need 1.3 million Earths to fill it. Its gravity holds the solar system together, keeping everything from the biggest planets to the smallest bits of debris in orbit around it. The hottest part of the Sun is its core, where temperatures top 27 million degrees Fahrenheit (15 million degrees Celsius).'),
    (1, 'Sirius', -1.47, 2400000, 9667, false, 'Sirius, also called Alpha Canis Majoris or the Dog Star, brightest star in the night sky, with apparent visual magnitude -1.46. It is a binary star in the constellation Canis Major. The bright component of the binary is a blue-white star 25.4 times as luminous as the Sun. It has a radius 1.71 times that of the Sun and a surface temperature of 9,940 kelvins (K), which is more than 4,000 K higher than that of the Sun.'),
    (2, 'Alpha Andromedae', 2.06, null, 12727, false, 'Alpha Andromedae, officially named Alpheratz, is 97 light-years from the Sun and is the brightest star in the constellation of Andromeda when Beta Andromedae undergoes its periodical dimming.'),
    (1, 'Betelgeuse', 0.5, 1230000000, 3327, false, 'Betelgeuse, also called Alpha Orionis, second brightest star in the constellation Orion, marking the eastern shoulder of the hunter. Betelgeuse is one of the most luminous stars in the night sky.'),
    (2, 'Beta Andromedae', 2.05, 139140000, 3567, false, 'Beta Andromedae is a single red giant with a stellar classification of M0 III, and is currently on the asymptotic giant branch of its evolution. Since 1943 the spectrum of this star has been one of the stable anchor points by which other stars are classified.'),
    (1, 'Antares', 0.6, 946150000, 3387, false, 'Antares, also called Alpha Scorpii, red, semiregular variable star, with apparent visual magnitude about 1.1, the brightest star in the zodiacal constellation Scorpius and one of the largest known stars, having several hundred times the diameter of the Sun and 10,000 times the Sun''s luminosity. Antares lies about 600 light-years from the Earth.');

INSERT INTO planet (
    star_id,
    name,
    orbital_period,
    diameter_in_km,
    has_rings,
    type,
    description
) VALUES 
    (1, 'Earth', 365, 12742, false, 'terrestrial', 'Our home planet is the third planet from the Sun, and the only place we know of so far that''s inhabited by living things. While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface.'),
    (1, 'Mercury', 88, 4880, false, 'terrestrial', 'The smallest planet in our solar system and nearest to the Sun, Mercury is only slightly larger than Earth''s Moon. From the surface of Mercury, the Sun would appear more than three times as large as it does when viewed from Earth, and the sunlight would be as much as seven times brighter.'),
    (1, 'Venus', 225, 12104, false, 'terrestrial', 'Venus is the second planet from the Sun and is Earth''s closest planetary neighbor. It''s one of the four inner, terrestrial (or rocky) planets, and it''s often called Earth''s twin because it''s similar in size and density.'),
    (1, 'Mars', 687, 6779, false, 'terrestrial', 'Mars is the fourth planet from the Sun - a dusty, cold, desert world with a very thin atmosphere. Mars is also a dynamic planet with seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past.'),
    (1, 'Jupiter', 4380, 139820, true, 'gas_giant', 'Jupiter has a long history of surprising scientists - all the way back to 1610 when Galileo Galilei found the first moons beyond Earth. That discovery changed the way we see the universe.'),
    (1, 'Saturn', 10759, 116460, true, 'gas_giant', 'Saturn is the sixth planet from the Sun and the second-largest planet in our solar system. Adorned with thousands of beautiful ringlets, Saturn is unique among the planets.'),
    (1, 'Uranus', 30687, 50724, true, 'ice_giant', 'Uranus is the seventh planet from the Sun, and has the third-largest diameter in our solar system. It was the first planet found with the aid of a telescope, Uranus was discovered in 1781 by astronomer William Herschel.'),
    (1, 'Neptune', 60190, 49244, true, 'ice_giant', 'Dark, cold, and whipped by supersonic winds, ice giant Neptune is the eighth and most distant planet in our solar system. More than 30 times as far from the Sun as Earth, Neptune is the only planet in our solar system not visible to the naked eye and the first predicted by mathematics before its discovery.'),
    (1, 'Pluto', 90530, 2376.6, false, 'dwarf_planet', 'Pluto is a dwarf planet in the Kuiper Belt, a donut-shaped region of icy bodies beyond the orbit of Neptune.'),
    (1, 'Ceres', 1680, 946, false, 'dwarf_planet', 'Dwarf planet Ceres is the largest object in the asteroid belt between Mars and Jupiter, and it''s the only dwarf planet located in the inner solar system.'),
    (1, 'Eris', 558, 2326, false, 'dwarf_planet', 'Eris is one of the largest known dwarf planets in our solar system. It''s about the same size as Pluto but is three times farther from the Sun.'),
    (1, 'Haumea', 284, 1632, false, 'dwarf_planet', 'Haumea is roughly the same size as Pluto. It is one of the fastest rotating large objects in our solar system. The fast spin distorts Haumea''s shape, making this dwarf planet look like a football.');

INSERT INTO moon (
    planet_id,
    name,
    diameter_in_km,
    periapsis,
    apoapsis,
    description
) VALUES 
    (1, 'Moon', 3484.8, 362600, 405400, 'Earth''s Moon is the only place beyond Earth where humans have set foot.'),
    (5, 'Ganymede', 5268.2, 1069200, 1071600, 'Jupiter''s moon Ganymede is proving to be a fascinating world. Not only is it the largest moon in our solar system, but NASA''s Hubble Space Telescope has found the best evidence yet for an underground saltwater ocean on Ganymede.'),
    (5, 'Io', 3643.2, 420000, 423400, 'Io, or Jupiter I, is the innermost and third-largest of the four Galilean moons of the planet Jupiter.'),
    (4, 'Phobos', 22533, 9234, 9517, 'Phobos, gouged and nearly shattered by a giant impact crater and beaten by thousands of meteorite impacts, is on a collision course with Mars.'),
    (4, 'Deimos', 12.4, 23455, 23470, 'Deimos is the smaller of Mars'' two moons. Being only 9 by 7 by 6.8 miles in size (15 by 12 by 11 kilometers), Deimos whirls around Mars every 30 hours.'),
    (7, 'Ariel', 1157.8, null, null, 'Ariel was discovered Oct. 24, 1851 by William Lassell, one of 19th century England''s grand amateur astronomers, who used the fortune he made in the brewery business to finance his telescopes.'),
    (7, 'Oberon', 1522.8, null, null, 'Oberon was discovered in Jan. 11, 1787 by William Herschel.'),
    (7, 'Puck', 162, null, null, 'Puck was discovered December 1985 in images sent back by the Voyager 2 spacecraft during its flyby of Uranus.'),
    (7, 'Titania', 1576.8, null, null, 'Titania was discovered on Jan. 11, 1787 by British astronomer William Herschel.'),
    (8, 'Halimede', 62, null, null, 'Halimede was discovered Aug. 14, 2002 by Matthew J. Holman, John J. Kavelaars, Tommy Grav, Wesley C. Fraser, and Dan Milisavljevic.'),
    (8, 'Larissa', 194, null, null, 'Although it was initially spotted by H. Reitsema, W. Hubbard, L. Lebofsky, and D. Tholen through ground-based telescopes in 1981, Larissa was officially discovered in July 1989 by the Voyager 2 science team.'),
    (8, 'Triton', 2706.8, null, null, 'Triton is the only known satellite in our solar system to have a surface made mainly of nitrogen ice'),
    (8, 'Nereid', 340, null, null, 'Nereid was discovered on May 1, 1949 by Gerard P. Kuiper with a ground-based telescope.'),
    (6, 'Aegaeon', 0.12, null, null, 'Scientists imaged the moonlet on Aug. 15, 2008, and then confirmed its presence by finding it in two earlier images.'),
    (6, 'Dione', 1122.8, null, null, 'Giovanni Cassini discovered Dione on March 21, 1684.'),
    (6, 'Atlas', 30.2, null, null, 'Atlas was discovered in 1980 by R. Terrile and the Voyager 1 team from photographs taken during its encounter with Saturn.'),
    (6, 'Calypso', 21.4, null, null, 'Calypso was discovered by D. Pascu, P.K. Seidelmann, W. Baum, and D. Currie in March 1980 using a ground-based telescope.'),
    (5, 'Callisto', 4820.6, 1869000, 1897000, 'Callisto is the most heavily cratered object in our solar system.'),
    (5, 'Europa', 3121.6, 664862, 676938, 'Europa might be the best place to look for environments where life could exist.'),
    (9, 'Charon', 1212, 19587, 19595, 'At half the size of Pluto, Charon is the largest of Pluto''s moons and the largest known satellite relative to its parent body.');

INSERT INTO comet (
    galaxy_id,
    name,
    diameter_in_km,
    apparent_magnitude,
    description
) VALUES 
    (1, '1P/Halley', 11, 28.2, '1P/Halley is often called the most famous comet because it marked the first time astronomers understood comets could be repeat visitors to our night skies. Astronomers have now linked the comet''s appearances to observations dating back more than 2,000 years.'),
    (1, '109P/Swift-Tuttle', 26, null, 'Comet Swift-Tuttle was discovered in 1862 independently by both Lewis Swift and Horace Tuttle.'),
    (1, '19P/Borrelly', 4.8, null, 'Comet 19P/Borrelly was discovered by Alphonse Louis Nicolas Borrelly on Dec. 28, 1904, in Marseille, France.'),
    (1, '103P/Hartley', 1.6, 21.46, 'Hartley 2 was discovered by Malcolm Hartley on Mar. 15, 1986 using the Schmidt Telescope at the Siding Spring Observatory in Australia.');
