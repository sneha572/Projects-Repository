create database insurance;
use insurance;

-- Select all columns for all patients
select * from insurance_data;

-- Display the average claim amount for patients in each region
select avg(claim), region
from insurance_data
group by region;

-- Select the maximum and minimum BMI values in the table
select max(bmi), min(bmi)
from insurance_data;

-- Select the patient ID , age and BMI for the patients with a BMI between 40 and 50.
select PatientID, age, BMI
from insurance_data
where BMI between 40 and 50;

-- Select the number of smokers in each region
select count(patientID), region
from insurance_data
where smoker = 'Yes'
group by region;

-- What is the average claim amount for patients who are both diabetic and smokers?
select avg(claim) as Avg_Claim
from insurance_data
where smoker = 'Yes' and diabetic = 'yes';

-- Retrieve all patients who have a BMI greater than average BMI of patients who are smokers
select * from insurance_data
where BMI > (select avg(BMI) from insurance_data where smoker = 'Yes');

-- Select the average claim amount for patients in each age group - under 18, 18 to 30, 31 to 50 and Over 50.
select
	case when age < 18 then "Under 18"
    when age between 18 and 30 then "18 to 30"
    when age between 31 and 50 then "31 to 50"
    when age > 50 then "Over 50"
end as age_group,
round(avg(claim),2) as Avg_Claim
from insurance_data
group by age_group;

-- Retrieve the total claim amount for each patient along with the average claim amount across the patients.
select PatientID, sum(claim) over(partition by patientId) as total_claim,
avg(claim) over() as Avg_claim
from insurance_data;

-- Retrieve the top 3 patients with the highest claim amount, along with their 
-- respective claim amounts and the total claim amount for all patients
select PatientID, claim, sum(claim) over() as total_claim
from insurance_data
order by claim desc limit 3;

-- Select the details of patients who have a claim amount greater than the average claim amount for their region
select *
from insurance_data t1
where claim > (select avg(claim) from insurance_data t2 where t2.region =t1.region);

select * from(select *, avg(claim) over(partition by region) as avg_claim from insurance_data) as subq
where claim > avg_claim;

-- Retrieve the rank of each patient based on their claim amount
select *, rank() over(order by claim desc) from insurance_data;

-- Select the details of patients along with their claim amount,
-- and their rank based on claim amount within the region
select *, rank() over(partition by region order by claim desc)
from insurance_data;