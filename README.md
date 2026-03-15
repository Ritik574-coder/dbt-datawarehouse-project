# 🏗️ dbt Data Warehouse Projects

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)

> A collection of **dbt (Data Build Tool)** projects focused on data transformation, modelling, and building scalable data warehouses. This repository is actively growing — new projects are added regularly!

---

## 👨‍💻 About This Repository

This repository is dedicated to **dbt-based data engineering projects**. Each project demonstrates real-world data transformation workflows, dimensional modelling, and best practices in analytics engineering using dbt Core/Cloud.

Whether you're here to learn, collaborate, or explore — feel free to browse through the projects below!

---

## 📁 Projects

| # | Project Name | Description | Warehouse | Status |
|---|-------------|-------------|-----------|--------|
| 1 | [dbt-datawarehouse-project](./dbt-datawarehouse-project/) | End-to-end dbt data warehouse project with staging, intermediate, and mart layers | — | ✅ Complete |
| 2 | *(Coming Soon)* | — | — | 🔄 In Progress |
| 3 | *(Coming Soon)* | — | — | 📅 Planned |

> 📌 **Note:** More projects will be added to this repo regularly. Star ⭐ the repo to stay updated!

---

## 🛠️ Tech Stack

- **[dbt Core](https://docs.getdbt.com/)** — Data transformation and modelling
- **SQL** — Core transformation language
- **YAML** — Schema definitions, sources, and tests
- **Git** — Version control for all models and configurations

### Supported Data Warehouses
- PostgreSQL
- Snowflake
- BigQuery
- Redshift
- DuckDB

---

## 🗂️ Standard Project Structure

Each dbt project in this repository follows this standard folder layout:

```
project-name/
├── dbt_project.yml          # Project configuration
├── packages.yml             # dbt package dependencies
├── profiles.yml             # Connection profile (sample only)
├── models/
│   ├── staging/             # Raw source cleaning (stg_*)
│   ├── intermediate/        # Business logic models (int_*)
│   └── marts/               # Final dimension & fact tables
│       ├── core/
│       ├── finance/
│       └── marketing/
├── seeds/                   # Static CSV reference data
├── snapshots/               # SCD Type 2 history tracking
├── tests/                   # Custom data quality tests
├── macros/                  # Reusable Jinja macros
└── README.md                # Project-specific documentation
```

---

## 🚀 Getting Started

### Prerequisites

- Python 3.8+
- dbt Core installed (`pip install dbt-core`)
- Access to a supported data warehouse

### Clone the Repository

```bash
git clone https://github.com/Ritik574-coder/dbt-datawarehouse-project.git
cd dbt-datawarehouse-project
```

### Install dbt

```bash
pip install dbt-core dbt-postgres   # or dbt-snowflake, dbt-bigquery, etc.
```

### Configure Your Profile

Copy the sample `profiles.yml` and update with your warehouse credentials:

```bash
cp profiles.yml ~/.dbt/profiles.yml
# Edit ~/.dbt/profiles.yml with your connection details
```

### Run a Project

```bash
cd <project-folder>
dbt deps          # Install packages
dbt seed          # Load seed/CSV files
dbt run           # Run all models
dbt test          # Run data quality tests
dbt docs generate && dbt docs serve   # View project documentation
```

---

## 🧪 Testing & Documentation

All projects include:

- ✅ **Generic Tests** — `not_null`, `unique`, `accepted_values`, `relationships`
- ✅ **Custom Tests** — Business-logic specific SQL tests
- ✅ **Source Freshness Checks** — `dbt source freshness`
- ✅ **dbt Docs** — Auto-generated model documentation

---

## 📌 Key dbt Concepts Covered

- **Layered Architecture** — Staging → Intermediate → Marts
- **Slowly Changing Dimensions (SCD)** — Using dbt Snapshots
- **Incremental Models** — Efficient large dataset processing
- **dbt Seeds** — Loading static reference data
- **Jinja Macros** — Reusable SQL logic
- **dbt Packages** — Using `dbt-utils`, `dbt-expectations`, etc.
- **Source & Ref Functions** — Dependency management
- **Data Lineage** — Auto-generated DAG visualization

---

## 📬 Connect With Me

- **GitHub:** [@Ritik574-coder](https://github.com/Ritik574-coder)

---

## 📄 License

This repository is open-source and available under the [MIT License](./LICENSE).

---

> ⭐ If you find this helpful, please consider starring the repository!
