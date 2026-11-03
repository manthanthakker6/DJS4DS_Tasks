# Contributing Guidelines

Thank you for considering contributing to the Chicago Crime Dataset EDA project! To maintain code quality, reproducibility, and analysis accuracy, please follow these guidelines when submitting contributions.

## How to Contribute

1. **Fork & Clone:** Fork the repository and clone it to your local environment.
2. **Environment Setup:** 
   - Create and activate a Python virtual environment (`python3 -m venv venv`).
   - Install required dependencies (`pip install jupyter pandas numpy matplotlib seaborn`).
3. **Branching Strategy:** Create a new feature branch for your changes (`git checkout -b feature/your-feature-name`).
4. **Make Your Changes:** Implement your updates, whether extending the dataset, adding visual overlays, or enhancing analytical models.
5. **Test Notebook Execution:** Ensure the entire Jupyter notebook executes cleanly from top to bottom (`jupyter nbconvert --to notebook --execute --inplace Chicago_CrimeAnalysis.ipynb`).
6. **Submit a Pull Request:** Open a PR against the `main` branch with a clear description of your changes.

---

## Core Analytical Standards

When proposing modifications to the notebook or analysis, please adhere to these methodology principles:

* **No Coordinate Imputation:** Do not attempt to impute missing spatial values (`Latitude`/`Longitude`). Flag un-geocoded records using the existing `has_geo` column and filter them out only during spatial plotting to prevent generating artificial hot spots.
* **Respect Timestamp Precision:** Account for CPD's reporting system rounding artifacts (exact hour and midnight timestamps) before drawing conclusions about temporal distributions.
* **Contextualize Arrest Metrics:** Interpret arrest rates through the mechanics of specific crime categories rather than treating low rates purely as enforcement deficiencies (e.g., proactive vs. reactive offenses).

---

## Suggested Extension Areas

We welcome contributions focused on expanding the scope of the project, including:
* Integrating full multi-year Chicago crime portal datasets.
* Overlaying basemaps (e.g., via `contextily` or `folium`) over geographic scatter plots.
* Incorporating Census/ACS data by Community Area to calculate per-capita crime rates.
