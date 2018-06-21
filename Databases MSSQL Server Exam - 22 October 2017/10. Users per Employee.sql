SELECT CONCAT(e.FirstName,' ',e.LastName), COUNT(r.UserId) FROM Employees AS e
LEFT JOIN Reports AS r
ON r.EmployeeId=e.Id
GROUP BY CONCAT(e.FirstName,' ',e.LastName)
ORDER BY COUNT(r.UserId) DESC,CONCAT(e.FirstName,' ',e.LastName) ASC