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

-- Remove leading spaces from the station ID's

UPDATE cyclistic_ytd
SET start_station_id = LTRIM(start_station_id);

UPDATE cyclistic_ytd
SET end_station_id = LTRIM(end_station_id);

