-- I wanted the date of the week, the month of the year and the hour of each instance seperately in order to analyze it better on tableau but I noticed some of the started at and ended at times happen to cross over to the next date. I decided to create 4 new columns and extract the weekday, month and hour from the started at and ended at columns to fill those columns. 

SELECT * 
FROM cyclistic_ytd
WHERE DATE(started_at) <> DATE(ended_at);

-- Add necessary Columns
Alter Table cyclistic_ytd
    ADD COLUMN start_weekday integer;

Alter Table cyclistic_ytd
    ADD COLUMN end_weekday integer;

Alter Table cyclistic_ytd
    ADD COLUMN start_month VarChar;

Alter Table cyclistic_ytd
    ADD COLUMN end_month VarChar;

ALTER TABLE cyclistic_ytd
    ADD COLUMN start_hour INTEGER;

ALTER TABLE cyclistic_ytd
    ADD COLUMN end_hour INTEGER;

-- Update columns by extracting necessary data. 
UPDATE cyclistic_ytd
SET start_weekday = EXTRACT(ISODOW FROM started_at),  
    start_month = TO_CHAR(started_at, 'Month'),
    start_hour = EXTRACT(HOUR FROM started_at);

UPDATE cyclistic_ytd
SET end_weekday = EXTRACT(ISODOW FROM ended_at),  
    end_month = TO_CHAR(ended_at, 'Month'),
    end_hour = EXTRACT(HOUR FROM started_at);





