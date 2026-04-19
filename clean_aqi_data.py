import pandas as pd

# Load raw datasets (simulated for this project)
# In a real scenario, replace with actual raw data files
raw_data = [
    pd.DataFrame({
        'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        'City': ['Los Angeles']*12,
        'AQI': [60.0, None, 55.0, 62.0, 65.0, 70.0, 75.0, 72.0, 68.0, 60.0, 58.0, 55.0],
        'PM2.5': [12.5, 15.0, 13.0, 14.0, 16.0, 18.0, 20.0, 19.0, 17.0, 15.0, 14.0, 13.0],
        'NO2': [20.0, 22.0, 19.0, 21.0, 23.0, 25.0, 27.0, 26.0, 24.0, 22.0, 21.0, 20.0],
        'Year': [2023]*12
    }),
    pd.DataFrame({
        'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        'City': ['New York']*12,
        'AQI': [45.0, 48.0, 50.0, 52.0, 55.0, 60.0, 62.0, 58.0, 55.0, 50.0, 48.0, 45.0],
        'PM2.5': [10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 15.5, 14.5, 13.5, 12.5, 11.5],
        'NO2': [18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0, 23.5, 22.5, 21.5, 20.5, 19.5],
        'Year': [2023]*12
    }),
    pd.DataFrame({
        'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        'City': ['Los Angeles']*12,
        'AQI': [58.0, 56.0, 54.0, 60.0, 63.0, 68.0, 73.0, 70.0, 66.0, 58.0, 56.0, 53.0],
        'PM2.5': [12.0, 14.5, 12.5, 13.5, 15.5, 17.5, 19.5, 18.5, 16.5, 14.5, 13.5, 12.5],
        'NO2': [19.5, 21.5, 18.5, 20.5, 22.5, 24.5, 26.5, 25.5, 23.5, 21.5, 20.5, 19.5],
        'Year': [2024]*12
    }),
    pd.DataFrame({
        'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        'City': ['New York']*12,
        'AQI': [43.0, 46.0, 48.0, 50.0, 53.0, 58.0, 60.0, 56.0, 53.0, 48.0, 46.0, 43.0],
        'PM2.5': [9.5, 10.5, 11.5, 12.5, 13.5, 14.5, 15.5, 14.0, 13.0, 12.0, 11.0, 10.0],
        'NO2': [17.5, 18.5, 19.5, 20.5, 21.5, 22.5, 23.5, 22.0, 21.0, 20.0, 19.0, 18.0],
        'Year': [2024]*12
    }),
    pd.DataFrame({
        'Month': ['Jan'],
        'City': ['Chicago'],
        'AQI': [50.0],
        'PM2.5': [11.0],
        'NO2': [20.0],
        'Year': [2022]
    })
]

# Combine datasets
raw_data = pd.concat(raw_data, ignore_index=True)

# Remove irrelevant columns
data = raw_data[['Month', 'City', 'AQI', 'Year']]

# Filter for Los Angeles and New York, 2023-2024
data = data[data['City'].isin(['Los Angeles', 'New York']) & data['Year'].isin([2023, 2024])]

# Handle missing AQI values
data['AQI'] = data.groupby(['City', 'Year'])['AQI'].transform(lambda x: x.fillna(x.mean()))

# Save cleaned datasets
for city in ['Los Angeles', 'New York']:
    for year in [2023, 2024]:
        city_year_data = data[(data['City'] == city) & (data['Year'] == year)][['Month', 'AQI']]
        city_year_data.to_csv(f'aqi_{city.lower().replace(" ", "_")}_{year}.csv', index=False)

print("Cleaned datasets saved.")