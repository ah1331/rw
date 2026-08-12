# 🛒 Customer Purchase Behavior Analyzer
> **Practical Exam Submission:** Data Preprocessing & Feature Engineering Pipeline

---

## 📌 Project Overview
This project presents an end-to-end Python data preprocessing and feature engineering pipeline designed to analyze customer purchasing behavior across multi-format data sources (CSV, JSON, and SQL). The primary objective is to clean, transform, engineer features, and merge heterogeneous raw datasets into a high-quality dataset (`final_cleaned_dataset.csv`) suitable for downstream analytics, customer segmentation, and predictive machine learning tasks.

---

## 📊 Dataset Descriptions
The project integrates three distinct datasets:

| Dataset | Source Format | Description | Key Attributes |
| :--- | :--- | :--- | :--- |
| `users.csv` | **CSV** | Customer demographic and registration metadata | `user_id`, `name`, `age`, `gender`, `registration_date` |
| `sales.json` | **JSON** | Daily customer purchase transaction logs | `transaction_id`, `user_id`, `product_id`, `amount`, `payment_type`, `date` |
| `inventory.sql` / `products.db` | **SQL** | Product catalog data loaded via SQLite | `product_id`, `product_name`, `category`, `price`, `stock` |

---

## 📁 Repository Structure
```
final_ex/
├── README.md                   
├── main.ipynb                  
├── users.csv                   
├── sales.json                  
├── inventory.sql               
├── products.db                 
├── final_cleaned_dataset.csv   
└── final_eda_report.html       
```

---

## 🪜 Pipeline & Step-by-Step Implementation

### Step 1: Data Understanding & Loading
- **Multi-Source Ingestion:** Ingested CSV data via `pd.read_csv('users.csv')`, JSON transaction records via `json.load('sales.json')`, and SQL relational product catalog via `sqlite3` execution on `inventory.sql` (`products.db`).
- **Inspection:** Displayed top 5 records, inspected metadata schema using `.info()`, `.head()`, and identified data types, missing values, and inconsistent date/numeric records.

### Step 2: Data Cleaning & Missing Value Imputation
- **Numerical Missing Values:** Imputed missing values in numerical features (e.g. `age`) using `SimpleImputer(strategy='mean')`.
- **Categorical Missing Values:** Handled missing categorical values using `SimpleImputer(strategy='most_frequent')`.
- **Multivariate Imputation:** Implemented `KNNImputer` for handling complex feature relationships.
- **Inconsistent Entry Correction:** Converted date strings to proper `datetime64` types (`pd.to_datetime`), rectified invalid values (negative prices/amounts), and sanitized categorical records.

### Step 3: Outlier Handling
- **Z-Score Method:** Computed Z-scores ($\sigma = 3$) to filter out severe univariate outliers.
- **IQR Method:** Computed Interquartile Range thresholds ($Q_1 - 1.5 \times IQR$ to $Q_3 + 1.5 \times IQR$).
- **Winsorization:** Applied SciPy `winsorize` to cap extreme upper and lower tail values without discarding critical transaction rows.
- **Comparative Selection:** IQR & Winsorization were chosen over strict Z-score removal for financial transaction metrics (`amount`, `price`) to prevent sample loss while maintaining model robustness.

### Step 4: Data Transformation & Encoding
- **Date Feature Extraction:** Decomposed datetime features into `reg_day`, `reg_month`, `reg_year`, `purchase_day`, `purchase_month`, and `purchase_year`.
- **Categorical Encoding:**
  - *Binary Encoding:* Encoded binary demographic variables (`gender`).
  - *One-Hot Encoding:* Encoded nominal payment channels (`payment_type`).
  - *Ordinal Encoding:* Used `OrdinalEncoder` for ordered categorical values.
- **Customer Segmentation Binning:** Binned customer spend into spending tiers (`Low`, `Medium`, `High`).
- **Skewness Normalization:** Applied Log Transformation (`np.log1p`) and Square Root Transformation (`np.sqrt`) to normalize right-skewed payment distribution.

### Step 5: Feature Scaling
- Standardized and scaled numerical features (`amount`, `amount_log`, `amount_sqrt`) using both `StandardScaler` (zero mean, unit variance) and `MinMaxScaler` (bounded between 0 and 1).
- Generated pre- and post-scaling summary statistics to confirm normalization effects.

### Step 6: Feature Construction (Engineering)
Engineered core domain features essential for customer behavior modeling:
1. **Average Monthly Spend (`avg_monthly_spend`):** Mean spend per user computed across transaction months.
2. **Purchase Frequency (`purchase_frequency`):** Total transaction count per customer.
3. **Days Since Last Purchase (`days_since_last_purchase`):** Customer recency metric calculated against dataset boundary date.
4. **Category Total Expenditure (`category_total_expenditure`):** Category-wise aggregated transaction expenditure.

### Step 7: Final Dataset Preparation & Output
- Merged cleaned demographic (`users.csv`), transaction (`sales.json`), and product catalog (`inventory.sql`) datasets using relational left joins on `user_id` and `product_id`.
- Exported the complete 20-feature dataset to `final_cleaned_dataset.csv`.

### Step 8: Automated EDA Report
- Utilized `ydata_profiling.ProfileReport` to auto-generate `final_eda_report.html` for comprehensive exploratory data analysis, interactive correlations, and distribution profiling.

---

## 📈 Pipeline Summary & Statistics

| Metric | Before Cleaning | After Cleaning / Processing |
| :--- | :--- | :--- |
| **Total Transaction Records** | 4,165 | 4,165 (clean & complete) |
| **Feature Count** | 6 (raw sales fields) | 20 (engineered & merged attributes) |
| **Missing Values** | Present in `age`, `gender`, `category` | **0** (100% Imputed) |
| **Outliers Handled** | Heavy right skew in `amount` | Capped & Winsorized |

---

## 📝 Summary Report (Theory & Observations)

### 1. Imputation Strategy Evaluation
- **Mean Imputation:** Ideal for symmetric numerical features (`age`).
- **Mode Imputation:** Effective for categorical variables with clear dominant categories.
- **KNN Imputation:** Useful when missing values depend conditionally on multiple feature interactions.

### 2. Outlier Technique Comparison
- **Z-Score Method** assumes Gaussian distribution; ineffective when data is heavily skewed.
- **IQR Method** is robust against heavy skewness.
- **Winsorization** is optimal for transaction data as it retains sample size while bounding extreme values.

### 3. Transformation & Scaling Impact
- Log transformation successfully reduced skewness, compressing large monetary values to approximate normal distribution for downstream algorithms.
- `StandardScaler` prepares data for variance-based models (PCA, Linear Regression), whereas `MinMaxScaler` prepares data for distance metrics (KNN, Clustering).

---


## 📄 Deliverables Checklist
- [x] **`main.ipynb`** - Main executable Jupyter Notebook
- [x] **`final_cleaned_dataset.csv`** - Final cleaned and engineered dataset
- [x] **`final_eda_report.html`** - Interactive EDA report generated via YData Profiling
- [x] **`README.md`** - Full technical documentation & summary report
