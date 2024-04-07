create schema cars;
use cars;
-- read data---
select * from car_dekho;
-- total cars : to get count of total records
select count(*) from car_dekho;
-- How many cars will be available in 2023?
select count(*) from car_dekho where year = 2023;
-- Cars available in 2020, 2021 and 2022?
select year, count(*) from car_dekho where year in (2020, 2021, 2022) group by year;
-- print total of all cars by year
select year, count(*) from car_dekho group by year;
-- Client asked car dealer agent How many disel cars will be available in 2020?
select count(*) from car_dekho where year = 2020 and fuel = 'Diesel';
-- Client asked car dealer agent How many petrol cars will be available in 2020?
select count(*) from car_dekho where year = 2020 and fuel = 'Petrol';
-- Get the details of all the fuel cars by all year
select year, count(*) from car_dekho where fuel = "Diesel" group by year;
select year, count(*) from car_dekho where fuel = "Petrol" group by year;
select year, count(*) from car_dekho where fuel = "CNG" group by year;
-- there were more than 100 cars given in an year, which year had more than 100 cars?
select year, count(*) from car_dekho group by year having count(*) > 100;
-- Car count between 2015 and 2023
select count(*) from car_dekho where year between 2015 and 2023;
-- Car details between 2015 and 2023
select * from car_dekho where year between 2015 and 2023;


