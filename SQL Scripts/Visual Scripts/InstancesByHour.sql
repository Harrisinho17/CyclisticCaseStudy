SELECT 
	start_hour, 
	COUNT(*) as total_by_hour
FROM 
	cyclistic_ytd
GROUP BY 
	start_hour;