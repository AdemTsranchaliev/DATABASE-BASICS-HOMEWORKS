SELECT TOP(50)
       e1.EmployeeID,
	   CONCAT(e1.FirstName,' ',e1.LastName),
	   CONCAT(e2.FirstName,' ',e2.LastName),
	   d.Name
  FROM Employees AS e1
  JOIN Employees AS e2
  ON e2.EmployeeID=e1.ManagerID
  JOIN Departments AS d
  ON d.DepartmentID=e1.DepartmentID
ORDER BY e1.EmployeeID