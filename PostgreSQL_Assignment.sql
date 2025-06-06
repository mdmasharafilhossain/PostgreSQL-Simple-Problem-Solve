
-----------------------------------------------1st Table--------------------------------------------------
CREATE TABLE rangers (
     ranger_id SERIAL PRIMARY KEY,
     name VARCHAR(150) NOT NULL,
     region VARCHAR(150) NOT NULL
);
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');
 SELECT * FROM rangers;

--------------------------------------------------End-----------------------------------------------

 
 --------------------------------------------2nd Table ------------------------------------------
 CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
      common_name VARCHAR(150),
          scientific_name VARCHAR(150),
     discovery_date DATE,
     conservation_status VARCHAR(150)
);


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');
 
 SELECT * FROM species;




-------------------------------------------------End----------------------------------------------------


------------------------------------------------------3rd Table---------------------------------------
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(150),
    notes TEXT
);

INSERT INTO sightings (species_id, ranger_id, sighting_time, location, notes) VALUES
(1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(1, 2, '2024-05-18 18:30:00', 'Snowfall Pass', NULL);

SELECT * FROM sightings;

----------------------------------------------------End-------------------------------------------------


--------#Problem--01----------------------------------------------------------------------------------------

INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');
-- SELECT * From rangers;

--------#Problem--02---------------------------------------------------------------------------------------
SELECT COUNT(DISTINCT species_id) AS unique_species_count FROM sightings;

--------#Problem--03------------------------------------------------------------------------------------------
SELECT * FROM sightings  WHERE location ILIKE '%Pass%'



-------#Problem--04--------------------------------------------------------------------------------------
SELECT r.name, COUNT(s.sighting_id) AS total_sightings FROM rangers r
LEFT JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;



-------#Problem--05--------------------------------------------------------------------------------------
SELECT common_name FROM species
WHERE species_id NOT IN (SELECT DISTINCT species_id FROM sightings);


-------#Problem--06--------------------------------------------------------------------------------------
SELECT spe.common_name, s.sighting_time, r.name FROM sightings s
JOIN species spe ON s.species_id = spe.species_id
JOIN rangers r ON s.ranger_id = r.ranger_id
ORDER BY s.sighting_time DESC
LIMIT 2;

-------#Problem--07--------------------------------------------------------------------------------------

UPDATE species SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';

-------#Problem--08--------------------------------------------------------------------------------------
SELECT sighting_id,
  CASE
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sightings;


-------#Problem--09--------------------------------------------------------------------------------------
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings);
