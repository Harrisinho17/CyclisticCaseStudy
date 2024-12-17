-- In this script I used instances and the avg latitude and longitude to map the highest instances of start and end stations. 

-- Start station details with averqages
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

-- Start station details without averages
SELECT 
    start_station_name,
    s_station_uid,
  	start_lat,
	start_lng,
    COUNT(ride_id) AS instances
FROM 
    cyclistic_ytd
GROUP BY 
    start_station_name, 
    s_station_uid,
	start_lat,
	start_lng
ORDER BY 
    instances DESC;


-- End station details with averages
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


-- End Station details without averages
    SELECT 
    end_station_name,
    e_station_uid,
  	end_lat,
	end_lng,
    COUNT(ride_id) AS instances
FROM 
    cyclistic_ytd
GROUP BY 
    endt_station_name, 
    e_station_uid,
	end_lat,
	end_lng
ORDER BY 
    instances DESC;