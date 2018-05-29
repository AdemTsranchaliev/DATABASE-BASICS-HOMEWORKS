CREATE PROC usp_GetHoldersWithBalanceHigherThan @Balance MONEY
AS
 BEGIN	
	SELECT ah.FirstName,ah.LastName FROM 
	(
	 SELECT AccountHolderId,SUM(Balance) as BalanceOfAllAcounts FROM Accounts GROUP BY AccountHolderId
	)  AS a
	JOIN AccountHolders AS ah
	ON ah.Id=a.AccountHolderId
	WHERE a.BalanceOfAllAcounts > @Balance
	ORDER BY ah.LastName,ah.FirstName
 END



-- EXEC dbo.usp_GetHoldersWithBalanceHigherThan 1000000


