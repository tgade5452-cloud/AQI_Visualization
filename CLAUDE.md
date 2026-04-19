# CLAUDE.md — AQIVisualization

## What this project is
Air Quality Index (AQI) visualization for Los Angeles and New York across 2023–2024. Two render paths:
- **Python** — static heatmap via seaborn/matplotlib (`heatmap_aqi.py`), data prep via pandas (`clean_aqi_data.py`).
- **Processing (Java-ish, `.pde`)** — interactive bar/line chart with keyboard + mouse controls (`AQIVisualization.pde` + `FloatTable.pde` + `Integrator.pde`).

Cleaned CSVs live in `data/`. Output image is `aqi_heatmap.png`.

## Style conventions observed

### Python
- **pandas-first**: build DataFrames inline, `pd.concat`, groupby-transform for imputation.
- **f-strings** for filenames: `f'aqi_{city.lower().replace(" ", "_")}_{year}.csv'`.
- **Flat scripts** — no `if __name__ == "__main__"`, no functions, no classes. Top-to-bottom procedural.
- **Comment style**: single-line `#` comments above each logical block. No docstrings.
- **Imports**: grouped at top, no sorting convention.
- No type hints, no tests.

### Processing (.pde)
- **One class per file** (`FloatTable`, `Integrator`) + one main sketch file holding globals and `setup()`/`draw()`.
- **Globals at the top** of the main sketch, grouped by purpose (layout vars, state flags, data refs).
- **Lifecycle order** in the main sketch: globals → `setup()` → `initializeIntegrators()` → `loadDataset()` → `draw()` → draw helpers (`drawTitle`, `drawAxes`, etc.) → event handlers (`mousePressed`, `keyPressed`, `mouseWheel`) at the bottom.
- **Integrator pattern** for animated value transitions — not direct assignment.
- **`println()` for debug logging**, kept in committed code.
- **Hardcoded color ranges** for AQI categories: green <50, yellow ≤100, red >100.
- 2-space indent in `.pde` (Processing default).

## Conventions to keep
1. Keep the Python cleaning script self-contained and reproducible — simulated/embedded data is acceptable for this demo.
2. When touching `.pde` files, preserve the Integrator-based animation — don't replace with direct value assignment.
3. Keep AQI color thresholds and legend labels consistent between the `.pde` bar graph and any new views.
4. CSV filename convention is `aqi_{city_snake_case}_{year}.csv` — don't break this; `loadDataset()` depends on the exact pattern.
5. No need to add tests or type hints unless the scope grows meaningfully — current style is intentionally lightweight.

## Things worth fixing if revisited
- `AQIVisualization.pde:55-57` — `data = new FloatTable(...)` is called twice in a row (likely a copy-paste leftover).
- `clean_aqi_data.py` embeds fake data inline; real data flow is TODO.
- No `.gitignore` for `data/` output or `*.png` renders.
