-- Used to get the amount of users by month and by the day of the week. 


SELECT 
	start_month, 
	COUNT(*) as total_by_month
FROM 
	cyclistic_ytd
GROUP BY 
	start_month;


SELECT 
	start_weekday, 
	COUNT(*) as total_by_weekday
FROM 
	cyclistic_ytd
GROUP BY 
	start_weekday;