SELECT e.EmployeeID,
       e.FirstName,
 CASE
  WHEN p.StartDate>='2005-01-01' THEN NULL
  WHEN p.StartDate<'2005-01-01' THEN p.Name
 END
  FROM Employees AS e
  JOIN EmployeesProjects as ep
  ON   ep.EmployeeID = e.EmployeeID
  JOIN Projects as p
  ON   p.ProjectID = ep.ProjectID
WHERE e.EmployeeID=24