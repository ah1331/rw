# 🩺 Patient Health Records Cleanser & Data Profiling (DPFE - PR2)

This module contains the complete data cleaning, missing value imputation, outlier handling, data profiling, and evaluation reports for the **Patient Health Records** dataset (`patient_health_records_1000_rows.csv`).

---

## 📌 Deliverables & Project Files

- 📓 **[data_cleanser.ipynb](data_cleanser.ipynb)**: Primary Jupyter Notebook executing all assignment tasks in Part A, Part B, and Part C.
- 📊 **[data_profiling_report.html](data_profiling_report.html)**: Interactive YData Profiling HTML Report.
- 📄 **[Part_C_Question_7_Report.pdf](Part_C_Question_7_Report.pdf)**: Evaluation PDF Report.
- 💾 **[patient_health_records_1000_rows.csv](patient_health_records_1000_rows.csv)**: Input dataset (1,000 patient records).

---

## 📑 Detailed Breakdown of Assignment Tasks

### 🔹 Part A: Handling Missing Values

* **Task 1 — Missing Data Analysis & Percentage Summary**:
  * Calculated total missing values and column-wise missing percentages (`bmi`: 4.0%, `age`: 3.0%, `cholesterol`: 3.0%, `glucose`: 3.0%, `gender`: 2.0%, `region`: 2.0%).
* **Task 2 — Imputation Strategies Implementation & Comparison**:
  * **Simple Imputer (Numerical)**: Replaced missing `bmi` entries with mean and median baseline values.
  * **Most Frequent Imputation (Categorical)**: Imputed missing `gender` and `region` entries using the mode value to preserve valid categories.
  * **Missing Indicator + Random Sampling**: Created a binary missingness flag (`bmi_missing`) and filled missing `bmi` values via random sampling from observed non-null data.
  * **KNN Imputer ($k=5$)**: Imputed numerical features (`age`, `bmi`, `cholesterol`, `glucose`) based on patient similarity distance metrics.
  * **MICE Algorithm (IterativeImputer)**: Applied multivariate linear regression chained equations to model inter-variable dependencies among correlated features.

---

### 🔹 Part B: Handling Outliers

* **Task 3 — Outlier Detection & Removal Methods**:
  * **Z-Score Method ($|Z| > 3$)**: Identified and removed extreme measurement spikes in `glucose` ($> 400 \text{ mg/dL}$).
  * **IQR Method ($1.5 \times IQR$)**: Filtered severe low/high `bmi` outliers falling outside $Q1 - 1.5 \cdot IQR$ and $Q3 + 1.5 \cdot IQR$ bounds.
  * **Percentile Method (1st & 99th)**: Capped extreme low and high `cholesterol` values to 1st and 99th percentile limits.
* **Task 4 — Winsorization Technique**:
  * Applied 5% Winsorization (`limits=[0.05, 0.05]`) on `blood_pressure` to cap extreme systolic values to 5th and 95th percentiles without dropping patient records.
* **Task 5 — Before vs After Comparison**:
  * Analyzed changes in overall dataset dimensions (shape before vs after) and descriptive statistics (`mean`, `std`, `min`, `max`, `quartiles`).

---

### 🔹 Part C: Final Clean Dataset & Evaluation Report

* **Task 6 — Final Clean Dataset Presentation**:
  * Assembled the clean, zero-NaN dataset where missing entries are imputed and extreme outliers are capped for downstream machine learning.
* **Task 7 — Brief Evaluation Report**:
  1. **Most Effective Imputation Strategy**: **MICE (IterativeImputer)** for numerical features (preserves inter-column correlations) and **Mode Imputation** for categorical variables.
  2. **Best Outlier Handling Method**: **Winsorization & Percentile Capping** preserved data quality best by capping noise without dropping patient records ($N=1000$).
  3. **Usability Improvements**: Prevents NaN model execution crashes, eliminates gradient explosion, and improves heart disease risk (`disease_risk`) classification accuracy.
* **Data Profiling**:
  * Generated and exported an interactive HTML Data Profiling report (**[data_profiling_report.html](data_profiling_report.html)**) using YData Profiling.

---

# 👨‍💻 Author

**Ansh Patoliya**

**B.Tech Student | Data Analyst | AI/ML Enthusiast**

---

# ⭐ If you found this project useful, don't forget to Star ⭐ the repository!