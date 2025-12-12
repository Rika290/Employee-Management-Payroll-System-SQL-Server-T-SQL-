USE EmployeePayrollDB;
-- 1. Adding a new employee to the table
GO
CREATE PROCEDURE AddNewEmployee
@FirstName VARCHAR(10),
@LastName VARCHAR(10),
@Email VARCHAR(25),
@DepartmentID INT,
@JobRoleID INT,
@HireDate DATE
AS
BEGIN 
   INSERT INTO Employee(FirstName,LastName,Email,DepartmentID,JobRoleID,HireDate)
    VALUES(@FirstName,@LastName,@Email,@DepartmentID,@JobRoleID,@HireDate);
END;
GO
-- 2. Update Salary
GO
CREATE PROCEDURE UpdateEmployeeSalary
  @EmployeeID INT,
  @NewAmount DECIMAL(10,2)
 AS 
 BEGIN
  IF @NewAmount <=0
  BEGIN
   PRINT 'Salary amount must be grreater than 0'
  END
  ELSE
 BEGIN
  UPDATE Salary
   SET Amount = @NewAmount
   WHERE EmployeeID = @EmployeeID;
 END
END;
GO
-- 3. Payroll Report
GO
CREATE PROCEDURE GetDepartmentPayrollReport
AS
BEGIN
   SELECT d.DepartmentName,COUNT(e.EmployeeID)AS Total_Employees,SUM(p.NetPay)AS Total
     FROM Employee AS e 
      JOIN Department AS d ON e.DepartmentID = d.DepartmentID
      JOIN Payroll AS p ON e.EmployeeID = p.EmployeeID
       GROUP BY d.DepartmentName;
END;
GO
-- 4. Output Parameter
GO
CREATE PROCEDURE GetEmployeeTotalPayroll
 @EmployeeID INT,
 @TotalPayroll DECIMAL(10,2) OUTPUT
 AS
 BEGIN 
   SELECT @TotalPayroll = SUM(NetPay)
    FROM Payroll
    WHERE EmployeeID = @EmployeeID;
END;
GO
-- Executing Output Parameter:
GO
DECLARE @Result DECIMAL(10,2);
EXEC GetEmployeeTotalPayroll @EmployeeID = 4, @TotalPayroll=@Result OUTPUT;
SELECT @Result AS Total;
GO

--

