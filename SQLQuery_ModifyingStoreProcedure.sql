USE [SQLTutorial]
GO
/****** Object:  StoredProcedure [dbo].[Temp_Employee]    Script Date: 3/25/2023 2:21:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[Temp_Employee]
@JobTitle nvarchar(100)
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
	where JobTitle = @JobTitle
group by JobTitle

select *
From #temp_employee