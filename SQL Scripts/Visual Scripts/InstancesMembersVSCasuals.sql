-- I used this script to get the number of distinct rides members and casuals used the equipment. 
SELECT 
	member_casual,
	rideable_type,
	COUNT(ride_id) as instances
FROM 
	cyclistic_ytd
GROUP BY 
	member_casual;
	rideable_type;