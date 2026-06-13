# Derivable Judgement

## Project Objective
A statistical decision-making model that uses inferential statistics to evaluate hypotheses about factors affecting disease occurrence (Diabetes, Hypertension) using public health data.

## Dataset
File: `health_data.csv` (200 records)

| Field | Description |
|---|---|
| `record_id` | Unique identifier for each health record |
| `age_group` | Age group category (18-25, 26-35, 36-45, 46-60, 60+) |
| `age` | Age of individual |
| `weight` | Weight of individual |
| `gender` | Male / Female / Other |
| `region` | North / South / East / West |
| `smoking_status` | Smoker / Non-Smoker / Former Smoker |
| `exercise_frequency` | Daily / Weekly / Rarely / Never |
| `bmi` | Body Mass Index |
| `blood_pressure` | Systolic blood pressure (mmHg) |
| `diabetes` | True / False |
| `hypertension` | True / False |
| `cholesterol_level` | Total cholesterol (mg/dL) |
| `glucose_level` | Fasting glucose (mg/dL) |
| `visit_date` | Date of check-up |

## Tasks Covered

**Part A — Theoretical Foundation**
- Inferential Statistics
- Hypothesis Testing & its Components
- Confidence Interval & Critical Value
- p-value
- Type I vs Type II Errors
- z-test, t-test, Chi-square test, ANOVA
- Covariance & Correlation

**Part B — Data Analysis & Testing**
- Hypothesis formulation (Smoking vs Diabetes)
- Confidence Intervals (Age, BMI)
- Z-test (Diabetes proportion)
- T-test (BMI: Smokers vs Non-Smokers)
- Chi-square test (Smoking vs Diabetes)
- ANOVA (Blood Pressure across Age Groups)
- Covariance & Correlation (Age vs BMI)
- Result interpretation (Accept/Reject H₀) for each test

## Tools Used
- Python (NumPy, Pandas, SciPy, Statsmodels)