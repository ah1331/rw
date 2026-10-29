# Executive Summary & Business Report: Credit Card Fraud Detection Pipeline

**Author:** Junior Data Scientist, Fraud Analytics Team  
**Target Audience:** Risk Management & Analytics Leadership (Paytm / Razorpay)  
**Dataset:** Kaggle Credit Card Fraud Detection Benchmark (50,000 Stratified Sample)

---

### 1. Business Problem & Why Standard Accuracy Fails
In digital payment platforms such as Paytm and Razorpay, millions of payment transactions are authorized daily. Fraudulent activities represent a minuscule fraction—approximately **0.17%** (86 out of 50,000 sampled transactions). Under such severe class imbalance, standard accuracy is a dangerous and deceptive metric. A naive model that categorizes every single transaction as legitimate achieves an outstanding **99.83% accuracy**, yet allows 100% of fraudulent attacks to succeed undetected. Missing even a handful of fraudulent events leads to direct financial chargebacks, hefty regulatory penalties, and reputational damage. Consequently, the fraud analytics team must discard accuracy and ROC-AUC (which presents an overly optimistic picture under extreme imbalance) in favor of **Precision-Recall AUC (PR-AUC)**, **Recall (detection rate)**, and **Precision (false alert control)**.

### 2. Imbalance Handling Strategy
To address the extreme skew, we systematically evaluated three training strategies on the training set while keeping the test set completely pristine:
1. **Original Imbalanced Data with Balanced Class Weights**
2. **Synthetic Minority Over-sampling Technique (SMOTE)** at a 10% minority-to-majority ratio
3. **Random Undersampling** at a 10% ratio

Among linear models, **SMOTE proved superior**, boosting Logistic Regression's precision from 6.49% to 30.91% and F1-score from 0.1219 to 0.4722 while retaining 100% recall. For gradient boosted trees, applying XGBoost's native `scale_pos_weight` ratio ($\approx 578.71$) directly on the training distribution delivered superior discrimination without the synthetic noise or boundary distortion introduced by oversampling.

### 3. Model & Threshold Recommendation
We strongly recommend deploying the **Tuned XGBoost Classifier** (`max_depth=3`, `n_estimators=300`, `learning_rate=0.1`, `subsample=0.6`, `colsample_bytree=0.8`) at an operational decision threshold of **0.20**.

Across all tested models, Tuned XGBoost demonstrated top-tier predictive power:
- **PR-AUC**: **0.9272** (compared to Random Forest at 0.8678 and Logistic Regression at 0.8144).
- **Default Cutoff (0.50)**: Achieves 100% Precision but only 82.35% Recall, failing to catch 3 fraud transactions.
- **Calibrated Cutoff (0.20)**: Elevates Recall to **88.24%** (catching 15 out of 17 frauds) with an **88.24% Precision** (only 2 false alerts).

### 4. Cost-Benefit Result (Per 50,000 Transactions)
Using realistic fintech unit economics—**₹4,500 average loss per fraudulent transaction** and **₹150 human investigation cost per flagged alert**:
- At threshold 0.50, the model saves ₹63,000 in fraud loss but leaves ₹13,500 on the table, yielding a net benefit of ₹60,900 on the test split.
- At threshold 0.20, the model saves ₹67,500 with ₹2,550 investigation cost, producing a **Net Benefit of ₹64,950** (+₹4,050 net advantage).

Extrapolated to the full **50,000 transaction cohort**, our tuned pipeline successfully captures ~75 fraudulent events, generating approximately **₹3,24,750 in Net Financial Savings** after accounting for analyst overhead. This proves that the business-optimal threshold (0.20) is substantially lower than default statistical thresholds because catching a ₹4,500 fraud easily offsets the ₹300 cost of reviewing two false positives.

### 5. Production Deployment & Architecture Roadmap
For real-world deployment into Paytm's payment gateway, we propose:
1. **Low-Latency Inference Engine**: Package the serialized `scikit-learn Pipeline` (`fraud_detection_model.pkl`) into an asynchronous FastAPI microservice container with sub-30ms P99 latency.
2. **Real-Time Streaming Architecture**: Ingest transactions via Apache Kafka, fetch rolling customer velocity metrics via Redis, and score fraud probabilities in-flight.
3. **Model Drift & Data Quality Monitoring**: Implement Evidently AI / Prometheus to monitor Population Stability Index (PSI) and concept drift across seasonal payment spikes.
4. **Active Learning Feedback Loop**: Stream fraud analyst verification outcomes and cardholder chargeback disputes back into a daily retraining pipeline to continuously adapt decision thresholds.

