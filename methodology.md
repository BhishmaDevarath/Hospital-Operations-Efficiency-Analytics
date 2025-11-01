# Hospital Operations Efficiency & Resource Utilization — Methodology

**Date:** 2025-11-01

---

## 1. Objective & Scope
Provide a clear, reproducible pipeline that supports descriptive, diagnostic, and predictive analytics for hospital operations. The dataset covers hospital metadata, departments, staffing, admissions, surgeries, resource snapshots, and financials for 2020–2025.

---

## 2. Data Architecture
**Tables & Purpose**  
- `Hospitals`: Master metadata (HospitalID, Region, NumBeds, etc.)  
- `Departments`: Department-level capacity and specialty  
- `Staff`: Employee-level info (role, experience, salary)  
- `Patients`: Demographics  
- `Admissions`: Episode-level records (LOS, AdmissionType, Outcome)  
- `Surgeries`: Procedure-level details (duration, complications)  
- `ResourceUtilizationSnapshots`: Daily/weekly utilization metrics  
- `Financials`: Monthly department revenue & cost

**ER Relationships**: Hospitals → Departments → (Staff, Admissions, ResourceSnapshots, Financials); Patients → Admissions → Surgeries

---

## 3. Data Preparation & Cleaning
- Referential integrity checks (no orphan FK rows).  
- Date logic validation (AdmissionDate <= DischargeDate).  
- Range checks (occupancy/utilization within 0–1; durations positive).  
- Imputation rules: small number of missing numeric values filled with median; missing categorical set to 'Unknown'.

**Figure:** _Data pipeline diagram (placeholder)_

---

## 4. Feature Engineering (examples)
- `LengthOfStay` (admissions) — primary target/metric.  
- `BedOccupancyRate`, `StaffUtilizationRate`, `EquipmentUtilizationRate` — snapshot-derived features.  
- `SurgeriesPerAdmission` (join & count).  
- `ReadmissionFlag` — binary target for readmission modeling.  
- Time features: `AdmissionMonth`, `AdmissionDayOfWeek`, `Season`.

---

## 5. Exploratory Data Analysis
- Distribution analysis (LOS, staff salary, ER wait).  
- Group-level summaries (by hospital, region, department).  
- Time-series aggregation (monthly bed occupancy, monthly revenue).  
- Correlation analysis to identify candidate predictors for modeling.

**Figure:** _Correlation heatmap (placeholder)_

---

## 6. Predictive Efficiency Model Plan (High-level)
**Objectives:**  
- Predict **discharge delay** (binary: delayed vs on-time) or **Length of Stay (LOS)** regression.  
- Predict **readmission probability** (binary classification).  
- Forecast **monthly bed occupancy** (time-series forecasting).

**Modeling pipeline:**  
1. **Data extraction**: Create modeling view `vw_ModelAdmissions` in SQL that aggregates per-admission features (patient demographics, department, surgeon experience, snapshot metrics at or near admission date, rolling averages).  
2. **Feature engineering**: Create ratio features (e.g., `BedsOccupied / Capacity`), interaction terms (`AdmissionType * DeptSpecialty`), and time-decayed utilization metrics.  
3. **Train/Test split**: Time-aware split (train on 2020–2023, validate 2024, test 2025) for forecasting realism.  
4. **Algorithms**: Gradient Boosting (XGBoost / LightGBM) and RandomForest for tabular classification/regression; Prophet or ARIMA/ETS for occupancy forecasting.  
5. **Imbalance handling**: SMOTE or class-weighting for rare outcomes (e.g., readmission if <10%).  
6. **Evaluation metrics**: ROC-AUC, Precision-Recall, LogLoss for classification; RMSE, MAE for regression; MAPE for time-series.  
7. **Explainability**: SHAP for feature importances and partial dependence for critical features.  
8. **Operationalization**: Save models (joblib), create `PredictedAdmissions` table for scores, and schedule monthly scoring pipeline.

**Figure:** _Modeling pipeline diagram (placeholder)_

---

## 7. Assumptions & Limitations
- Synthetic dataset approximates realistic distributions but may not capture all operational edge-cases.  
- Snapshots are periodic and may not capture intraday variability.  
- Financials are simplified; cost allocations assumed proportional to activity.  
- Predictive models assume feature stability and require retraining as operations change.

---

## 8. Reproducibility & Code Organization
Suggested repo structure:
```
/data
/notebooks
/sql
/models
/reports
/docs
/powerbi
```
Key notebooks: `01_EDA_and_Analysis.ipynb`, `02_Predictive_Modeling.ipynb`

---
