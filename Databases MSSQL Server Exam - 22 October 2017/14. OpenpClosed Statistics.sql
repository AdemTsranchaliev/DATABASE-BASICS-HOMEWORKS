SELECT e.FirstName + ' ' + e.LastName AS fullName,CONCAT(ISNULL(cloesedCount,'0'),'/',ISNULL(opensCount,'0')) FROM Employees AS e
JOIN(SELECT r1.EmployeeId, COUNT(*) AS opensCount FROM Reports AS r1 WHERE DATEPART(YEAR,r1.OpenDate)=2016 GROUP BY EmployeeId) AS OP ON e.Id=OP.EmployeeId
LEFT JOIN(SELECT r1.EmployeeId, COUNT(*) AS cloesedCount  FROM Reports AS r1 WHERE DATEPART(YEAR,r1.CloseDate)=2016 GROUP BY EmployeeId) AS CP ON e.Id=CP.EmployeeId
ORDER BY fullName,e.Id