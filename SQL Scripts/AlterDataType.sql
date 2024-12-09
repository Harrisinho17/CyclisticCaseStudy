-- This group of queries was used to convert the data type of the 'started_at' and 'ended_at' columns from TEXT to TIMESTAMP datatypes to make it easier to analyze. 
-- I added the two new columns with seperate names to make sure I dont run into any data loss issues.

-- First I made sure there were no NULL values in the original dataset. 
SELECT 
	ride_id,
	started_at_updated,
	ended_at_updated
FROM 
	cyclistic_ytd
WHERE 
	started_at is NULL OR ended_at is NULL;

Alter Table 
	cyclistic_ytd
Add column
	started_at_updated TIMESTAMP;

Alter Table 
	cyclistic_ytd
Add column
	ended_at_updated TIMESTAMP;

--Then I converted the data from the original columns to the new columns under a differnt data type. 
Update 
	cyclistic_ytd 
Set started_at_updated = TO_TIMESTAMP(started_at,'YYY-MM-DD HH24:MI:SS');

Update 
	cyclistic_ytd 
Set ended_at_updated = TO_TIMESTAMP(ended_at,'YYY-MM-DD HH24:MI:SS');

-- Then to verify before deleting any columns, I made sure there were no null values in the updated dataset.
SELECT 
	ride_id,
	started_at_updated,
	ended_at_updated
FROM 
	cyclistic_ytd
WHERE 
	started_at_updated is NULL OR ended_at_updated is NULL;

-- Then I deleted the original date columns. 
Alter Table 
	cyclistic_ytd
Drop Column
	started_at;

Alter Table 
	cyclistic_ytd
Drop Column
	ended_at;

-- Finally I renamed the updated columns to started and ended at to replace the columns I deleted in the last query. 
ALTER TABLE cyclistic_ytd
RENAME COLUMN started_at_updated TO started_at;

ALTER TABLE cyclistic_ytd
RENAME COLUMN ended_at_updated TO eneded_at;

-- Alternatively I could have changed the data without saving and verifying no null values with the SQL script below but I wanted to ensure zero data loss. 
ALTER TABLE cyclistic_ytd
ALTER COLUMN started_at
TYPE TIMESTAMP USING TO_TIMESTAMP(your_text_column, 'YYYY-MM-DD HH24:MI:SS');

ALTER TABLE cyclistic_ytd
ALTER COLUMN ended_at
TYPE TIMESTAMP USING TO_TIMESTAMP(your_text_column, 'YYYY-MM-DD HH24:MI:SS');