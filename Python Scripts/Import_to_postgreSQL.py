import pandas as pd
from sqlalchemy import create_engine

db_username = 'postgres'
db_password = 'Mudkip'

db_host = 'localhost'
db_port = '5432'
db_name = 'Cyclistic_CaseStudy'

engine = create_engine(f'postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}')

df1 = pd.read_csv('/Users/aharris/Documents/GitHub/CyclisticCaseStudy/Data/Last_12Months.csv', low_memory=False)
df1.to_sql('cyclistic_ytd', engine, if_exists='replace', index=False)

print("Tables created and data imported successfully!")