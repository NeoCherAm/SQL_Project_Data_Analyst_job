/*
Question: What skills are required for the top-paying data scientist jobs?
-Use the top 10 highest-paying jobs from first query
-Add the specific skills required for thesee roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills, helping job seekers understand which skills to develop that align with top salaries
*/
WITH top_paying_jobs AS(
    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM job_postings_fact
    LEFT JOIN company_dim
    ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_location = 'Anywhere' AND 
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT skills_dim.skills, top_paying_jobs.*
FROM top_paying_jobs
JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY salary_year_avg DESC;

/*
Breakdown for data scientist:
-SQL is the most common skill: Required in 6 of 7 job postings (86%).
-Python is high demand: Appears in 5 of 7 jobs (71%).
-Java and Spark are also important: Each appears in 4 of 7 jobs (57%).
-Tableau is relevant: Required in 3 of 7 jobs (43%).
-Big data and cloud technologies such as Hadoop, AWS and Cassandra appear in several postings.

[
  {
    "skills": "sql",
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "skills": "python",
    "job_id": 40145,
    "job_title": "Staff Data Scientist/Quant Researcher",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "550000.0",
    "job_posted_date": "2023-08-16 16:05:16",
    "company_name": "Selby Jennings"
  },
  {
    "skills": "sql",
    "job_id": 1714768,
    "job_title": "Staff Data Scientist - Business Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "525000.0",
    "job_posted_date": "2023-09-01 19:24:02",
    "company_name": "Selby Jennings"
  },
  {
    "skills": "sql",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "python",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "java",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "cassandra",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "spark",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "hadoop",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "tableau",
    "job_id": 1131472,
    "job_title": "Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-07-31 14:05:21",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "sql",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "python",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "java",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "c++",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "cassandra",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "spark",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "hadoop",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "tableau",
    "job_id": 627602,
    "job_title": "Senior Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "375000.0",
    "job_posted_date": "2023-08-30 10:06:34",
    "company_name": "Algo Capital Group"
  },
  {
    "skills": "scala",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "java",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "spark",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "tensorflow",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "pytorch",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "kubernetes",
    "job_id": 226011,
    "job_title": "Distinguished Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-08-06 11:00:43",
    "company_name": "Walmart"
  },
  {
    "skills": "sql",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "python",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "java",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "c",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "aws",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "gcp",
    "job_id": 38905,
    "job_title": "Principal Data Scientist",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "300000.0",
    "job_posted_date": "2023-11-24 14:08:44",
    "company_name": "Storm5"
  },
  {
    "skills": "sql",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "python",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "nosql",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "r",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "sas",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "matlab",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "azure",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "databricks",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "aws",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "redshift",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "oracle",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "snowflake",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "spark",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "tableau",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "sas",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  },
  {
    "skills": "qlik",
    "job_id": 178888,
    "job_title": "Pre-Sales Data Scientist, Financial Services",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "288000.0",
    "job_posted_date": "2023-08-26 09:55:56",
    "company_name": "Teradata"
  }
]
*/