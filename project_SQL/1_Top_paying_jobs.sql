/*
Question What are the top-paying data scientist jobs?
- Identify the top 10 highest-paying Data Scientist roles that are available remotely
-Focuses on job postings with specified salaries (remove nulls).
-WHY?Highlight the top-paying opportunitues for Data Scientist, offering insights into employments decisions
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
LEFT JOIN 
company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_location = 'Anywhere' AND 
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;