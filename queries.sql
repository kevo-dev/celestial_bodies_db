-- Relationship exploration queries for the universe database.

-- 1. List planets with their star and galaxy.
SELECT p.name AS planet, s.name AS star, g.name AS galaxy
FROM planet AS p
JOIN star AS s ON s.star_id = p.star_id
JOIN galaxy AS g ON g.galaxy_id = s.galaxy_id
ORDER BY g.name, s.name, p.name;

-- 2. List each moon with its planet.
SELECT m.name AS moon, p.name AS planet
FROM moon AS m
JOIN planet AS p ON p.planet_id = m.planet_id
ORDER BY p.name, m.name;

-- 3. Count planets per star.
SELECT s.name AS star, COUNT(p.planet_id) AS planet_count
FROM star AS s
LEFT JOIN planet AS p ON p.star_id = s.star_id
GROUP BY s.star_id, s.name
ORDER BY planet_count DESC, s.name;

-- 4. Count moons per planet.
SELECT p.name AS planet, COUNT(m.moon_id) AS moon_count
FROM planet AS p
LEFT JOIN moon AS m ON m.planet_id = p.planet_id
GROUP BY p.planet_id, p.name
ORDER BY moon_count DESC, p.name;

-- 5. Check for planets whose referenced star does not exist.
SELECT p.*
FROM planet AS p
LEFT JOIN star AS s ON s.star_id = p.star_id
WHERE s.star_id IS NULL;

-- 6. Check for moons whose referenced planet does not exist.
SELECT m.*
FROM moon AS m
LEFT JOIN planet AS p ON p.planet_id = m.planet_id
WHERE p.planet_id IS NULL;
