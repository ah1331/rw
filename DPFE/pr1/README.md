# 📊 Data Profiler: Data Preprocessing, Data Acquisition & Profiling

Welcome to the **Data Profiler** project repository! This repository contains the complete implementation of theoretical data science fundamentals, multi-source data acquisition, data cleaning, exploratory data analysis (EDA), and automated data profiling for customer churn analysis as executed in [`data_profiler.ipynb`](data_profiler.ipynb) and documented in [`theory/Part_A_Fundamentals.pdf`](theory/Part_A_Fundamentals.pdf).

---

## 🎯 Objectives
The primary objective of this project is to cover foundational Data Science & ML concepts, perform **Data Acquisition**, **Understanding**, **Cleaning**, **Exploratory Data Analysis (EDA)**, and **Automated Data Profiling** on a multi-source customer dataset to make it machine learning-ready.

* **Theory & Problem Framing**: Explore Data Analysis definitions, Data Science lifecycle steps, frame Machine Learning binary classification for customer churn, and examine Tensors in NumPy.
* **Multi-Source Data Ingestion**: Import data from 4 distinct formats: **CSV**, **JSON**, **SQL Database (SQLite)**, and **REST API**.
* **Initial Exploration**: Inspect raw dataset structures using `.head()`, `.info()`, `.describe()`, missing value checks, and duplicate row detection.
* **Data Cleansing**: Impute missing values in feature columns (`Age` and `Income`) and drop duplicate records.
* **Visual EDA**: Conduct Univariate (histograms with KDE), Bivariate (box plots), and Multivariate (correlation heatmap and pair plots) analysis using Seaborn & Matplotlib.
* **Automated Data Profiling**: Generate an interactive HTML summary report using `ydata-profiling`.

---

## 🛠️ Tech Stack & Libraries
* **Python 3.x**
* **Jupyter Notebook** (interactive execution environment)
* **Pandas**: Structured data manipulation (`pd.read_csv`, `pd.read_sql`, `fillna`, `drop_duplicates`, `isnull`, `describe`, `info`).
* **NumPy**: Tensor representations and numerical vector operations (`np.array`, scalar/vector/matrix/tensor rank operations).
* **JSON**: Parsing semi-structured JSON files (`json.load`).
* **SQLite3**: Database connection and SQL querying (`sqlite3.connect`).
* **Requests**: Extracting external web records over HTTP REST APIs (`requests.get`).
* **Matplotlib & Seaborn**: Statistical data visualizations (`histplot`, `boxplot`, `heatmap`, `pairplot`).
* **ydata-profiling**: Automated data profiling report generation (`ProfileReport`).

---

## 📂 Project Workflow & Core Tasks

### 📘 Part A: Fundamentals (Tasks 1, 2, 3 & 4)

#### 1. What is Data Analysis? (Task 1)
Data Analysis is the systematic process of inspecting, cleansing, transforming, and modeling raw data with the goal of discovering useful information, informing conclusions, and supporting strategic decision-making in businesses and organizations.

#### 2. Planning a Data Science Project (Task 2)
An end-to-end Data Science project follows seven core sequential steps:
1. **Problem Definition & Business Understanding**: Articulate business goals, define metrics (KPIs), and determine expected outcomes.
2. **Data Acquisition & Ingestion**: Collect structured, semi-structured, and unstructured data from databases, files, and web APIs.
3. **Data Preparation & Cleaning**: Clean missing values, handle duplicates, correct datatypes, and resolve data anomalies.
4. **Exploratory Data Analysis (EDA)**: Perform statistical and visual explorations (univariate, bivariate, and multivariate) to uncover patterns, anomalies, and feature interactions.
5. **Feature Engineering & Selection**: Transform raw attributes into high-value predictive features, handle scaling, and encode categoricals.
6. **Machine Learning Modeling & Evaluation**: Train, validate, and evaluate algorithms using appropriate evaluation metrics (Accuracy, Precision, Recall, F1-Score, ROC-AUC).
7. **Deployment, Monitoring & Maintenance**: Serve models via REST APIs or containerized applications and continuously monitor model performance and data drift.

#### 3. Framing the Machine Learning Problem Statement (Task 3)
* **Objective**: Predict customer churn based on multi-source purchase behavior.
* **Problem Type**: **Supervised Binary Classification**.
* **Target Variable ($y$)**: Binary outcome where:
  $$y = \begin{cases} 1 & \text{Customer Churns (Leaves service)} \\ 0 & \text{Customer Retained (Stays active)} \end{cases}$$
* **Feature Set ($X$)**: Demographics (`Age`, `Gender`), Financial Metrics (`Income`), Transaction Attributes (`Purchases`), Payment Preference, and Membership Tier.

#### 4. Explanation of Tensors with NumPy Examples (Task 4)
A **Tensor** is a mathematical object that generalizes scalars, vectors, and matrices to higher dimensions (ranks).
* **Scalar ($0$-D Tensor)**: A single number with rank $0$ (e.g., `np.array(42)`).
* **Vector ($1$-D Tensor)**: A $1$-dimensional array of numbers with rank $1$ (e.g., `np.array([25, 50000, 18])`).
* **Matrix ($2$-D Tensor)**: A $2$-dimensional grid of rows and columns with rank $2$ (e.g., a DataFrame grid of samples $\times$ features).
* **$3$-D / Higher-Order Tensor**: A $3$-dimensional array of matrices with rank $3+$ (e.g., color image RGB matrices or time-series sequence data).

---

### 📥 Part B: Data Acquisition (Task 5)

Ingested datasets from four distinct data channels:
1. **CSV Ingestion**: Loaded primary customer demographic data (`data/customer_data.csv`) into a Pandas DataFrame `df_csv`.
2. **JSON Parsing**: Parsed extra customer payment and membership attributes (`data/customer_extra.json`) using Python's native `json.load()`.
3. **SQL Querying**: Connected to SQLite database (`data/customer_orders.db`) via `sqlite3.connect()` and fetched transaction records using `pd.read_sql("SELECT * FROM customer_orders", conn)`.
4. **REST API Fetching**: Retrieved live user profile metadata from DummyJSON API endpoint (`https://dummyjson.com/users`) using `requests.get()`.

---

### 🧹 Part C: Data Understanding & Cleaning (Tasks 6 & 7)

#### 1. Initial Exploration (Task 6)
* **Preview Data**: Displayed top rows using `df_csv.head()`.
* **Structural Summary**: Checked schema, column dtypes, and memory footprint using `df_csv.info()`.
* **Summary Statistics**: Generated distribution stats for numerical columns via `df_csv.describe()`.
* **Missing Value Check**: `df_csv.isnull().sum()` identified:
  * `Age`: **5** missing values
  * `Income`: **58** missing values
* **Duplicate Detection**: `df_csv.duplicated().sum()` detected **1** duplicate row.

#### 2. Data Cleaning (Task 7)
* **Missing Data Imputation**:
  * Imputed missing values in `Age` using the column mean:
    ```python
    df_csv['Age'].fillna(df_csv['Age'].mean(), inplace=True)
    ```
  * Imputed missing values in `Income` using the column median:
    ```python
    df_csv['Income'].fillna(df_csv['Income'].median(), inplace=True)
    ```
* **Deduplication**: Removed the duplicate entry from `df_csv`:
  ```python
  df_csv.drop_duplicates(inplace=True)
  ```

---

### 📈 Part D: Exploratory Data Analysis (Tasks 8, 9 & 10)

#### 1. Univariate Analysis (Task 8)
Visualized individual variable distributions using Seaborn `histplot` with Kernel Density Estimation (`kde=True`):
* **Age Distribution**: Examined age spread across customers.
* **Income Distribution**: Analyzed income levels and skewness across the customer base.
* **Purchases Distribution**: Plotted frequency distribution of total customer purchases.

#### 2. Bivariate Analysis (Task 9)
Visualized feature interactions across categorical and target variables using Seaborn `boxplot`:
* **Gender vs. Purchases**: Evaluated purchase behavior across gender categories (`x='Gender'`, `y='Purchases'`).
* **Income vs. Churn**: Plotted distribution of customer income against binary churn status (`x='Churn'`, `y='Income'`).

#### 3. Multivariate Analysis (Task 10)
Analyzed interactions among multiple numerical variables (`Age`, `Income`, `Purchases`, `Churn`):
* **Correlation Heatmap**: Computed Pearson correlation matrix and rendered a styled heatmap (`annot=True`, `cmap='coolwarm'`):
  ```python
  sns.heatmap(df_csv[['Age', 'Income', 'Purchases', 'Churn']].corr(), annot=True, cmap='coolwarm')
  ```
* **Pair Plot Matrix**: Visualized pairwise feature relationships hue-mapped by churn outcome:
  ```python
  sns.pairplot(df_csv[['Age', 'Income', 'Purchases', 'Churn']], hue='Churn')
  ```

---

### 📋 Part E: Automated Data Profiling (Task 11)
Generated a comprehensive, interactive HTML Data Profiling Report using `ydata-profiling`:
```python
from ydata_profiling import ProfileReport
profile = ProfileReport(df_csv, title="Data Profiling Report", explorative=True)
profile.to_file("data_profiling_report.html")
```
The resulting report summarizes:
* Dataset statistics (**8** variables, **100** observations, **0%** missing cells post-cleaning).
* Variable distribution properties, quantiles, and interaction scatter plots.
* Multi-method correlation matrices (Pearson, Spearman, $\phi_k$).
* Data quality warnings (e.g., uniform distribution flags on unique identifier columns `CustomerID` and `Name`).

---

## 📁 Repository Deliverables

* **[`data_profiler.ipynb`](data_profiler.ipynb)**: Complete Python notebook containing all executed cells, code, output streams, and plots.
* **[`theory/Part_A_Fundamentals.pdf`](theory/Part_A_Fundamentals.pdf)**: Comprehensive theory PDF covering Data Analysis concepts, Data Science project roadmap, Churn prediction framing, and Tensor mathematical definitions.
* **[`README.md`](README.md)**: Detailed project documentation following standard repository format.
* **`data/`**: Subdirectory containing raw data assets (`customer_data.csv`, `customer_extra.json`, `customer_orders.db`).
* **`data_profiling_report.html`**: Exported interactive HTML report summarizing dataset profiling metrics.
