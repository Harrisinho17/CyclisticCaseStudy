-- I used this script to get the number of distinct rides members and casuals used the equipment. 
SELECT 
    COALESCE(member_casual, 'total') AS member_casual,
    COUNT(ride_id) AS instances
FROM 
    cyclistic_ytd
GROUP BY 
    ROLLUP(member_casual)
ORDER BY 
    instances DESC;