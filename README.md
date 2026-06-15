# Healthcare Analytics Data Warehouse

## Project Overview

This project demonstrates the design and implementation of a Healthcare Analytics Data Warehouse using Medicare Provider Utilization and Payment Data.

The solution combines data engineering, dimensional modeling, SQL analytics, and Power BI reporting to provide healthcare utilization and reimbursement insights at scale.

The project includes:

* End-to-end ETL pipeline development in Python
* Star schema dimensional modeling
* PostgreSQL data warehouse implementation
* Analytical SQL views for reporting
* Interactive Power BI dashboards
* Healthcare provider performance analysis

---

## Business Problem

Healthcare organizations generate massive volumes of claims, utilization, and reimbursement data.

Without a centralized analytics platform, it becomes difficult to:

* Monitor provider performance
* Analyze Medicare spending
* Compare provider specialties
* Identify high-cost reimbursement patterns
* Support executive healthcare decision-making

This project addresses these challenges through a scalable healthcare analytics warehouse and reporting solution.

---

## Technology Stack

### Data Engineering

* Python
* Pandas
* PostgreSQL

### Analytics

* SQL
* Window Functions
* Analytical Views

### Business Intelligence

* Power BI

### Development Tools

* VS Code
* Jupyter Notebook
* Git
* GitHub

---

## Data Warehouse Architecture

### Star Schema

```text
                 dim_provider
                        |
                        |
                        |
dim_location ---- fact_provider_utilization ---- dim_date
```

### Fact Table

**fact_provider_utilization**

Contains provider-level:

* Utilization metrics
* Medicare reimbursement amounts
* Beneficiary demographics
* Risk indicators
* Specialty performance measures

### Dimension Tables

#### dim_provider

Provider attributes including:

* NPI
* Provider Type
* Credentials
* Medicare Participation Status

#### dim_location

Location attributes including:

* City
* State
* ZIP Code
* RUCA Classification

#### dim_date

Reporting period attributes.

---

## Dataset

The project uses Medicare Provider Utilization and Payment Data.

### Warehouse Statistics

| Metric             |     Value |
| ------------------ | --------: |
| Providers          | 1,296,739 |
| Locations          |    26,836 |
| Specialties        |       113 |
| States/Territories |        62 |
| Beneficiaries      |   364.99M |
| Services           |     3.51B |
| Medicare Payments  |  $120.06B |

---

## ETL Pipeline

### Data Extraction

Loaded raw Medicare provider utilization data.

### Data Transformation

Created:

* Provider Dimension
* Location Dimension
* Date Dimension
* Provider Utilization Fact Table

### Data Loading

Loaded transformed datasets into PostgreSQL warehouse tables.

### Validation

Performed:

* Row count validation
* Foreign key validation
* Data integrity checks

---

## SQL Analytics

### Reporting Views

The warehouse includes analytical views for business reporting:

#### vw_executive_kpis

Enterprise healthcare KPIs including:

* Total Providers
* Total Beneficiaries
* Total Services
* Total Submitted Charges
* Total Medicare Payments

#### vw_top_provider_payments

Identifies providers with the highest Medicare reimbursements.

#### vw_state_medicare_payments

Analyzes Medicare spending across states.

#### vw_specialty_performance

Analyzes:

* Provider counts
* Total payments
* Average payments
* Payment share by specialty

---

## Key Business Insights

### Executive KPIs

| Metric                  |    Value |
| ----------------------- | -------: |
| Total Providers         |    1.30M |
| Total Beneficiaries     |  364.99M |
| Total Services          |    3.51B |
| Total Submitted Charges | $494.00B |
| Total Medicare Payments | $120.06B |

---

### Highest Medicare Spending States

Top states by Medicare payments:

1. California
2. Florida
3. Texas
4. New York
5. Illinois

---

### Top Specialties by Medicare Payments

* Nurse Practitioner
* Ophthalmology
* Internal Medicine
* Clinical Laboratory
* Hematology-Oncology

---

### Highest Average Payment Specialties

* Clinical Laboratory
* Ambulatory Surgical Center
* Radiation Therapy Center
* Medical Oncology
* Rheumatology

---

## Power BI Dashboard

The project includes an interactive Power BI dashboard with two reporting pages.

### Executive Overview

Provides:

* Enterprise KPIs
* State-level Medicare spending
* Specialty payment analysis
* Top provider reimbursements

### Provider Performance Analysis

Provides:

* Medicare payment share by specialty
* Provider count by specialty
* Average payment per provider
* Interactive specialty filtering

---

## Dashboard Screenshots

### Executive Overview

![Executive Overview](reports/executive_overview.png)

### Provider Performance Analysis

![Provider Performance Analysis](reports/provider_performance_analysis.png)

---

## Project Structure

```text
healthcare-analytics-data-warehouse/

├── dashboard/
│   ├── healthcare-analytics-data-warehouse.pbix
│   └── healthcare-analytics-data-warehouse.pdf
│
├── data/
│   └── raw/
│
├── docs/
│   └── provider_data_dictionary.pdf
│
├── etl/
│   ├── export_warehouse.py
│   ├── generate_postgres_schema.py
│   └── load_warehouse_tables.py
│
├── notebooks/
│   └── Healthcare_Analytics_ETL.ipynb
│
├── reporting_exports/
│   ├── executive_kpis.csv
│   ├── specialty_performance.csv
│   ├── state_medicare_payments.csv
│   └── top_provider_payments_top1000.csv
│
├── reports/
│   ├── executive_overview.png
│   └── provider_performance_analysis.png
│
├── sql/
│   ├── 01_create_schema.sql
│   ├── 02_load_dimensions.sql
│   ├── 03_load_fact.sql
│   ├── 04_validation_queries.sql
│   ├── 05_analytical_views.sql
│   └── 06_business_analysis.sql
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

## Project Outcomes

This project demonstrates:

* Data Warehouse Design
* Star Schema Modeling
* ETL Development
* PostgreSQL Analytics
* SQL Reporting
* Power BI Dashboard Development
* Healthcare Analytics
* Business Intelligence Reporting

---

## Author

**Aadityaa Dava**

Data Analytics | Business Intelligence | Data Engineering