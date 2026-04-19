# AQI Visualization

A data visualization project for exploring monthly **Air Quality Index (AQI)** trends using **Processing** and **Python**.

This repository combines:

- an interactive Processing sketch for AQI visualization  
- Python scripts for cleaning AQI data  
- a Python-generated heatmap for quick comparison across cities and years  

---

## Project Overview

The goal of this project is to visualize and compare AQI patterns across different cities and years in a clear, interactive way.

The main Processing sketch displays monthly AQI values for:

- Los Angeles (2023)  
- New York (2023)  
- Los Angeles (2024)  
- New York (2024)  

Users can switch between graph types and datasets to compare air quality trends over time.

---

## Features

### Processing Visualization

- Interactive AQI chart built in Processing  
- Toggle between:
  - **Bar graph**
  - **Line graph**
- Switch between city datasets  
- Hover to inspect AQI values  
- Optional vertical guide lines  

### AQI Color Categories

- Green = Good  
- Yellow = Moderate  
- Red = Unhealthy  

### Python Data Pipeline

- Cleans and filters AQI data  
- Handles missing AQI values  
- Exports cleaned CSV files by city and year  

### Heatmap Visualization

- Generates a heatmap of AQI values by month  
- Makes it easier to compare AQI trends across multiple city/year combinations  

---

## Repository Structure

```text
AQI_Visualization/
│
├── DATA/                           
├── AQIVisualization.pde            
├── FloatTable.pde                  
├── Integrator.pde                  
├── clean_aqi_data.py               
├── heatmap_aqi.py                  
├── aqi_heatmap.png                 
├── AQIVisualizationPresentation.pptx
├── CLAUDE.md
└── README.md
````

---

## Technologies Used

* **Processing**
* **Python**
* **pandas**
* **matplotlib**
* **seaborn**

---

## How It Works

### 1. Clean the Data

Run:

```bash
python clean_aqi_data.py
```

This script:

* builds example AQI datasets
* keeps only Los Angeles and New York data
* filters to 2023 and 2024
* fills missing AQI values
* exports cleaned CSV files

---

### 2. Generate the Heatmap

Run:

```bash
python heatmap_aqi.py
```

This script:

* loads the cleaned CSV files
* combines them into one dataset
* pivots AQI values by city/year and month
* generates a heatmap image

---

### 3. Launch the Interactive Visualization

Open:

```text
AQIVisualization.pde
```

Then run it in **Processing**.

---

## Controls

Inside the Processing sketch:

| Key | Action                      |
| --- | --------------------------- |
| `b` | Switch to bar graph         |
| `l` | Switch to line graph        |
| `v` | Toggle vertical guide lines |
| `1` | Load Los Angeles dataset    |
| `2` | Load New York dataset       |

---

## AQI Categories

| AQI Range | Category  |
| --------- | --------- |
| 0–49      | Good      |
| 50–100    | Moderate  |
| 101+      | Unhealthy |

---

## Example Output

Included file:

```text
aqi_heatmap.png
```

Provides a quick comparison of AQI values by:

* city
* year
* month

---

## Setup Instructions

### Install Python Packages

```bash
pip install pandas matplotlib seaborn
```

### Run Python Pipeline

```bash
python clean_aqi_data.py
python heatmap_aqi.py
```

### Install Processing

Download from:

[https://processing.org/download](https://processing.org/download)

Then open:

```text
AQIVisualization.pde
```

---

## Notes

* Python scripts currently use simulated sample data
* Can be extended using real AQI APIs such as EPA or OpenAQ
* You may need to adjust folder path naming (`DATA` vs `data`) depending on OS

---

## Future Improvements

* Add more cities
* Real-time AQI integration
* Year-over-year trend charts
* Better zoom and interaction
* Export charts directly from Processing
* Pollutant-specific views (PM2.5, NO2, Ozone)

---

## Author

Created by **tgade5452-cloud**

---

## License

MIT License

```
```
