-- Used to get the amount of users by month.
SELECT 
    TRIM(start_month) AS start_month, 
    COUNT(*) AS total_by_month
FROM 
    cyclistic_ytd
GROUP BY 
    TRIM(start_month)
ORDER BY 
    CASE TRIM(start_month)
        WHEN 'January' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
        WHEN 'April' THEN 4
        WHEN 'May' THEN 5
        WHEN 'June' THEN 6
        WHEN 'July' THEN 7
        WHEN 'August' THEN 8
        WHEN 'September' THEN 9
        WHEN 'October' THEN 10
        WHEN 'November' THEN 11
        WHEN 'December' THEN 12
    END;

