create database salary;
use salary;

-- show all columns and rows in the table.
select * from salaries

-- show only employeeName and JobTitle.
select EmployeeName, JobTitle
from salaries;

-- show the number of employees in the table.
select count(*) from salaries;

-- show the unique jobtitles in the table.
select distinct JobTitle from salaries;

-- count of unique job titles
select count(distinct JobTitle) from salaries;

-- show job title and pay where overtime pay> 50000
select JobTitle, OvertimePay
from salaries
where OvertimePay>50000;

-- show avg base pay for all the employees
select avg(basepay) as AvgBasePay 
from salaries;

-- show the top highest paid employees
select EmployeeName, TotalPay
from salaries
order by TotalPay desc limit 10;

-- show the avg basepay, overtime pay and other pay for each employee
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as AvgPay 
from salaries;

-- Show all the employees who have the word "Manager" in their job title.
select EmployeeName, JobTitle
from salaries
where JobTitle like '%Manager%';

-- show all the employees who does not have "Manager" in their job title.
select EmployeeName, JobTitle
from salaries
where JobTitle not like '%Manager%';

-- show all the employee with a total pay between 50000 and 75000
select * from salaries
where TotalPay >=50000 and TotalPay <=75000;

-- show all the employees with a base pay less than 50000 or a total pay greater than 100000
select * from salaries
where BasePay < 50000 or TotalPay > 100000;

-- show all the employees with a total pay benefits value between 125000 and 150000
-- and a job title containing the word "Director".
select * from salaries
where TotalPayBenefits between 125000 and 150000
and JobTitle like '%Director%';

-- show all employees ordered by their total pay benefits in descending order
select * from salaries
order by TotalPayBenefits desc;

-- show all the job titles with an avg base pay of atleast 10000 and order by the average base pay in descending order
select JobTitle, avg(BasePay)
from salaries
group by JobTitle
having avg(BasePay) > '10000'
order by avg(BasePay) desc;

-- Update the base pay of all the employees with the job title containing "Manager"by increasing it to 10%.
update salaries
set BasePay = BasePay * 1.1
where JobTitle like "%Manager%";

select * from salaries;

-- Delete all employees who have no OverTimePay
select * from salaries
where OverTimePay = 0;
delete from salaries
where OverTimePay = 0;