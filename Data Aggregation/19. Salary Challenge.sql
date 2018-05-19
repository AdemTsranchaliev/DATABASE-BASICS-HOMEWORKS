SELECT TOP(10) FirstName,LastName,DepartmentID FROM Employees AS E1
WHERE Salary>(
SELECT AVG(Salary)
FROM Employees AS E2
GROUP BY DepartmentID 
HAVING E1.DepartmentId=E2.DepartmentID)
ORDER BY DepartmentID

