CREATE FUNCTION ufn_CashInUsersGames (@GameName VARCHAR(40))
RETURNS TABLE
AS 
 RETURN (
  SELECT SUM(Cash) AS a
  FROM (
  SELECT Cash,
         ROW_NUMBER() OVER (ORDER BY Cash DESC) AS Ranking
    FROM UsersGames  AS ug
    JOIN Games AS g
      ON g.Name=@GameName
   WHERE g.Id=ug.GameId
   ) AS tb
  WHERE Ranking%2=1)  
 
 --select * from [dbo].ufn_CashInUsersGames('Bali')



 

