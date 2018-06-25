SELECT 
	CASE
	WHEN MiddleName IS NULL THEN FirstName + ' '+ LastName
	ELSE FirstName + ' '+MiddleName+ ' '+ LastName
	END
	,
	DATEPART(YEAR,BirthDate)
 FROM Accounts
WHERE DATEPART(YEAR,BirthDate)>1991
ORDER BY DATEPART(YEAR,BirthDate) DESC,FirstName