-- This query excludes distances that are less than or equal to 0. As this is an unrealistic use of the cyclistic service. 
SELECT 
	member_casual,
	AVG(distance_in_km) AS avg_distance
FROM 
	ride_distance_view
WHERE 
	distance_in_km >= 0
GROUP BY 
	member_casual;