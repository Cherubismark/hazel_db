--           PART 1

--Write a query to retrieve the first_name, last_name and date_of_birth of all patients.


--USE hospital_db;

--part 1 (1.1) first_name
SELECT first_name
FROM patients;


--part 1 (1.1)second_name
SELECT last_name
FROM patients;

--part 1 (1.1)date_of_birth
SELECT date_of_birth
FROM patients;



--PART 1 (1.2) providers_id
SELECT 	providers_id
FROM providers;

--PART 1 (1.2) first_name
SELECT 	first_name
FROM providers;


--PART 1 (1.2) provider_specialty
SELECT 	provider_specialty
FROM providers;



--             PART 2 


-- Write a query to retrieve all patients whose first names start with "Ab".

--quiz (2.1)
SELECT *
FROM patients 
WHERE first_name LIKE 'Ab%';


--quiz (2.2)
-- Write a query to retrieve all providers whose specialties end with the letter "y".

SELECT * 
FROM providers 
WHERE provider_specialty LIKE '%y' 



--          PART 3


--COMPARISON OPERATORS
--(3.1)Write a query to find all patients born after 1st January 1980.<br/>

SELECT *
FROM patients
WHERE date_of_birth > '1980-01-01';



--Write a query to retrieve visits where the acuity level is 2 or higher.

SELECT *
FROM ed_visits
WHERE acuity >=2;


--          PART 4
--(4.1)Write a query to find patients who speak Spanish.

SELECT * 
FROM patients
WHERE language = 'Spanish';

--(4.2)Write a query to retrieve visits where the reason is "Migraine" and the disposition is "Admitted".

SELECT *
FROM ed_visits
WHERE reason_for_visit = ('migraine') AND
ed_disposition = ('Admitted');


--(4.3)Write a query to find patients born between 1975 and 1980.

SELECT *
FROM patients
WHERE date_of_birth >= '1975-01-01' AND date_of_birth <= '1980-12-31';



--          PART 5
--5.1). Write a query to retrieve patient names and sort them in alphabetical order by last name.

SELECT last_name, first_name
FROM patients
ORDER BY last_name ASC;


--5.2). Write a query to list all visits sorted by the date of the visit, starting from the most recent.

SELECT date_of_visit
FROM visits
ORDER BY date_of_visit DESC;