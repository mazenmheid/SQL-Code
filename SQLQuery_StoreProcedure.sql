/*
  Stored Procedure 
*/

/*Create Procedure Test
As
Select *
From EmployeeDemographics


EXEC Test  -- Execute */

Create Procedure Temp_Employee
As
create table  #temp_employee(
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
Avgsalary int
)
Insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

select *
From #temp_employee


--Let us execute it
EXEC Temp_Employee @JobTitle = 'Salesman'