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
