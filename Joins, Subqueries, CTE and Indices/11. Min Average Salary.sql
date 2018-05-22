SELECT MIN(s) 
FROM 
(
  SELECT AVG(Salary) AS s 
    FROM Employees
GROUP BY DepartmentID 
) AS table1