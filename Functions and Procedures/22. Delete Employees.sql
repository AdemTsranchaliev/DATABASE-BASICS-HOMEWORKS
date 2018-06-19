CREATE TABLE Deleted_Employees
(
 EmployeeId INT PRIMARY KEY IDENTITY,
 FirstName VARCHAR(60) NOT NULL,
 LastName VARCHAR(60) NOT NULL,
 MiddleName VARCHAR(60),
 JobTitle VARCHAR(60) NOT NULL,
 DepartmentId INT REFERENCES Departments(DepartmentId),
 Salary MONEY 
)

CREATE TRIGGER t_FireEmployee ON Employees AFTER DELETE
AS
BEGIN
 INSERT INTO Deleted_Employees(FirstName,LastName,MiddleName,JobTitle,DepartmentId,Salary)
 SELECT d.FirstName,d.LastName,d.MiddleName,d.JobTitle,d.DepartmentID,d.Salary FROM deleted AS d
END

 