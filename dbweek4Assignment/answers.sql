--Part 1: INSERT Data
--1.1

INSERT INTO patients (first_name, last_name, date_of_birth, gender, language)
 VALUES ('John', 'Doe', '1960-11-15', 'Male', 'English');

--Part 2: UPDATE Data
--2.1
 UPDATE patients
SET language = 'Spanish'
WHERE patient_id = 947;


--Part 3: DELETE Data
--3.1  Delete the patient with the patient_id number 10

DELETE FROM patients
 WHERE patient_id = 10;

 --Part 4: Handling NULL Values
 --4.1). Write a query to find that takes all the names and the emails of the providers and if any of them has a NULL email, replace it with N/A
 SELECT 
  first_name, 
  last_name, 
  IFNULL(email_address, 'N/A') AS email
FROM 
  providers;

  --4.2). Write a query that takes the names and contact details of the provider whether phone number or email and if any of the two is missing, replace it with Missing details
SELECT 
  first_name, 
  last_name, 
  IFNULL(phone_number, 'Missing details') AS phone_number,
  IFNULL(email_address, 'Missing details') AS email
FROM 
  providers;