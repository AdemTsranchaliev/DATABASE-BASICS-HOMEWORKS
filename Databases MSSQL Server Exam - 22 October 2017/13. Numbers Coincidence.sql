SELECT u.Username FROM Reports AS r
JOIN Users AS u
ON u.Id=r.UserId
JOIN Categories AS c
ON c.Id=r.CategoryId
WHERE (u.Username LIKE '[0-9]%' AND SUBSTRING(u.Username,1,1) IN (SELECT CategoryId FROM Reports WHERE UserId=r.UserId)) OR (u.Username LIKE '%[0-9]' AND RIGHT(u.Username,1) IN (SELECT CategoryId FROM Reports WHERE UserId=r.UserId))
GROUP BY u.Username
ORDER BY u.Username


