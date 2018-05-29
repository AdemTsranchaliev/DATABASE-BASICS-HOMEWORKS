CREATE PROC usp_GetTownsStartingWith @String VARCHAR(20)
AS 
 BEGIN
	SELECT Name 
	  FROM Towns
	WHERE SUBSTRING(Name,1,LEN(@String))=@String
 END

 --EXEC usp_GetTownsStartingWith Sof