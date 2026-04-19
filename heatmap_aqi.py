import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load cleaned datasets
data = []
for city in ['los_angeles', 'new_york']:
    for year in [2023, 2024]:
        df = pd.read_csv(f'data/aqi_{city}_{year}.csv')
        df['City'] = city.replace('_', ' ').title()
        df['Year'] = year
        data.append(df)
data = pd.concat(data, ignore_index=True)

# Pivot data for heatmap
pivot = data.pivot_table(values='AQI', index=['City', 'Year'], columns='Month', aggfunc='mean')

# Plot heatmap
plt.figure(figsize=(10, 6))
sns.heatmap(pivot, cmap='RdYlGn_r', annot=True, fmt='.0f')
plt.title('AQI Heatmap by City and Year')
plt.xlabel('Month')
plt.ylabel('City, Year')
plt.savefig('aqi_heatmap.png')
plt.show()