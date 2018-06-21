SELECT d.Name,ISNULL(CONVErT(VARCHAR,AVG(DATEDIFF(DAY,r.OpenDate,r.CloseDate))),'no info') AS d FROM Departments AS d
JOIN Categories AS c
ON c.DepartmentId=d.Id
JOIN Reports AS r
ON r.CategoryId=c.Id
GROUP BY d.Name
ORDER BY d.Name
