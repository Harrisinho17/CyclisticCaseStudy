-- Exporting specific casuals members and rideable type data to make it easier for tableau to handle the immense amount of data. 
-- I will also be taking a sample size of 1,000,000 rows for each. 

-- member & classic_bikes
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
Where 
	member_casual = 'member' AND rideable_type = 'classic_bike'
Limit 1000000;


-- member & electric_bike
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
Where 
	member_casual = 'member' AND rideable_type = 'electric_bike'
Limit 1000000;


-- member & electric scooter
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
Where 
	member_casual = 'member' AND rideable_type = 'electric_scooter'
Limit 1000000;