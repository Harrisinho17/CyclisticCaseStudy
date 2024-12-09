import pandas as pd
import glob

csv_files = glob.glob('/Users/aharris/Documents/GitHub/CyclisticCaseStudy/Data/*.csv')

dataframes = []

for file in csv_files:
    df = pd.read_csv(file)
    dataframes.append(df)

combined_df = pd.concat(dataframes, ignore_index=True)
combined_df.to_csv('/Users/aharris/Documents/GitHub/CyclisticCaseStudy/Data/Last_12Months.csv', index=False)

print("CSV files combined successfully!")