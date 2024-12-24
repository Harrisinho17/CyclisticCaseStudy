-- Took A sample Size of the data becasue of the limitations that Tableau Public has when it comes to mapping large data sets. 
Select 
	ride_id,
	member_casual,
	rideable_type,
	ride_duration,
	distance_in_km,
	start_lat,
	start_lng,
	end_lat,
	end_lng
From 
	cyclistic_ytd
Limit 1000000;