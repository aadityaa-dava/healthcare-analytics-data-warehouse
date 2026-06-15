# Healthcare Analytics Data Warehouse

## Project Overview

This project demonstrates the design and implementation of a Healthcare Analytics Data Warehouse using Medicare Provider Utilization and Payment Data.

The solution includes:

- End-to-end ETL pipeline development in Python
- Dimensional data modeling using a Star Schema
- PostgreSQL data warehouse implementation
- SQL analytical views and business reporting
- Power BI executive dashboards
- Healthcare provider performance analysis

The platform enables healthcare organizations and analysts to explore provider utilization, Medicare reimbursements, beneficiary demographics, and specialty performance at scale.

---

## Business Problem

Healthcare organizations generate massive amounts of claims and reimbursement data.

Without a centralized analytics platform it becomes difficult to:

- Monitor provider performance
- Analyze Medicare spending
- Identify high-cost specialties
- Compare state-level healthcare utilization
- Support executive healthcare decision-making

This project addresses these challenges through a scalable healthcare analytics warehouse and reporting solution.

---

## Technology Stack

### Data Engineering

- Python
- Pandas
- PostgreSQL

### Analytics

- SQL
- Window Functions
- Analytical Views

### Business Intelligence

- Power BI

### Development Tools

- VS Code
- Jupyter Notebook
- Git
- GitHub

---

## Data Warehouse Architecture

### Star Schema Design

```text
                 dim_provider
                        |
                        |
                        |
dim_location ---- fact_provider_utilization ---- dim_date
```

### Fact Table

**fact_provider_utilization**

Contains provider-level utilization, reimbursement, beneficiary demographics, and risk metrics.

### Dimension Tables

**dim_provider**

Provider information including:

- NPI
- Provider Type
- Credentials
- Medicare Participation

**dim_location**

Location attributes including:

- City
- State
- ZIP Code
- RUCA Classification

**dim_date**

Reporting period information.

---

## Dataset

The project uses Medicare Provider Utilization and Payment Data.

### Warehouse Statistics

| Metric | Value |
|----------|----------:|
| Providers | 1,296,739 |
| Locations | 26,836 |
| Reporting Years | 1 |
| Fact Records | 1,296,739 |

---

## ETL Pipeline

### 1. Data Extraction

Raw provider claims data loaded from CSV.

### 2. Data Transformation

Created:

- Provider Dimension
- Location Dimension
- Date Dimension
- Provider Utilization Fact Table

### 3. Data Loading

Loaded transformed data into PostgreSQL warehouse tables.

---

## SQL Components

### Schema Creation

```sql
01_create_schema.sql
```

Creates all dimension and fact tables.

### Data Loading

```sql
02_load_dimensions.sql
03_load_fact.sql
```

Loads warehouse tables.

### Validation

```sql
04_validation_queries.sql
```

Performs:

- Row count validation
- Foreign key validation
- Data integrity checks

### Analytical Views

```sql
05_analytical_views.sql
```

Creates reporting views:

- vw_executive_kpis
- vw_top_provider_payments
- vw_state_medicare_payments
- vw_specialty_performance

### Business Analysis

```sql
06_business_analysis.sql
```

Contains analytical SQL queries used for dashboard development and business insights.

---

## Key Business Insights

### Executive KPIs

| Metric | Value |
|----------|----------:|
| Total Providers | 1.30M |
| Total Beneficiaries | 364.99M |
| Total Services | 3.51B |
| Total Submitted Charges | $494.0B |
| Total Medicare Payments | $120.1B |

---

### Highest Medicare Spending States

Top states by Medicare payments include:

1. California
2. Florida
3. Texas
4. New York
5. Illinois

---

### Top Provider Specialties by Medicare Payments

- Nurse Practitioner
- Ophthalmology
- Internal Medicine
- Clinical Laboratory
- Hematology-Oncology

---

### Highest Average Payment Specialties

- Clinical Laboratory
- Ambulatory Surgical Center
- Radiation Therapy Center
- Medical Oncology
- Rheumatology

---

## Power BI Dashboard

The project includes a multi-page Power BI dashboard.

### Executive Overview

Provides:

- Enterprise KPIs
- State-level Medicare spending
- Top provider specialties
- Top providers by reimbursement

### Provider Performance Analysis

Provides:

- Medicare payment share by specialty
- Provider counts by specialty
- Average payment analysis
- Interactive specialty filtering

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
│       └── claims.csv
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
├── warehouse/
│   ├── dim_date.csv
│   ├── dim_location.csv
│   └── dim_provider.csv
│
├── README.md
├── requirements.txt
└── .gitignore
```

---

## Project Outcomes

This project demonstrates:

- Data Warehouse Design
- Star Schema Modeling
- ETL Development
- PostgreSQL Analytics
- SQL Reporting
- Power BI Dashboard Development
- Healthcare Analytics
- Business Intelligence Reporting

---

## Author

**Aadityaa Dava**

Data Analytics | Business Intelligence | Data Engineering