# AQI_Visualization


An air quality data visualization project for comparing monthly AQI trends across **Los Angeles** and **New York** for **2023** and **2024**.

This repository includes:

- An **interactive Processing visualization** with bar and line graph modes
- A **Python data-cleaning script** for preparing AQI CSV files
- A **Python heatmap generator** for creating a static AQI heatmap image

---

## Project Overview

The goal of this project is to visualize **Air Quality Index (AQI)** data in a clear and interactive way so users can compare air quality patterns across cities and years.

The project supports two visualization approaches:

### 1. Processing Interactive Visualization
Built with Processing (`.pde` files), this version provides:

- Bar graph and line graph views
- City switching between **Los Angeles** and **New York**
- Year-based dataset switching for **2023** and **2024**
- Hover-based AQI value display
- Optional vertical guide lines
- Smooth animated transitions using an integrator class

### 2. Python Heatmap Visualization
Built with Python using `pandas`, `matplotlib`, and `seaborn`, this version creates a static heatmap showing AQI values by month, city, and year.

---

## Repository Structure

```bash
AQI_Visualization/
│
├── AQIVisualization.pde              # Main Processing sketch
├── FloatTable.pde                    # CSV parsing and table utilities for Processing
├── Integrator.pde                    # Animation helper for smooth transitions
├── clean_aqi_data.py                 # Python script to clean and generate AQI CSV files
├── heatmap_aqi.py                    # Python script to generate AQI heatmap
├── aqi_heatmap.png                   # Generated sample heatmap image
├── AQIVisualizationPresentation.pptx # Project presentation
├── CLAUDE.md                         # Internal project notes / development guidance
└── DATA/ or data/                    # AQI CSV datasets
