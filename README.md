# AI Automation Risk Across MEDS Job Postings

### Author: Richard Montes Lemus

# About

### Purpose:
As AI tools become increasingly capable, questions about which jobs and tasks are most exposed to automation have become central to career planning in data-intensive fields. This project investigates the degree to which AI could automate tasks associated with job postings targeted at MEDS (Master of Environmental Data Science) graduates.

Using AI task penetration scores from the Anthropic Economic Index — a dataset measuring the degree to which Claude could complete occupational tasks — MEDS job postings are linked to their associated tasks and scored for AI exposure. Results are aggregated and visualized by **sector** and **position type** to identify which career paths face the greatest automation risk.

### Highlights:
- Building a DuckDB relational database from CSV files with primary and foreign key constraints
- Querying across multiple tables using SQL joins and aggregate functions
- Translating SQL queries into `dbplyr` syntax using lazy evaluation and `collect()`
- Visualizing average AI task penetration scores by sector and position type using lollipop charts

### File Structure

```
├── data/
│   ├── Job-Posts-Copy-Fall.csv  # Raw MEDS job postings from Fall quarter
│   ├── Job-Posts-Copy-Winter.csv# Raw MEDS job postings from Winter quarter
│   ├── meds_jobs.csv            # Cleaned and combined job postings
│   ├── meds_jobs_tasks.csv      # Junction table linking job titles to occupational tasks
│   └── task_penetration.csv     # AI penetration scores per task
├── eds213-job-risk-cleaning.qmd # Data cleaning script (combines and cleans raw postings)
├── eds213-job-risk-query.sql    # Analytical SQL queries
├── eds213-job-risk.qmd          # Main analysis: database queries and visualizations
├── final-tables.sql             # SQL for creating and populating DuckDB tables
├── job_risk.duckdb              # DuckDB database built from the CSV files above
├── LICENSE
├── requirements.txt             # R session info for reproducibility
└── README.md
```

### Data Descriptions:

**meds_jobs.csv**
- Cleaned and combined MEDS job postings from Fall and Winter quarters, including employer, sector, position type, location, compensation, and required skills.

**Access:**
Compiled by the Bren School career team. Raw files are `Job-Posts-Copy-Fall.csv` and `Job-Posts-Copy-Winter.csv`.

**meds_jobs_tasks.csv**
- Junction table linking each MEDS job title to its associated occupational tasks. Tasks are drawn from BLS occupational data and matched to job titles.

**Access:**
Derived from BLS occupational task data and matched to MEDS job postings.

**task_penetration.csv**
- AI penetration scores for occupational tasks, measuring the degree to which Claude could complete each task. Scores range from 0 (no automation potential) to 1 (fully automatable).

**Access:**
[Anthropic Economic Index](https://www.anthropic.com/economic-index)

### References:

[1] Anthropic. *The Anthropic Economic Index* [dataset], 2025. Available: https://www.anthropic.com/economic-index. [Accessed May 2025].

[2] U.S. Bureau of Labor Statistics. *Occupational Information Network (O\*NET) Task Data* [dataset]. Available: https://www.onetonline.org. [Accessed May 2025].

[3] Bren School Career Team, UC Santa Barbara. *MEDS Job Postings — Fall and Winter 2024–2025* [internal dataset], 2025.

## Outputs

**Files:**

Quarto notebook for cleaning and combining raw job posting CSVs into a single analysis-ready file
- `eds213-job-risk-cleaning.qmd`

SQL script for creating and populating the three DuckDB tables
- `final-tables.sql`

SQL script containing the analytical queries for AI penetration by sector and position type
- `eds213-job-risk-query.sql`

Quarto notebook containing database connection, `dbplyr` queries, and lollipop chart visualizations of AI penetration scores by sector and position type
- `eds213-job-risk.qmd`

**Required Tools:**
- R: `tidyverse`, `DBI`, `duckdb`, `dbplyr`, `dplyr`
- See `requirements.txt` for full session info including package versions

Acknowledgement:
The code and content for this analysis were developed as part of EDS 213 – Databases and Data Management in the Bren School of Environmental Science and Management Master of Environmental Data Science Program. This course is led by Kelly Dodge and co-led by Greg Janée.
