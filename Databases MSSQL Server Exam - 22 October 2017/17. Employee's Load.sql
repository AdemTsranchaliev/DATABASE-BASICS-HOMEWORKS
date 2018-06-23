CREATE FUNCTION udf_GetReportsCount(@employeeId INT, @statusId INT)
RETURNS INT
AS
 BEGIN
	DECLARE @Result INT=(SELECT TOP(1) COUNT(*) FROM Reports WHERE EmployeeId=@employeeId AND StatusId=@statusId );	
	RETURN @Result
 END
