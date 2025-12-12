USE EmployeePayrollDB;

-- 1. Get full name of an employee with their ID:
GO
CREATE FUNCTION GetFullName(@EmpID INT)
RETURNS VARCHAR(50)
AS
BEGIN
  DECLARE @Name VARCHAR(50);

  SELECT @Name = FirstName + ' ' + LastName 
  FROM Employee
  WHERE EmployeeID=@EmpID;

  RETURN @Name;
END;
GO
-- Executing Function - 1:
SELECT EmployeeID, dbo.GetFullName(EmployeeID) AS FullName
FROM Employee
ORDER BY EmployeeID;

-- 2. Get Total Payroll:
GO
CREATE FUNCTION GetTotalPayroll(@EmpID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
 DECLARE @Total DECIMAL(10,2);

 SELECT @Total = SUM(NetPay)
 FROM Payroll
 WHERE EmployeeID = @EmpID
 GROUP BY EmployeeID;

 RETURN @Total;
END;
GO
-- Executing Function - 2:
SELECT EmployeeID,dbo.GetTotalPayroll(EmployeeID) AS TotalPayroll
FROM Employee
ORDER BY EmployeeID;

