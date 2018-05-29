CREATE FUNCTION ufn_GetSalaryLevel(@salary money)
RETURNS VARCHAR(10)
AS 
 BEGIN
	DECLARE @salaryLevel  VARCHAR(10)='High';

	IF(@salary<30000)
	BEGIN
		SET @salaryLevel='Low';
	END
	ELSE IF(@salary>=30000 AND @salary<50000 )
	BEGIN
		SET @salaryLevel='Average';
	END	
	RETURN @salaryLevel;
 END

--SELECT Salary,dbo.ufn_GetSalaryLevel(Salary) FROM Employees