-- Set a realisitc minimum ride limit for the dataset. By finding data that is unrealistic like trip duration outliers I can delete them from the data set while downloading them just in case to preserve data integrity. For this I chose rides less than 1 minute and rides longer than 6 hours to be deleted from the data set. Based on similar companies like Bird and Lyft scooters. 

SELECT 
	*
FROM
	cyclistic_ytd
WHERE 
	ride_duration::INTERVAL < '00:01:00' 
	OR
	ride_duration::interval > '06:00:00'
ORDER BY 
	ride_duration DESC;

DELETE FROM 
cyclistic_ytd
WHERE
	ride_duration::INTERVAL < '00:01:00'
	OR
	ride_duration::interval > '06:00:00';


