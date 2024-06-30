use project_hr;
select * from hr2;

-- data cleaning and preprocessing --
alter table hr2
change column EmployeeID ID varchar(20); 
describe hr2;
 
 -- ave hourly rate of male research scientist --
select Gender,
avg(case when JobRole = 'Research Scientist' then HourlyRate end) 
as avg_HourlyRate
from hr2
group by Gender;

-- Average working years for each Department --
select Department,
avg(TotalWorkingYears) as avg_wirkingyears
from hr2
group by Department;

-- Attrition rate Vs Year since last promotion relation --
select YearsSinceLastPromotion,
 round((count(case when Attrition = 'yes' then 1 end)/count(*))*100,2) as attrition_rate 
 from hr2
 group by YearsSinceLastPromotion
 order by YearsSinceLastPromotion;

select * from hr2;

select Gender, count(*) as count
from hr2
group by Gender;

--  what is the Attdrition breakdown of employees in the company--
select Attrition, count(*) as count
from hr2
group by Attrition;

--  what is the age distribution of employees in the company--
select 
       case
           when age>=18 and age<=24 then '18-24'
           when age>=25 and age<=34 then '25-34'
           when age>=35 and age<=44 then '35-44'
           when age>=45 and age<=54 then '45-54'
           when age>=55 and age<=64 then '55-64'
           else '65+'
           
        end as age_group,
        count(*) as count 
        from hr2
        group by age_group
        order by age_group;
        
--  how does the gender distribution vary acorss Department and JobRole-- 
select * from hr2;
select Department, JobRole, Gender, count(*) as count 
from hr2 
group by Department , JobRole , Gender 
order by Department , JobRole , Gender; 

--  what is the distribution of jobrole acorss the company---
select jobrole, count(*) as count 
from hr2
group by jobrole;

-- Average Attrition rate for all Departments --
select * from hr2;
select department, 
          count(*) as total_count,
          round((count(case when Attrition = 'yes' then 1 end)/count(*))*100,2) as attrition_rate 
          from hr2
          group by department 
          order by attrition_rate;
        
