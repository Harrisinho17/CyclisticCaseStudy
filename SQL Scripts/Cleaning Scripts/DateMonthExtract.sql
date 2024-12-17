-- I wanted the date of the week and the month of the year seperately in order to analyze it better on tableau but I noticed some of the started at and ended at times happen to cross over to the next date. I decided to create 4 new columns and extract the weekday and month from the started at and ended at columns to fill those columns. 

SELECT * 
FROM cyclistic_ytd
WHERE DATE(started_at) <> DATE(ended_at);

Alter Table cyclistic_ytd
ADD COLUMN start_weekday integer;

Alter Table cyclistic_ytd
ADD COLUMN end_weekday integer;

Alter Table cyclistic_ytd
ADD COLUMN start_month integer;

Alter Table cyclistic_ytd
ADD COLUMN end_month integer;


UPDATE cyclistic_ytd
SET start_weekday = EXTRACT(ISODOW FROM started_at),  
    start_month = EXTRACT(MONTH FROM started_at);  

UPDATE cyclistic_ytd
SET end_weekday = EXTRACT(ISODOW FROM ended_at),  
    end_month = EXTRACT(MONTH FROM ended_at);     

