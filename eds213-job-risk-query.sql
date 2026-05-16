
-- What is the AI Automation Risk Across MEDS Job
-- Postings Position Types? 

-- We will use the AI Penetration score average 
-- for all tasks associated with each position type.
-- This score measures the degree to which Claude 
-- could complete a task. 

SELECT sector,
       ROUND(AVG(task_penetration.penetration), 3) AS avg_ai_penetration,
       COUNT(*) AS num_tasks
FROM meds_jobs_tasks
JOIN task_penetration
  USING (task)
JOIN meds_jobs
  USING (job_title)
GROUP BY sector
ORDER BY avg_ai_penetration DESC;

-- What is the AI Automation Risk Across MEDS Job 
-- Postings Sectors? 

-- We will use the AI Penetration score average for 
-- all tasks associated with each sector. This score
-- measures the degree to which Claude could complete
-- a task. 

 SELECT position_type,
         ROUND(AVG(task_penetration.penetration), 3) AS avg_ai_penetration,
         COUNT(*) AS num_tasks
  FROM meds_jobs_tasks
  JOIN task_penetration
    USING (task)
  JOIN meds_jobs
    USING (job_title)
  GROUP BY position_type
  ORDER BY avg_ai_penetration DESC
  LIMIT 10;