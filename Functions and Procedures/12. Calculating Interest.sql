CREATE PROC usp_CalculateFutureValueForAccount @AccountId INT, @InterestRate FLOAT
AS
 BEGIN
	SELECT ah.Id,
	       ah.FirstName,
		   ah.LastName,
		   a.Balance,
		   dbo.ufn_CalculateFutureValue(a.Balance,@InterestRate,5)
	  FROM AccountHolders AS ah
	  JOIN Accounts AS a
	    ON a.Id=ah.Id
	  WHERE @AccountId=a.Id
 END

 --EXEC dbo.usp_CalculateFutureValueForAccount 1,0.1


