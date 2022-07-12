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
