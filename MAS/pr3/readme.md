# 📊 Spread Locator: A Statistical Distribution Analysis Model


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

* Statistical Distribution
* Q-Q Plot
* Discrete vs Continuous Distribution
* Bernoulli Distribution
* Binomial Distribution
* Log-Normal Distribution
* Power Law Distribution
* Poisson Distribution
* Box-Cox Transformation
* Z-score Probability
* Probability Density Function (PDF)
* Cumulative Distribution Function (CDF)

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
