--              PART 1
--1.1). Write a query to find the total number of patient admissions in the admissions table.
SELECT COUNT(*)
FROM admissions;

--1.2). Write a query to calculate the average length of stay (difference between discharge date and admission date) for all patients.

SELECT AVG(DATEDIFF(d.discharge_date, a.admission_date)) AS average_length_of_stay 
FROM discharges d
JOIN admissions a ON d.patient_id = a.patient_id;

--      PART 2
--2.1). Write a query to group admissions by primary_diagnosis and calculate the total number of admissions for each diagnosis.

SELECT 
  primary_diagnosis, 
  COUNT(*) AS total_admissions
FROM 
  admissions
GROUP BY 
  primary_diagnosis;

  --2.2). Write a query to group admissions by service and calculate the average length of stay for each service (e.g., Cardiology, Neurology).
SELECT 
  a.service, 
  AVG(DATEDIFF(d.discharge_date, a.admission_date)) AS average_length_of_stay
FROM 
  admissions a
  INNER JOIN discharges d ON a.admission_id = d.admission_id
GROUP BY 
  a.service;

--2.3). Write a query to group discharges by discharge_disposition and count the number of discharges in each category (e.g., Home, Expired, Transfer).

SELECT 
  d.discharge_disposition, 
  COUNT(*) AS num_discharges
FROM 
  discharges d
GROUP BY 
  d.discharge_disposition
ORDER BY 
  num_discharges;



  --PART 3
  --3.1). Write a query to group admissions by service and show the services where the total number of admissions is greater than 5.
SELECT 
  a.service, 
  COUNT(*) AS total_admissions
FROM 
  admissions a
GROUP BY 
  a.service
HAVING 
  COUNT(*) > 5;

--3.2). Write a query to find the average length of stay for patients admitted with a primary diagnosis of "Stroke" in the admissions table.
SELECT 
  AVG(DATEDIFF(d.discharge_date, a.admission_date)) AS avg_length_of_stay
FROM 
  admissions a
  JOIN discharges d ON a.admission_id = d.admission_id
WHERE 
  a.primary_diagnosis = 'Stroke';




--              PART 4


--4.1). Write a query to group emergency department visits (ed_visits) by acuity and calculate the total number of visits for each acuity level.
SELECT 
  ed.acuity, 
  COUNT(ed.visit_id) AS total_visits
FROM 
  ed_visits ed
GROUP BY 
  ed.acuity
ORDER BY 
  total_visits;

--4.2). Write a query to group admissions by primary_diagnosis and service, showing the total number of admissions for each combination.
SELECT 
  a.primary_diagnosis, 
  a.service, 
  COUNT(a.admission_id) AS total_admissions
FROM 
  admissions a
GROUP BY 
  a.primary_diagnosis, 
  a.service
ORDER BY 
  total_admissions;


--              PART 5
--5.1). Write a query to group admissions by month (using the admission_date) and calculate the total number of admissions per month.
SELECT 
  EXTRACT(MONTH FROM a.admission_date) AS month, 
  EXTRACT(YEAR FROM a.admission_date) AS year, 
  COUNT(a.admission_id) AS total_admissions
FROM 
  admissions a
GROUP BY 
  EXTRACT(MONTH FROM a.admission_date), 
  EXTRACT(YEAR FROM a.admission_date)
ORDER BY 
  year, month;

--5.2 Write a query to find the maximum length of stay for each primary_diagnosis in the admissions table.

SELECT 
  a.primary_diagnosis, 
  MAX(DATEDIFF(d.discharge_date, a.admission_date)) AS max_length_of_stay
FROM 
  admissions a
JOIN 
  discharges d ON a.admission_id = d.admission_id
GROUP BY 
  a.primary_diagnosis
ORDER BY 
  max_length_of_stay;


