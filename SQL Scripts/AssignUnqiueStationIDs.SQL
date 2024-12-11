-- This set of queries will be used to clean the station ID's to clear leading spaces and duplicate unique identifier.

Select Distinct
	start_station_name,
	start_station_id
FROM cyclistic_ytd
ORDER BY 2;

Select Distinct
	end_station_name,
	end_station_id
FROM cyclistic_ytd
ORDER BY 2;

UPDATE cyclistic_ytd
SET start_station_id = LTRIM(start_station_id);

UPDATE cyclistic_ytd
SET end_station_id = LTRIM(end_station_id);


-- Step 1: Add the New Column
ALTER TABLE cyclistic_ytd
ADD COLUMN new_start_station_id INTEGER;

ALTER TABLE cyclistic_ytd
ADD COLUMN new_end_station_id INTEGER;

--2 temp table 

CREATE TEMP TABLE start_temp_table AS
SELECT DISTINCT  start_station_name, start_station_id
FROM cyclistic_ytd
ORDER BY start_station_id

ALTER TABLE start_temp_table
ADD COLUMN new_start_station_id SERIAL;

UPDATE cyclistic_ytd
SET new_start_station_id = stt.new_start_station_id
FROM start_temp_table stt
WHERE cyclistic_ytd.start_station_id = stt.start_station_id;

SELECT *
FROM start_temp_table;

Select 
	start_station_name
	start_station_id,
	new_start_station_id
FROM 
	cyclistic_ytd
Order By 
	start_station_id;


Alter Table start_temp_table
Drop Column new_start_station_id

DROP TABLE IF EXISTS start_temp_table