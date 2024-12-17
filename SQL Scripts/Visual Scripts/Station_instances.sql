-- In this script I used instances and the avg latitude and longitude to map the highest instances of start and end stations. 


SELECT 
    start_station_name,
    s_station_uid,
    AVG(start_lat) AS avg_lat,
    AVG(start_lng) AS avg_lng,
    COUNT(ride_id) AS instances
FROM 
    cyclistic_ytd
GROUP BY 
    start_station_name, 
    s_station_uid
ORDER BY 
    instances DESC;




SELECT 
    end_station_name,
    e_station_uid,
    AVG(end_lat) AS avg_lat,
    AVG(end_lng) AS avg_lng,
    COUNT(ride_id) AS instances
FROM 
    cyclistic_ytd
GROUP BY 
    end_station_name, 
    e_station_uid
ORDER BY 
    instances DESC;