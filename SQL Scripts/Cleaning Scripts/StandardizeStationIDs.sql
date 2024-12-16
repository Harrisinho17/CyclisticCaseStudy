-- The Below queries are meant to standardize the station Id's on the cyclistic_ytd table. While diving into the data I located some inconsistentices that may result in some issues down the road if I do not resolve them now. For example, some of the Id's has decimals, letters, and spaces within them. In an effort to standardize it and make it easier to compute without losing the original data I created two new columns and used a temp table to hold the distinct station names. I then used the SERIAL function to incrementally add integers to each station name in a new column within the created temp table. 

-- I then used this temp table to update the original table and then compared to make sure Nulls and Unkowns remained the same ID to keep the data consistent and practice data integrity. I dropped the temp table after the operations were completed and then updated the new names of the column in the main table because I pre


-- Add the New Column
ALTER TABLE cyclistic_ytd
ADD COLUMN s_station_uid INTEGER;

ALTER TABLE cyclistic_ytd
ADD COLUMN e_station_uid INTEGER;

-- Combine start and end stations, including NULL handling
CREATE TEMP TABLE unified_station_table AS
SELECT DISTINCT 
    COALESCE(start_station_id, 'NULL') AS station_id, 
    COALESCE(start_station_name, 'UNKNOWN') AS station_name
FROM cyclistic_ytd
UNION 
SELECT DISTINCT 
    COALESCE(end_station_id, 'NULL') AS station_id, 
    COALESCE(end_station_name, 'UNKNOWN') AS station_name
FROM cyclistic_ytd;

-- Add a new unique ID
ALTER TABLE unified_station_table
ADD COLUMN new_station_id SERIAL;

-- Update s_station_uid
UPDATE cyclistic_ytd
SET s_station_uid = ust.new_station_id
FROM unified_station_table ust
WHERE COALESCE(cyclistic_ytd.start_station_id, 'NULL') = ust.station_id;

-- Update e_station_uid
UPDATE cyclistic_ytd
SET e_station_uid = ust.new_station_id
FROM unified_station_table ust
WHERE COALESCE(cyclistic_ytd.end_station_id, 'NULL') = ust.station_id;

-- Verify what ID was given to Null Station ID's
SELECT * 
FROM unified_station_table
WHERE station_name = 'UNKNOWN';

-- Drop Temp table for efficnency and cleanness
DROP TABLE IF EXISTS unified_station_table;

