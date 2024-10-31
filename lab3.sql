SELECT * FROM cities WHERE name LIKE '%ськ';

SELECT * FROM cities WHERE name LIKE '%донец%';

SELECT CONCAT(name, ' (', region, ')') AS city_region
FROM cities
WHERE population > 100000
ORDER BY name;

SELECT name, population,
       (population / 40000000) * 100 AS population_percentage
FROM cities
ORDER BY population DESC
LIMIT 10;

SELECT CONCAT(name, ' - ', (population / 40000000) * 100, '%') AS city_percentage
FROM cities
WHERE population >= (0.001 * 40000000)
ORDER BY (population / 40000000) * 100;
