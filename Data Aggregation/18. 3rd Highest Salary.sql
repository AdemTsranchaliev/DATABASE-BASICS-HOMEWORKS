SELECT DepartmentID,Salary FROM(
SELECT DepartmentID,Salary,RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS Numbers
FROM Employees AS E1
GROUP BY DepartmentID,Salary
) AS RankedSalaries
WHERE Numbers=3;