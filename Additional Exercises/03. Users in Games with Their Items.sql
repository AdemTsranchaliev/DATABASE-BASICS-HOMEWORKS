SELECT u.Username,g.Name,COUNT(uga.ItemId),SUM(i.Price) FROM UserGameItems AS uga
JOIN UsersGames AS ug
ON ug.Id=uga.UserGameId
JOIN Games AS g
ON g.Id=ug.GameId
JOIN Users AS u
ON u.Id=ug.UserId
JOIN Items AS i
ON i.Id=uga.ItemId
GROUP BY u.Username,g.Name
HAVING COUNT(uga.ItemId)>=10
ORDER BY COUNT(uga.ItemId) DESC,SUM(i.Price) DESC,u.Username

