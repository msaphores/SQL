SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date  -- ::DATE converts the data type to DATE
FROM
    job_postings_fact;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date_time  -- date_time entrega el formato yyyy-mm-dd hh:mm:ss
FROM
    job_postings_fact
LIMIT 5;

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST',  -- se escribe dos veces para definir el actual y al que se quiere cambiar
    EXTRACT(DAY FROM job_posted_date) AS date_day,  -- EXTRACT MONTH se usa para extraer el mes de la fecha
    EXTRACT(MONTH FROM job_posted_date) AS date_month,  -- EXTRACT MONTH se usa para extraer el mes de la fecha
    EXTRACT(YEAR FROM job_posted_date) AS date_year  -- EXTRACT YEAR se usa para extraer el año de la fecha
FROM
    job_postings_fact
LIMIT 5;

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;
