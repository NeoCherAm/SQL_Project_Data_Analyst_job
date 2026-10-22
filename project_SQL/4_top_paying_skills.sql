/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
Focuses on roles with specified salaries, regardless of location
Why? It reveals how different skills impact salary levels for Data Scientist and helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) as average_salary
FROM job_postings_fact
JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
     AND job_work_from_home = 'True'
GROUP BY 
    skills
ORDER BY    
    average_salary DESC
LIMIT 30

/*
Here's a breakdowm of the results for top paying skills
-Specialized skills pay well: GDPR ($217.7K) and Golang ($208.8K) top the list.
-Programming matters: Golang, Rust, Scala, and Julia feature among the top 30.
-Data infrastructure is valuable: Skills like BigQuery, Airflow, Cassandra, and DynamoDB are well represented.
-AI skills remain relevant: OpenCV, Hugging Face, and DataRobot appear in the rankings.

[
  {
    "skills": "gdpr",
    "average_salary": "217738"
  },
  {
    "skills": "golang",
    "average_salary": "208750"
  },
  {
    "skills": "atlassian",
    "average_salary": "189700"
  },
  {
    "skills": "selenium",
    "average_salary": "180000"
  },
  {
    "skills": "opencv",
    "average_salary": "172500"
  },
  {
    "skills": "neo4j",
    "average_salary": "171655"
  },
  {
    "skills": "microstrategy",
    "average_salary": "171147"
  },
  {
    "skills": "dynamodb",
    "average_salary": "169670"
  },
  {
    "skills": "php",
    "average_salary": "168125"
  },
  {
    "skills": "tidyverse",
    "average_salary": "165513"
  },
  {
    "skills": "solidity",
    "average_salary": "165000"
  },
  {
    "skills": "c",
    "average_salary": "164865"
  },
  {
    "skills": "go",
    "average_salary": "164691"
  },
  {
    "skills": "datarobot",
    "average_salary": "164500"
  },
  {
    "skills": "qlik",
    "average_salary": "164485"
  },
  {
    "skills": "redis",
    "average_salary": "162500"
  },
  {
    "skills": "watson",
    "average_salary": "161710"
  },
  {
    "skills": "elixir",
    "average_salary": "161250"
  },
  {
    "skills": "rust",
    "average_salary": "161250"
  },
  {
    "skills": "cassandra",
    "average_salary": "160850"
  },
  {
    "skills": "looker",
    "average_salary": "158715"
  },
  {
    "skills": "slack",
    "average_salary": "158333"
  },
  {
    "skills": "terminal",
    "average_salary": "157500"
  },
  {
    "skills": "airflow",
    "average_salary": "157414"
  },
  {
    "skills": "julia",
    "average_salary": "157244"
  },
  {
    "skills": "bigquery",
    "average_salary": "157142"
  },
  {
    "skills": "scala",
    "average_salary": "156702"
  },
  {
    "skills": "hugging face",
    "average_salary": "156520"
  },
  {
    "skills": "node.js",
    "average_salary": "156107"
  },
  {
    "skills": "vue",
    "average_salary": "156107"
  }
]
*/
