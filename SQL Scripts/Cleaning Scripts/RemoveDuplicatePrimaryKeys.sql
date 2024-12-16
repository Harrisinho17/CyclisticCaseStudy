-- Remove Duplicate Ride ID's from the data set. 

SELECT 
	ride_id,
	COUNT(*)
FROM cyclistic_ytd
GROUP BY ride_id
HAVING COUNT(*) > 1;

-- Removed duplicate Ride Id's using a common table expression. 
WITH CTE AS (
    SELECT ride_id, 
           ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY ride_id) AS row_num
    FROM cyclistic_ytd
)
DELETE FROM cyclistic_ytd
WHERE ride_id IN (
    SELECT ride_id 
    FROM CTE 
    WHERE row_num > 1
);