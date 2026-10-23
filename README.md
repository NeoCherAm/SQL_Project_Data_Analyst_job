# Project Overview
Dive into the data job market. This project analyzes **salary trends** and **skill demand** in Data Scientist job postings from **2023** using SQL.

Check my SQL queries here: [project_sql folder](/project_SQL/)
# Background
This is my final project for the [SQL course by Luke Barousse](https://www.lukebarousse.com/sql). The goal of the project is to identify the highest-paying and most in-demand skills for Data Scientists, in order to make the job search process more efficient.

### The Question I wanted to answer: ###
    1. What are the highest-paying Data Scientist jobs?
    2. What are the skills required for these highest-paying roles?
    3. What are the most in-demand skills for data scientist role?
    4. What are the top skills based on salary for data scientist role?
    5. What are the most optimal skills to learn?

The dataset comes from [Luke Barousse's SQL course](https://www.lukebarousse.com/sql)
# Tools & Technologies
The following tools and technologies were used in this project:
- **SQL:** Used to query, filter, join, and analyze job-posting data to identify salary trends and in-demand skills.
- **Visual Studio Code:** Used as the code editor to write, organize, and manage SQL queries.
- **PostgreSQL:** Used as the relational database management system to store, manage, and query the dataset.
- **GitHub:** Used to publish the project, share SQL scripts, and document the analysis in a public repository.
# The Analysis
I specified goals of this project up there. Here's how I answer each question:

 ## **1. The highest-paying Data Scientist jobs** ##
 To find the highest-paing roles, I filtered data by average yearly salary and location, focusing on remote jobs. This gives clearly view to understand jobs opportunities.

```SQL 
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
```
### Key Findings ###
- **Leadership Roles Dominate:** Several of the top 10 highest-paying positions are Director- or Head-level roles, highlighting the value of leadership and strategic responsibility.
- **High-Paying Quantitative Roles:** The top two positions at Selby Jennings offer annual salaries ranging from **$525,000 to $550,000**.
- **Salary Concentration:** 7 of the top 10 positions offer annual salaries between **$300,000 and $375,000**, while the top two exceed $500,000.
- **Industry Diversity:** The roles span multiple industries, including finance, technology, retail, battery technology, and business analytics.

 ## **2. Skills for the highest-paying Jobs** ##
To understand what skills are required for the highest-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

[View SQL query](/project_SQL/2_Top_paying_job_skills.sql)
### Key Findings ###
- **Python and SQL Are Fundamental:** Both appear in multiple top-paying job postings, highlighting the importance of programming and data querying skills.
- **Machine Learning Expertise:** TensorFlow, PyTorch, Keras, and Scikit-learn appear in high-paying roles, emphasizing the value of machine learning frameworks.
- **Big Data and Distributed Computing:** Technologies such as Spark, Hadoop, and Cassandra feature in roles offering salaries of $300,000–$375,000 annually.
- **Cloud Skills Matter:** AWS, Azure, and GCP appear in senior positions, highlighting the relevance of cloud computing in data science.
- **Specialized Technical Skills:** Java, Scala, and other technologies appear in some high-paying roles, suggesting that advanced engineering expertise can be valuable.
## **3. The most in-demand skills** ##
This query finds most frequently requested skills in job postings
[View SQL query](/project_SQL/3_Top_demanded_skills.sql)
### Key Findings ###
- **Python Dominates:** Python is the most in-demand skill, with **114,016 job postings**, significantly ahead of all other skills.
- **SQL Is Essential:** SQL ranks second with **79,174 mentions**, highlighting the importance of database querying and data management.
- **R Remains Relevant:** R appears in **59,754 postings**, demonstrating continued demand for statistical computing and analysis.
- **SAS and Tableau:** Both appear in approximately **29,500 postings**, indicating demand for specialized analytics tools and data visualization.

| Skill | Demand Count |
|---|---:|
| Python | 114,016 |
| SQL | 79,174 |
| R | 59,754 |
| SAS | 29,642 |
| Tableau | 29,513 |    
Table of the demand for the top 5 skills in data scientist job postings

## **4. The highest-paying skills** ##
Exploring the average salaries associated with different skills revealed which skills are the highest paying.

```SQL
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
```
### Key Findings ###
- **Specialized skills pay well:** GDPR ($217.7K) and Golang ($208.8K) top the list.
- **Programming matters:** Golang, Rust, Scala, and Julia feature among the top 30.
- **Data infrastructure is valuable:** Skills like BigQuery, Airflow, Cassandra, and DynamoDB are well represented.
- **AI skills remain relevant:** OpenCV, Hugging Face, and DataRobot appear in the rankings.

## **5. The most optimal skills** ##
This query helps to identify most optimal skills for data scientist. This skills are high-paying and frequently requested

```SQL
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
```
### Key Findings ###
- **Python and SQL Lead in Demand:** Python appears in 763 job postings (**16.04%** of total skill mentions) with an average salary of **$143,828**, while SQL appears in 591 postings (**12.43%**) with an average salary of **$142,833**.
- **Machine Learning Skills Offer High Salaries:** PyTorch appears in 115 postings (**2.42%**) with an average salary of **$152,603**, while TensorFlow appears in 126 (**2.65%**) with an average salary of **$151,536**.
- **Cloud and Big Data Skills Are Valuable:** AWS appears in 217 postings (**4.56%**) with an average salary of **$149,630**. Spark appears in 149 (**3.13%**) with an average salary of **$150,188**.
- **High Salary Does Not Always Mean High Demand:** C has the highest average salary at **$164,865**, but appears in only 48 postings (**1.01%**). This contrasts with Python and SQL, which have much higher demand.
- **Tableau Combines Demand and Compensation:** Tableau appears in 219 postings (**4.60%**) with an average salary of **$146,970**, making it a notable analytics skill.

| Rank | Skill | Demand Count | Average Annual Salary |
|---:|---|---:|---:|
| 1 | C | 48 | $164,865 |
| 2 | Go | 57 | $164,691 |
| 3 | Looker | 57 | $158,715 |
| 4 | BigQuery | 36 | $157,142 |
| 5 | Scala | 56 | $156,702 |
| 6 | GCP | 59 | $155,811 |
| 7 | Snowflake | 72 | $152,687 |
| 8 | PyTorch | 115 | $152,603 |
| 9 | Redshift | 36 | $151,708 |
| 10 | TensorFlow | 126 | $151,536 |
Table of the most optimal skills for data scientist sorted by salary
# What I Learned
Through this project, I strengthened my SQL skills and developed my ability to analyze real-world job market data:

- **SQL Querying:** Applied filtering, JOINs, subqueries, and Common Table Expressions (CTEs) to extract and analyze relevant job posting data.
- **Data Aggregation:** Used `GROUP BY` and aggregate functions such as `COUNT()` and `AVG()` to identify salary trends and measure skill demand.
- **Data-Driven Insights:** Used SQL query results to explore which skills may offer a valuable combination of high demand and competitive salaries.
# Conclusions
- **High Salaries Are Associated with Seniority and Specialization:** The highest-paying Data Scientist postings in the 2023 dataset offer annual salaries of **$300,000–$550,000**. Many are senior leadership or specialized quantitative research roles, suggesting that advanced expertise and strategic responsibility are valuable.

- **Python and SQL Are Core Skills:** Python appears in **114,016 job postings**, while SQL appears in **79,174**. Both are also present in several of the highest-paying roles, making them strong foundational skills for aspiring Data Scientists.

- **Machine Learning and Data Infrastructure Matter:** TensorFlow, PyTorch, Spark, AWS, and cloud platforms appear among the skills associated with competitive salaries. These technologies support machine learning development, large-scale data processing, and deployment infrastructure.

- **The Highest-Paying Skills Are Not Always the Most In-Demand:** Specialized skills such as C and Go have average salaries above **$164,000** in the optimal-skills analysis, but appear far less frequently than Python or SQL. This highlights a trade-off between salary potential and the number of opportunities available.

- **A Balanced Learning Strategy Is Most Practical:** Build a strong foundation in Python, SQL, and statistical analysis before progressing to machine learning libraries such as Scikit-learn and PyTorch. Then develop cloud, big-data, and deployment skills based on your target roles. This combines broadly requested skills with opportunities to specialize.

### Top 10 Highest-Paying Skills ###

| Rank | Skill | Average Annual Salary | Demand Count |
|---:|---|---:|---:|
| 1 | C | $164,865 | 48 |
| 2 | Go | $164,691 | 57 |
| 3 | Looker | $158,715 | 57 |
| 4 | BigQuery | $157,142 | 36 |
| 5 | Scala | $156,702 | 56 |
| 6 | GCP | $155,811 | 59 |
| 7 | Snowflake | $152,687 | 72 |
| 8 | PyTorch | $152,603 | 115 |
| 9 | Redshift | $151,708 | 36 |
| 10 | TensorFlow | $151,536 | 126 |

### Top 10 Most In-Demand Skills ###

| Rank | Skill | Demand Count | Average Annual Salary |
|---:|---|---:|---:|
| 1 | Python | 763 | $143,828 |
| 2 | SQL | 591 | $142,833 |
| 3 | R | 394 | $137,885 |
| 4 | SAS | 220 | $129,920 |
| 5 | Tableau | 219 | $146,970 |
| 6 | AWS | 217 | $149,630 |
| 7 | Spark | 149 | $150,188 |
| 8 | TensorFlow | 126 | $151,536 |
| 9 | Azure | 122 | $142,306 |
| 10 | PyTorch | 115 | $152,603 |