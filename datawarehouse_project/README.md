# 🏗️ DBT Data Warehouse Project

<div align="center">

![DBT](https://img.shields.io/badge/dbt-1.11.6-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

**A modular, production-style analytics engineering pipeline built with DBT and SQL Server.**

[View Project Structure](#-project-structure) • [Data Models](#-data-models) • [Run the Project](#-running-the-project) • [Tests](#-data-quality-testing)

</div>

---

## 📌 Overview

This project demonstrates a complete **analytics engineering workflow** — from raw source tables to business-ready metrics — using industry-standard DBT practices.

The pipeline transforms raw warehouse data through a **layered architecture**:

```
Raw Source Tables  →  Staging Layer  →  Intermediate Layer  →  Mart Layer  →  Data Quality Tests
```

All 5 models run successfully, all 7 data quality tests pass ✅

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **DBT 1.11.6** | Transformation framework |
| **SQL Server** | Data warehouse backend |
| **ODBC / sqlserver adapter** | DB connectivity |
| **Git / GitHub** | Version control |
| **Linux (Ubuntu)** | Development environment |

---

## 🏛️ Architecture

The transformation pipeline follows a standard **medallion-style** layered approach:

```
┌─────────────────────────────────────────────┐
│             Gold Warehouse Tables           │
│     dim_customers  dim_products  fact_sales │
└────────────────────┬────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────┐
│               Staging Layer                 │
│   stg_customers  stg_products  stg_sales    │
└────────────────────┬────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────┐
│             Intermediate Layer              │
│              int_sales_enriched             │
└────────────────────┬────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────┐
│                 Mart Layer                  │
│              fct_sales_summary              │
└─────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
DBT/
├── database/
│   └── info.sql                        # DB setup
│
└── datawarehouse_project/
    ├── models/
    │   ├── staging/                    # Light transformations
    │   │   ├── sources.yml
    │   │   ├── schema.yml              # Data quality tests defined here
    │   │   ├── stg_customers.sql
    │   │   ├── stg_products.sql
    │   │   └── stg_sales.sql
    │   │
    │   ├── intermediate/               # Enriched joins
    │   │   └── int_sales_enriched.sql
    │   │
    │   └── marts/                      # Business metrics
    │       └── fct_sales_summary.sql
    │
    ├── macros/
    ├── seeds/
    ├── snapshots/
    ├── tests/
    ├── dbt_project.yml
    └── README.md
```

---

## 📊 Data Models

### 🔵 Staging Layer
Light transformations and source standardization.

| Model | Description |
|-------|-------------|
| `stg_customers` | Cleaned customer records |
| `stg_products` | Standardized product data |
| `stg_sales` | Normalized sales transactions |

**Key transformations applied:**
- Column selection & renaming
- NULL handling with `COALESCE`
- Basic data type standardization

```sql
-- Example: handle missing categories
COALESCE(category, 'Unknown') AS category
```

---

### 🟡 Intermediate Layer
Combines staging models to produce enriched datasets.

| Model | Joins |
|-------|-------|
| `int_sales_enriched` | `stg_sales` + `stg_customers` + `stg_products` |

This model produces a clean, denormalized dataset ready for aggregation.

---

### 🟢 Mart Layer
Aggregated business metrics for reporting and analytics.

| Model | Metrics |
|-------|---------|
| `fct_sales_summary` | Total orders, total quantity, total sales — grouped by product category |

---

## ✅ Data Quality Testing

DBT generic tests are defined in `models/staging/schema.yml` and cover:

| Test | Column | Model |
|------|--------|-------|
| `not_null` | `customer_key` | `stg_customers` |
| `unique` | `customer_key` | `stg_customers` |
| `not_null` | `product_key` | `stg_products` |
| `unique` | `product_key` | `stg_products` |
| `not_null` | `order_number` | `stg_sales` |
| `not_null` | `customer_key` | `stg_sales` |
| `not_null` | `product_key` | `stg_sales` |

**Last run result:** `PASS=7 WARN=0 ERROR=0 SKIP=0 TOTAL=7` ✅

---

## 🚀 Running the Project

**1. Navigate to project directory**
```bash
cd datawarehouse_project
```

**2. Test DB connection**
```bash
dbt debug
```

**3. Run all models**
```bash
dbt run
```

**4. Run data quality tests**
```bash
dbt test
```

**5. Generate & serve documentation**
```bash
dbt docs generate
dbt docs serve
# Visit http://localhost:8080
```

---

## 📈 Run Results

```
dbt run   →  5/5 models OK  (1 table, 4 views)  ✅  97.66s
dbt test  →  7/7 tests PASS                      ✅   1.10s
```

---

## 📸 Screenshots

> 💡 **How to add these:** Create a folder called `assets/` in your repo root, upload your screenshots there, then the images below will display automatically.

### 🔌 DBT Connection Log (`dbt debug`)
> Shows successful SQL Server connection and adapter configuration.

![DBT Debug Log](assets/dbt_debug_log.png)

---

### 🗂️ Project Directory Structure
> Full directory tree showing all 39 directories and 73 files.

![Project Structure](assets/project_structure.png)

---

### ▶️ DBT Run — All Models Built
> All 5 models created successfully: 3 staging views, 1 intermediate view, 1 mart table.

![DBT Run](assets/dbt_run.png)

---

### ✅ DBT Test — All Tests Passed
> 7 out of 7 data quality tests passed. `PASS=7 WARN=0 ERROR=0`.

![DBT Test](assets/dbt_test.png)

---

### 📚 DBT Docs Served
> Documentation generated and served at `http://localhost:8080`.

![DBT Docs](assets/dbt_docs_serve.png)

---

## 🔮 Future Improvements

- [ ] Incremental models for large datasets
- [ ] Slowly Changing Dimensions (SCD Type 2) with snapshots
- [ ] CI/CD pipeline integration (GitHub Actions)
- [ ] Data freshness monitoring
- [ ] More comprehensive test coverage (accepted values, relationships)

---

## 👤 Author

**Ritik** — Aspiring Data Engineer / Analytics Engineer

[![GitHub](https://img.shields.io/badge/GitHub-ritik574--coder-181717?style=flat&logo=github)](https://github.com/ritik574-coder)

---

<div align="center">
<sub>Built with ❤️ using DBT, SQL Server, and a lot of <code>dbt debug</code></sub>
</div>