/* Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite' */

SELECT
    COUNT(job_id) AS number_ob_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;