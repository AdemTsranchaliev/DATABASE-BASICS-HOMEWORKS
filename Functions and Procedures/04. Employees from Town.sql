CREATE PROC usp_GetEmployeesFromTown @Town VARCHAR(20)
AS
 BEGIN
	 SELECT e.FirstName,
            e.LastName 
       FROM Employees AS e
       JOIN Addresses AS a
         ON a.AddressID=e.AddressID
       JOIN Towns AS t
         ON t.TownID=a.TownID
	  WHERE t.Name=@Town
 END

 --EXEC usp_GetEmployeesFromTown 'Sofia'


