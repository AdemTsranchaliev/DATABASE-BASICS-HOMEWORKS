CREATE PROC usp_AssignEmployeeToReport(@employeeId INT, @reportId INT) 
AS
 BEGIN
	BEGIN TRANSACTION
		DECLARE @EmployeeDep INT =(SELECT DepartmentId FROM Employees WHERE @employeeId=Id);
		DECLARE @ReportDepId INT=(SELECT c.DepartmentId FROM Reports AS r JOIN Categories AS c ON c.Id=r.CategoryId WHERE r.Id=@reportId)
		IF(@EmployeeDep!=@ReportDepId)
			BEGIN
				ROLLBACK
				RAISERROR('Employee doesn''t belong to the appropriate department!',16,1)
				RETURN
			END
		update Reports
		SET EmployeeId=@employeeId
		WHERE @reportId=Id
		COMMIT
 END 




EXEC usp_AssignEmployeeToReport 17, 2;
SELECT EmployeeId FROM Reports WHERE id = 2
