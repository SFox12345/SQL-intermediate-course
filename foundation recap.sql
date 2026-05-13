/*
Foundation Recap Exercise

Use the table PatientStay.
This table lists 44 patients admitted to London hospitals over 5 days, from 26 February to 2 March 2024.
*/

SELECT
    *
FROM
    PatientStay ps;

/*
1. Filter the list of patients to show only those who:
a) were admitted to the Oxleas or PRUH hospital
b) were admitted in February 2024
c) were in a surgical ward (i.e. wards with names ending in the word Surgery)

2. Show only these columns: PatientId, AdmittedDate, DischargeDate, Hospital, and Ward.
3. Order the results by AdmittedDate (latest first), then by PatientId (high to low).
4. Add a calculated column called LengthOfStay that shows the number of days the patient stayed in hospital.
*/

-- Write the SQL statement here

SELECT
  ps.PatientId,
  ps.AdmittedDate,
  ps.DischargeDate,
  ps.Hospital,
  ps.Ward,
 DateDiff(Day, ps.AdmittedDate, ps.DischargeDate) as LengthofStay
FROM
    PatientStay ps
WHERE ps.Hospital in ('Oxleas', 'PRUH')
And
ps.AdmittedDate BETWEEN'2024-02-01' AND '2024-02-29'
AND ps.Ward Like '%Surgery'
ORDER BY 
ps.AdmittedDate DESC, 
ps.PatientId DESC

/*
5. How many patients have been admitted to each hospital?
6. What is the total tariff for each hospital?
7. List only those hospitals that have admitted more than 10 patients.
8. Order the results by the hospital with the most admissions first.
*/

-- Write the SQL statement here
SELECT
ps.hospital,
COUNT(*) as 'No of Patients',
SUM(ps.Tariff) as TotalTariff
From 
PatientStay ps
Group by Ps.Hospital
HAVING 
COUNT(*) >10
ORDER BY
[No of Patients] DESC