SELECT 
	member_casual,
	rideable_type,
	AVG(ride_duration) as time
FROM 
	cyclistic_ytd
GROUP BY 
	member_casual,
	rideable_type;
    