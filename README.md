# 🏥 Hospital Operations Efficiency & Resource Utilization

## 📘 Overview
This project provides a comprehensive analysis of hospital operations using a structured SQL database, Python-based data analytics, and Power BI dashboards.  
It evaluates **efficiency, resource utilization, staffing performance, and financial health** across multiple hospitals and departments.

---

## 🎯 Objectives
- Identify inefficiencies in hospital operations through data-driven insights.  
- Measure and optimize **Bed Occupancy**, **Equipment Utilization**, **Staff Workload**, and **Patient Outcomes**.  
- Provide executives with clear visibility into KPIs via Power BI dashboards.  
- Develop a **predictive model framework** for workload forecasting and efficiency scoring.

---

## 🧩 Data Model
The SQL database consists of **10 core tables**:

| Table | Description |
|--------|-------------|
| Hospitals | Basic hospital info, region, and ownership |
| Departments | Department capacity and specialty |
| Staff | Doctors, nurses, technicians, and admins |
| Patients | Demographics and insurance coverage |
| Admissions | Patient admissions, outcomes, and readmissions |
| Surgeries | Surgical performance and complications |
| ResourceUtilizationSnapshots | Daily bed/equipment/staff utilization |
| Financials | Cost, billing, and profit metrics |
| … | Linked via foreign keys for integrity |

---

## 🧠 Analytical Pipeline
1. **SQL Data Validation & Integrity Checks**  
   - Ensured no orphan records, consistent relationships, and realistic value ranges.

2. **Python EDA (Exploratory Data Analysis)**  
   - Libraries: `pandas`, `numpy`, `matplotlib`  
   - Uncovered regional disparities, staff-to-patient ratios, and financial performance trends.

3. **Power BI Dashboards**  
   - KPIs: Bed Occupancy %, Equipment Utilization %, Readmission Rates, Profit Margins  
   - Pages: *Operational Efficiency*, *Clinical Outcomes*, *Financial Insights*

4. **Predictive Modeling Plan (Next Phase)**  
   - Efficiency Prediction Model using regression/classification approaches.  
   - Inputs: Staffing levels, admission volume, utilization rates, financial margins.  
   - Outputs: Department-level efficiency scores and workload forecasts.

---

## 📊 Key Insights (from SQL + Python)
- Average Bed Occupancy: **59.7%** | Equipment Utilization: **52.5%**  
- Average Readmission Rate: **8.04%** across hospitals.  
- Profit Margin averages **14.8%**, strongly correlated with resource utilization efficiency.  
- Most common admission outcome: **Recovered (95%)**.  
- **Nurses** make up ~50% of total staff, with average experience ~6 years.  

*(See `docs/insights_summary.md` for detailed analysis.)*

---

## 🧮 Tools & Technologies
| Category | Tools |
|-----------|-------|
| Database | Microsoft SQL Server |
| Data Analysis | Python (pandas, numpy, matplotlib) |
| Visualization | Power BI |
| Data Modeling | SQLAlchemy, pyodbc |
| Reporting | Markdown, Word (.docx) Reports |

---

## 📊 PowerBI Dashboards

- Financial Summary Dashboard

![Financial Summary Dashboard](./Power%20BI%20Dashboard/Financial%20Summary.jpeg)

- Operational Overview Dashboard

![Operational Overview Dashboard](./Power%20BI%20Dashboard/Operational%20Overview.jpeg)

- Staff Efficiency Dashboard

![Staff Efficiency Dashboard](./Power%20BI%20Dashboard/Staff%20Efficiency.jpeg)

---

## 📌 Author
👤 **Aman Kumar Singh**  
📧 amankrsingh1831@gmail.com  
🔗 www.linkedin.com/in/aman-kumar-singh-3a3305387  

---
