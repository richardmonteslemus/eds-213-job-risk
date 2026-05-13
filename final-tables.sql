
-- =============================================
-- Table 1: task_penetration
-- =============================================
CREATE TABLE task_penetration (
    task        VARCHAR PRIMARY KEY,
    penetration DOUBLE
);
INSERT INTO task_penetration
SELECT * FROM read_csv('data/task_penetration.csv', header=true, quote='"');

-- =============================================
-- Table 2: meds_jobs
-- =============================================
CREATE TABLE meds_jobs (
    date_posted           VARCHAR,
    application_deadline  VARCHAR,
    sector                VARCHAR,
    environmental_field   VARCHAR,
    employer              VARCHAR,
    job_title             VARCHAR,
    position_type         VARCHAR,
    city                  VARCHAR,
    state                 VARCHAR,
    country               VARCHAR,
    modality              VARCHAR,
    term                  VARCHAR,
    minimum_degree        VARCHAR,
    experience_years      VARCHAR,
    job_type              VARCHAR,
    compensation_minimum  DOUBLE,
    compensation_maximum  DOUBLE,
    hourly                VARCHAR,
    monthly               VARCHAR,
    yearly_salary_min     DOUBLE,
    yearly_salary_max     DOUBLE,
    hard_skills           VARCHAR
);

INSERT INTO meds_jobs
SELECT * FROM read_csv('data/meds_jobs.csv', header=true, quote='"', nullstr='NA');

-- =============================================
-- Table 3: meds_jobs_tasks
--crosswalk
-- =============================================
CREATE TABLE meds_jobs_tasks (
    job_title VARCHAR,
    task      VARCHAR,
    PRIMARY KEY (job_title, task),
    FOREIGN KEY (task) REFERENCES task_penetration(task)
);
INSERT INTO meds_jobs_tasks
SELECT * FROM read_csv('data/meds_jobs_tasks.csv', header=true, quote='"');

-- =============================================
-- Verify
-- =============================================
.tables
SELECT * FROM task_penetration LIMIT 5;
SELECT * FROM meds_jobs LIMIT 5;
SELECT * FROM meds_jobs_tasks LIMIT 5;