SELECT
    ride_id,
    member_casual,
    rideable_type,
    ride_duration,
    start_station_name,
    s_station_uid,
	start_lat,
	start_lng,
    end_station_name,
    e_station_uid,
	end_lat,
	end_lng,
    6371 * acos(
        LEAST(1.0, GREATEST(-1.0,
            cos(radians(start_lat)) * cos(radians(end_lat)) *
            cos(radians(end_lng) - radians(start_lng)) +
            sin(radians(start_lat)) * sin(radians(end_lat))
        ))
    ) AS distance_in_km
FROM
    cyclistic_ytd
WHERE 
    start_lat IS NOT NULL AND end_lat IS NOT NULL
    AND start_lng IS NOT NULL AND end_lng IS NOT NULL;