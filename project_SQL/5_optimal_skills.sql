/*
Answer: What are the most optimal skills to learn
-Identify skills in high demand and associated with high average salaries for Data Scientist roles
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
offering strategic insights for career development in Data Science
*/

SELECT
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) as average_salary    
FROM job_postings_fact
JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'True'
GROUP BY skills_dim.skills
HAVING COUNT(skills_job_dim.job_id) > 25
ORDER BY average_salary DESC, demand_count DESC;


    