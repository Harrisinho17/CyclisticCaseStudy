SELECT 
    COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS members,
    COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casuals,
	COUNT(CASE WHEN member_casual is not null THEN 1 END) AS users
FROM 
    cyclistic_ytd;
