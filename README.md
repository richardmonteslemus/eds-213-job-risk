# AI Automation Risk Across MEDS Job Postings

### Author: Richard Montes Lemus

# About

### Purpose:
As AI tools continue to evolve in seemingly all industries, questions about which jobs and tasks are most exposed to automation have become important for future career planning and projections. This project investigates the degree to which AI could automate tasks associated with job postings targeted at MEDS (Master of Environmental Data Science) graduates.

This project uses AI task penetration scores from the Anthropic Economic Index, a dataset measuring the degree to which Claude could complete certain occupational tasks. MEDS job postings are linked to their associated tasks and scored for their average AI exposure. The average is visualized by **sector** and **position type** to identify which career paths face the greatest automation risk.

### File Structure

```
├── data/
│   ├── Job-Posts-Copy-Fall.csv  # Raw MEDS job postings from Fall quarter
│   ├── Job-Posts-Copy-Winter.csv# Raw MEDS job postings from Winter quarter
│   ├── meds_jobs.csv            # Cleaned and combined job postings
│   ├── meds_jobs_tasks.csv      # Cross table linking job titles tasks
│   └── task_penetration.csv     # AI penetration scores per task
├── eds213-job-risk-cleaning.qmd # Data cleaning script 
├── eds213-job-risk-query.sql    # SQL queries
├── eds213-job-risk.qmd          # Main analysis: database queries and visualizations
├── final-tables.sql             # SQL for creating DuckDB tables
├── job_risk.duckdb              # DuckDB database built from the CSV files above
├── LICENSE
├── requirements.txt             # R session dependencies for reproducibility
└── README.md
```

### Data Descriptions:

**meds_jobs.csv**
- Cleaned and combined MEDS job postings from Fall and Winter quarters, including employer, sector, position type, location, compensation, and required skills.

**Access:**
Compiled by the Bren School career team intern [Sofia Sarak](https://github.com/sofiasarak) . Raw files are `Job-Posts-Copy-Fall.csv` and `Job-Posts-Copy-Winter.csv`.

**task_penetration.csv**
- AI penetration scores for occupational tasks, measuring the degree to which Claude could complete each task. Scores range from 0 (no automation potential) to 1 (fully automatable).

**Access:**
[Anthropic Economic Index](https://huggingface.co/datasets/Anthropic/EconomicIndex)

**meds_jobs_tasks.csv**
- Cross table linking each MEDS job title to its associated tasks. Tasks are drawn from `task_penetration.csv` data and matched to job titles using Claude.

**Access:**
Synthetic crosswalk produced by Claude

### References:

[1] R. Appel et al., "Anthropic Economic Index," Anthropic, Mar. 2026. [Online]. Available: https://huggingface.co/datasets/Anthropic/EconomicIndex

[2] Sofia Sarak, UC Santa Barbara. *MEDS Job Postings — Fall and Winter 2025–2026* [internal dataset], 2026.

## Outputs

**Files:**

Quarto notebook for cleaning raw job and task penetration data and prepare it for an SQL insertion. 
- `eds213-job-risk-cleaning.qmd`

SQL script for creating the three DuckDB tables needed for this project
- `final-tables.sql`

SQL script containing the queries for AI penetration by sector and position type
- `eds213-job-risk-query.sql`

Quarto notebook containing database connection, `dbplyr` queries, and lollipop chart visualizations of AI penetration scores by sector and position type
- `eds213-job-risk.qmd`

**Required Tools:**
- R: `tidyverse`, `DBI`, `duckdb`, `dbplyr`, `dplyr`
- See `requirements.txt` for full session info including package versions

Acknowledgement:
The code and content for this analysis were developed as part of EDS 213 – Databases and Data Management in the Bren School of Environmental Science and Management Master of Environmental Data Science Program. This course is led by Julien Brun and Greg Janée.
