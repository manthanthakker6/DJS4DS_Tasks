# Chicago Crime Dataset — EDA Project

A complete exploratory data analysis of the Chicago crime dataset: data quality assessment,
univariate and bivariate/multivariate analysis, and strategic recommendations backed by the data.

## Contents

| File | Purpose |
|---|---|
| `Chicago_CrimeAnalysis.ipynb` | The full analysis notebook — run top to bottom in Jupyter |
| `compressed_data.csv.gz` | Source data (place your copy here if not already present) |
| `README.md` | This file |

## Dataset

- **Rows / columns:** 120,759 incidents × 23 fields
- **Coverage:** derived from the `Year` column at runtime (see notebook Section 1.1)
- **Key fields:** `Primary Type`, `Description`, `Location Description`, `Arrest`, `Domestic`,
  `District`, `Ward`, `Community Area`, `Latitude`/`Longitude`, `Date`

## Setup

```bash
python3 -m venv venv
source venv/bin/activate      # Windows: venv\Scripts\activate
pip install jupyter pandas numpy matplotlib seaborn
```

## Running

1. Put `compressed_data.csv
   ` in the same folder as the notebook (already the default
   `DATA_PATH` in the first code cell — edit that path if your file lives elsewhere).
3. Launch Jupyter and run all cells:
```bash
   jupyter notebook Chicago_CrimeAnalysis.ipynb
```
   or from the command line:
```bash
   jupyter nbconvert --to notebook --execute --inplace Chicago_CrimeAnalysis.ipynb
```

The notebook has already been run once end to end on this dataset, so it's known to execute cleanly.

## Notebook structure

1. **Data Understanding & Quality Assessment**
   dtypes, temporal coverage, missing-value audit (with a handling strategy per column,
   not just counts), duplicate/ID checks, invalid-coordinate checks, timestamp-rounding
   artifacts, five-number summaries.
2. **Univariate Analysis**
   top crime types, citywide arrest/domestic baselines, year/month/day-of-week/hour
   distributions, District/Ward/Community Area volumes, a geocoded scatter of incident
   locations.
3. **Bivariate & Multivariate Analysis**
   arrest rate by crime type, a day-of-week × hour density heatmap, domestic-incident rate
   by location type, district-level volume vs. arrest-rate comparison, a supporting
   correlation matrix.
4. **Strategic Insights & Recommendations**
   a cell that recomputes the headline numbers directly from your loaded data, followed by
   5 synthesized findings and concrete intervention recommendations, plus a caveats section.

## Key methodology notes

- **Coordinates are never imputed.** Un-geocoded rows (~1.6%) are flagged with a `has_geo`
  column and excluded only from spatial visuals, not from the rest of the analysis — imputing
  a mean lat/long would fabricate a false hot spot.
- **Timestamp precision is treated honestly.** The notebook measures what share of records
  land on an exact on-the-hour or midnight timestamp before drawing any hour-level
  conclusions, since CPD's reporting system rounds many incident times.
- **Arrest-rate comparisons are read through crime mechanics, not enforcement quality.**
  Proactive offenses (narcotics, weapons) structurally clear at higher rates than reactive
  ones (theft, burglary) because the arrest is often part of the incident itself — the
  notebook calls this out explicitly rather than letting the chart imply a performance gap.

## Extending this analysis

- Swap in the full multi-year City of Chicago crime portal export to extend the year range.
- Add a proper basemap (e.g., `contextily` or `folium`) over the existing lat/long scatter for
  a true choropleth/heat map.
- Layer in Census or ACS data by Community Area to normalize incident counts per capita.
