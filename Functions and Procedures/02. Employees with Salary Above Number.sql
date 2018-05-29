CREATE PROC usp_GetEmployeesSalaryAboveNumber (@Number DECIMAL(18,4) = 0)
AS
 BEGIN
	SELECT FirstName,
	       LastName 
	  FROM Employees
	 WHERE Salary>=@Number
 END


 --EXEC usp_GetEmployeesSalaryAboveNumber 48100