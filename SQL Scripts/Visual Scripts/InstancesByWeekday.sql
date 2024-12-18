-- Used to get the amount of uses by day of the week.
SELECT 
	start_weekday, 
    COUNT(*) AS total_by_weekday
FROM 
    cyclistic_ytd
GROUP BY 
    TRstart_weekday
ORDER BY 
    CASE TRIM(start_weekday)
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;