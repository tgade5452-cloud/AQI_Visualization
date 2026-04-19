<div align="center">

# AQI Visualization 🌍📊

### Interactive Air Quality Index visualization using Processing and Python

<p>
  Explore AQI trends across cities and years through interactive charts,
  cleaned datasets, and generated heatmaps.
</p>

<p>
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/Processing-006699?style=for-the-badge&logo=processingfoundation&logoColor=white" alt="Processing" />
  <img src="https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" alt="Java" />
  <img src="https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white" alt="Pandas" />
  <img src="https://img.shields.io/badge/Matplotlib-11557C?style=for-the-badge" alt="Matplotlib" />
  <img src="https://img.shields.io/badge/Seaborn-4C72B0?style=for-the-badge" alt="Seaborn" />
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white" alt="Git" />
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub" />
</p>

<p>
  <a href="#overview">Overview</a> •
  <a href="#features">Features</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#installation">Installation</a> •
  <a href="#usage">Usage</a> •
  <a href="#controls">Controls</a>
</p>

</div>

---

## Overview

AQI Visualization is a data visualization project that helps users explore and compare **Air Quality Index (AQI)** patterns across cities and years.

This project combines:

- an **interactive Processing sketch**
- **Python scripts** for data cleaning
- a **heatmap generator** for summarized AQI comparisons

It is built to make environmental data easier to understand through visuals instead of raw spreadsheets.

---

## Features

- Interactive AQI charts in Processing
- Bar graph and line graph modes
- Switch between multiple datasets
- Hover-style visual inspection
- Optional vertical guide lines
- Cleaned AQI datasets generated with Python
- Heatmap output for city/year/month comparison

---

## Tech Stack

### Languages
- Python
- Processing / Java
- Markdown
- HTML in README formatting

### Libraries
- pandas
- matplotlib
- seaborn

### Tools
- Processing IDE
- Git
- GitHub
- VS Code

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
└── README.md
```

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/tgade5452-cloud/AQI_Visualization.git
cd AQI_Visualization
```

### 2. Install Python

Make sure **Python 3** is installed on your system.

Check with:

```bash
python --version
```

### 3. Install required Python libraries

```bash
pip install pandas matplotlib seaborn
```

### 4. Install Processing IDE

Download and install the **Processing IDE**.

After installation, open:

```text
AQIVisualization.pde
```

---

## Usage

### Run the data cleaning script

```bash
python clean_aqi_data.py
```

This script:
- prepares AQI datasets
- filters city and year data
- handles missing values
- exports cleaned files

### Generate the heatmap

```bash
python heatmap_aqi.py
```

This script:
- reads cleaned AQI data
- combines city/year records
- creates a monthly AQI heatmap
- saves the output image

### Run the interactive visualization

Open `AQIVisualization.pde` in the Processing IDE and press **Run**.

---

## Controls

| Key | Action |
|-----|--------|
| `b` | Switch to bar graph |
| `l` | Switch to line graph |
| `v` | Toggle vertical guide lines |
| `1` | Load Los Angeles dataset |
| `2` | Load New York dataset |

---

## AQI Categories

| AQI Range | Category |
|----------|----------|
| 0 - 50 | Good |
| 51 - 100 | Moderate |
| 101+ | Unhealthy |

---

## Output

Generated output included in the repository:

```text
aqi_heatmap.png
```

This file gives a quick visual comparison of AQI values by:
- city
- year
- month

---

## Author

**tgade5452-cloud**

---

## License

MIT License
