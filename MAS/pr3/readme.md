# 📊 Spread Locator: A Statistical Distribution Analysis Model

## 📂 Project Files

| File | Description |
|------|-------------|
| 📊 **Dataset** | [spread_locator_dataset.xlsx](spread_locator_dataset.xlsx) |
| 📓 **Practical Notebook** | [pr3.ipynb](pr3.ipynb) |
| 📘 **Theory PDF** | [Theoretical-Foundation.pdf](Theoretical-Foundation.pdf) |
| 📄 **README** | Project Documentation |
---
# 📖 Project Overview

**Spread Locator** is a statistical analysis project that explores customer transaction behavior using various probability distributions and statistical techniques.

The objective is to identify the distribution that best represents transaction data, analyze data spread, detect skewness, perform statistical transformations, and derive business insights for better decision-making.

---

# 🎯 Objective

The project focuses on applying advanced statistical concepts to a real-world e-commerce transaction dataset.

The analysis includes:

* Understanding probability distributions
* Testing data normality
* Performing statistical transformations
* Computing probabilities
* Comparing theoretical and observed distributions
* Drawing meaningful business insights

---

# 📂 Dataset Information

| Column             | Description               |
| ------------------ | ------------------------- |
| transaction_id     | Unique Transaction ID     |
| customer_id        | Unique Customer ID        |
| transaction_amount | Total Purchase Amount (₹) |
| transaction_date   | Transaction Date          |
| transaction_count  | Weekly Transaction Count  |
| region             | Customer Region           |
| transaction_status | Success / Fail            |

---

# 📚 Theoretical Concepts Covered

## Statistical Distribution
<img width="1716" height="843" alt="image" src="https://github.com/user-attachments/assets/9a831ba0-f303-43e5-921a-b11ad78d5b7f" />


## Q-Q Plot
<img width="1750" height="1330" alt="image" src="https://github.com/user-attachments/assets/6f9312dd-d343-4081-9a88-4cb5012f2389" />

## Discrete vs Continuous Distribution
<img width="2209" height="1506" alt="image" src="https://github.com/user-attachments/assets/69df1d55-6853-4ce5-bbf9-d134de6db85d" />

## Bernoulli Distribution
<img width="2068" height="953" alt="image" src="https://github.com/user-attachments/assets/41c382a7-3d28-42f5-8906-1374a87356bd" />

## Binomial Distribution
<img width="1796" height="1269" alt="image" src="https://github.com/user-attachments/assets/f268ac0d-8915-4311-b296-6b3d5ebd1c2e" />


## Log-Normal Distribution
<img width="1608" height="1170" alt="image" src="https://github.com/user-attachments/assets/1a56557a-9916-4df0-89c0-7bc2e0250f02" />

## Power Law Distribution
<img width="1344" height="935" alt="image" src="https://github.com/user-attachments/assets/58469de1-d3ce-45bb-b219-72488c5d9e72" />

## Poisson Distribution
<img width="817" height="1071" alt="image" src="https://github.com/user-attachments/assets/3d5aeed4-3482-4232-b6a1-7704a3d3bb2e" />


## Box-Cox Transformation
<img width="1104" height="686" alt="image" src="https://github.com/user-attachments/assets/b193bd3d-b156-4bbb-ab7d-671ba4e63796" />

## Z-score Probability
<img width="1848" height="1569" alt="image" src="https://github.com/user-attachments/assets/0fb89686-8ae4-4ddb-b214-0485a59c1422" />

## Probability Density Function (PDF) And Cumulative Distribution Function (CDF)
<img width="2209" height="1497" alt="image" src="https://github.com/user-attachments/assets/9abf2260-0f72-4777-9774-64fd1363a358" />


---

# 📈 Practical Tasks Performed

## ✅ 1. Bernoulli Distribution

* Converted transaction status into binary values
* Estimated probability of successful transactions
* Fitted Bernoulli Distribution

---

## ✅ 2. Binomial Distribution

* Modeled weekly transaction counts
* Compared observed counts with theoretical Binomial PMF

---

## ✅ 3. Poisson Distribution

* Calculated daily transaction frequency
* Estimated λ (average daily transactions)
* Compared observed and theoretical Poisson distribution

---

## ✅ 4. Log-Normal Distribution

* Modeled transaction amounts
* Estimated distribution parameters
* Compared histogram with fitted Log-Normal curve

---

## ✅ 5. Power Law Distribution

* Tested whether transaction amounts follow a heavy-tailed distribution
* Estimated Power Law parameters

---

## ✅ 6. Q-Q Plot

* Generated Quantile-Quantile Plot
* Evaluated normality of transaction amounts

---

## ✅ 7. Box-Cox Transformation

* Reduced skewness
* Stabilized variance
* Improved approximation to Normal Distribution

---

## ✅ 8. Z-score Analysis

* Computed Z-scores
* Detected outliers
* Calculated probability of transactions exceeding ₹5000

---

## ✅ 9. PDF & CDF

Generated:

* Probability Density Function (PDF)
* Cumulative Distribution Function (CDF)

for transaction amounts.

---

# 📊 Visualizations

The project includes:

* Bernoulli Distribution Plot
* Binomial Distribution Plot
* Poisson Distribution Plot
* Log-Normal Distribution Fit
* Power Law Distribution Plot
* Q-Q Plot
* Box-Cox Transformation Comparison
* Histogram
* PDF Plot
* CDF Plot
* Z-score Distribution

---

# 🛠️ Technologies Used

* Python
* NumPy
* Pandas
* SciPy
* Statsmodels
* Matplotlib
* Seaborn
* Jupyter Notebook



# 📌 Key Statistical Insights

* Transaction status naturally follows a **Bernoulli Distribution**.
* Weekly transaction counts can be modeled using a **Binomial Distribution**.
* Daily transaction frequency is well suited for a **Poisson Distribution**.
* Transaction amounts generally exhibit **Log-Normal** characteristics due to positive values and right skewness.
* High-value transactions indicate a **Power Law** or heavy-tailed behavior.
* Q-Q Plot helps determine whether data follows a Normal Distribution.
* Box-Cox Transformation reduces skewness and improves statistical modeling.
* Z-score analysis identifies unusual transactions and potential outliers.
* PDF and CDF provide probability-based interpretations of transaction amounts.

---

# 🎓 Learning Outcomes

After completing this project, you will understand:

* Probability distributions
* Distribution fitting
* Data normalization
* Statistical transformations
* Probability calculations
* Outlier detection
* Distribution comparison
* Practical statistical analysis using Python

---

# 👨‍💻 Author

**Ansh Patoliya**

**B.Tech Student | Data Analyst | AI/ML Enthusiast**

---

# ⭐ If you found this project useful, don't forget to Star ⭐ the repository!
