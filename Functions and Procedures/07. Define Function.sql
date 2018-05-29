CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR(50)) 
RETURNS BIT
AS 
 BEGIN
    DECLARE @Indexer INT = 1;

	WHILE 1=1
		BEGIN
			IF(CHARINDEX(SUBSTRING(@word,@Indexer,1), @setOfLetters) = 0)
			BEGIN
				SET @Indexer-=1;
				BREAK;
			END
			IF(@Indexer=LEN(@word))
			BEGIN				
				BREAK;
			END
			SET @Indexer+=1;
			
		END
	IF(@Indexer=LEN(@word))
		BEGIN
			RETURN 1
		END
	
		RETURN 0
 END

--SELECT FirstName FROM Employees
--WHERE dbo.ufn_IsWordComprised('oistmiahf',FirstName)=1

