CREATE PROC usp_EmployeesBySalaryLevel  @LevelOfSalary VARCHAR(7)
AS
BEGIN
	SELECT FirstName,
	       LastName
	  FROM Employees
	 WHERE dbo.ufn_GetSalaryLevel(Salary)  = @LevelOfSalary
END

--EXEC dbo.usp_EmployeesBySalaryLevel 'High'