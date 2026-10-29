# Credit Card Fraud Detection — Imbalanced Classification with Threshold Optimisation


## 📌 Project Overview
In digital payment platforms (such as **Paytm**, **Razorpay**, or **PayPal**), processing millions of transactions daily comes with extreme security challenges. Financial fraud represents only **0.17%** of transactions, creating an extreme class imbalance benchmark. A standard classifier predicting all transactions as legitimate would report 99.83% accuracy while failing 100% of the fraud cases, leading to lakhs of rupees in chargeback penalties and customer dissatisfaction.

This project delivers an end-to-end Machine Learning pipeline:
- Rigorous exploratory data analysis (EDA) examining transaction amounts, hours of day, and PCA feature distributions.
- Advanced imbalance remediation comparing Balanced Class Weights, SMOTE oversampling, and Random Undersampling.
- Supervised learning with Logistic Regression, Random Forest, and tuned XGBoost.
- Precision-Recall curve evaluation and business-calibrated decision threshold optimization.
- Financial cost-benefit simulation quantifying actual net rupee savings.
- Packaging into a production-ready `scikit-learn Pipeline` saved as `fraud_detection_model.pkl`.

---

## 📊 Dataset
The dataset used is the industry-standard **Kaggle Credit Card Fraud Detection Dataset**:
- **Source**: [Kaggle Credit Card Fraud Detection Dataset](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
- **Total Transactions**: 284,807
- **Fraudulent Transactions**: 492 (0.172%)
- **Features**: 28 anonymized PCA features (`V1`–`V28`), plus `Time`, `Amount`, and target `Class`.
- **Sample Used**: 50,000 stratified rows preserving the 0.17% fraud prevalence.

---

## 🎯 Key Results & Optimal Threshold

### Model Comparison Table (Test Set: 10,000 transactions)

| Model | Threshold | Precision (Fraud) | Recall (Fraud) | F1-Score (Fraud) | PR-AUC |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Logistic Regression (SMOTE)** | 0.50 | 0.3091 | 1.0000 | 0.4722 | 0.8144 |
| **Random Forest (SMOTE)** | 0.50 | 0.8667 | 0.7647 | 0.8125 | 0.8678 |
| **XGBoost Baseline** | 0.50 | 1.0000 | 0.8235 | 0.9032 | 0.8968 |
| **XGBoost Tuned (Default)** | 0.50 | 1.0000 | 0.8235 | 0.9032 | 0.9272 |
| **XGBoost Tuned (F1-Optimal)** | 0.8805 | 1.0000 | 0.8235 | 0.9032 | 0.9272 |
| **XGBoost Tuned (Recommended)** | **0.20** | **0.8824** | **0.8824** | **0.8824** | **0.9272** |
| **XGBoost Tuned (Recall ≥ 0.90)** | 0.0041 | 0.4444 | 0.9412 | 0.6038 | 0.9272 |

### 💡 Optimal Decision Threshold: `0.20`
- **Why 0.20?** While the default 0.50 threshold catches 14/17 frauds with 0 false alarms, lowering the threshold to **0.20** captures **15 out of 17 frauds** (Recall: 88.24%) with only 2 false alerts (Precision: 88.24%).
- **Business Cost-Benefit Justification**:
  - Caught fraud saves: **₹4,500**
  - Analyst alert investigation cost: **₹150**
  - Moving threshold from 0.50 to 0.20 catches 1 extra fraud (+₹4,500) at a cost of only 2 extra false alarms (-₹300), generating an incremental **+₹4,200** net financial advantage.
  - Generates **₹64,950** Net Benefit on the test set and **~₹3,24,750** per 50,000 transactions.

---

