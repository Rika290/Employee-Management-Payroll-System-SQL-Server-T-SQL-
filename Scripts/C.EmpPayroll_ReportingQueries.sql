USE EmployeePayrollDB;
-- 1. List all employees with Department, Job Role, and Salary
SELECT e.EmployeeID, e.FirstName, e.LastName,
  d.DepartmentName, j.RoleName, s.Amount
  FROM Employee AS e 
   JOIN Department AS d ON e.DepartmentID = d.DepartmentID
   JOIN JobRole AS j ON e.JobRoleID = j.JobRoleID
   JOIN Salary AS s ON e.EmployeeID = s.EmployeeID;
-- 2. Employees and their total payroll
SELECT e.EmployeeID,e.FirstName,
  SUM(p.NetPay) AS Total_Payroll
  FROM Employee AS e
   JOIN Payroll AS p
   ON e.EmployeeID = p.EmployeeID
    GROUP BY e.EmployeeID,e.FirstName;
-- 3. Top 3 employees by salary per department using CTE & RANK
WITH TOP_3 AS (
SELECT d.DepartmentName AS Department,e.FirstName AS Name,
 s.Amount AS Salary,
 RANK()OVER(PARTITION BY d.DepartmentName ORDER BY s.Amount DESC) AS rk
  FROM Employee AS e 
    JOIN Department AS d ON e.DepartmentID = d.DepartmentID
    JOIN Salary AS s ON e.EmployeeID = s.EmployeeID)     
 SELECT Department,Name,Salary
  FROM TOP_3
   WHERE rk<3;
-- 4. Employees earning above department average (subquery)
SELECT e.EmployeeID,e.FirstName, s.Amount AS Salary
 FROM Employee AS e
  JOIN Salary AS s ON e.EmployeeID = s.EmployeeID
  WHERE s.Amount>(
   SELECT AVG(s1.Amount) FROM Salary AS s1
   JOIN Employee AS e1 ON e1.EmployeeID = s1.EmployeeID
   WHERE e1.DepartmentID = e.DepartmentID);
-- 5. Attendance summary per employee
SELECT e.EmployeeID, e.FirstName AS Employee,
 SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS DaysPresent,
 SUM(CASE WHEN a.Status = 'Absent' THEN 1 ELSE 0 END) AS DaysAbsent
  FROM Employee AS e
  JOIN Attendance AS a ON e.EmployeeID = a.EmployeeID
  GROUP BY e.EmployeeID, e.FirstName;
-- 6. Latest salary of each employee
WITH TP AS(SELECT e.EmployeeID AS ID, e.FirstName AS Name, 
s.Amount AS Salary, s.EffectiveDate AS Date,
           ROW_NUMBER() OVER (
               PARTITION BY s.EmployeeID 
               ORDER BY s.EffectiveDate DESC
           ) AS rn
    FROM Employee e
    JOIN Salary s ON e.EmployeeID = s.EmployeeID)
 SELECT ID, Name, Salary, Date FROM TP WHERE rn = 1;
-- 7. Payroll ranking by NetPay
WITH TOP_RK AS (
 SELECT d.DepartmentName AS Department,e.EmployeeID AS ID,
 e.FirstName AS Name,p.NetPay AS Pay,
  DENSE_RANK()OVER(PARTITION BY d.DepartmentName ORDER BY p.NetPay DESC)AS rk
   FROM Employee AS e 
    JOIN Payroll AS p ON e.EmployeeID = p.EmployeeID
    JOIN Department AS d ON e.DepartmentID = d.DepartmentID)
 SELECT Department, ID, Name,Pay
 FROM TOP_RK
  WHERE rk=1;
-- 8. Department-wise total payroll
SELECT d.DepartmentName, SUM(p.NetPay)AS Total_payroll
  FROM Department AS d 
  JOIN Employee AS e ON d.DepartmentID = e.DepartmentID
  JOIN Payroll AS p ON e.EmployeeID = p.EmployeeID
   GROUP BY d.DepartmentName;
-- 9. Employees with no payroll yet
SELECT e.FirstName AS Employee
  FROM Employee AS e 
   LEFT JOIN Payroll AS p ON e.EmployeeID = p.EmployeeID
   WHERE p.EmployeeID IS NULL;
-- 10. Employee salary vs department average
SELECT e1.EmployeeID,e1.FirstName,d1.departmentName AS Department, 
s1.Amount AS Salary,
  (SELECT AVG(s2.Amount) FROM Employee AS e2 
   JOIN Salary AS s2 ON e2.EmployeeID = s2.EmployeeID
    WHERE e1.DepartmentID = e2.DepartmentID)AS Dept_Avg
 FROM Employee AS e1 
  JOIN Salary AS s1 ON e1.EmployeeID = s1.EmployeeID
  JOIN Department AS d1 ON e1.DepartmentID = d1.DepartmentID;
-- 11. Employees with atleast 1 absence
SELECT e.EmployeeID,e.FirstName
  FROM Employee AS e 
  JOIN Attendance AS a ON e.EmployeeID = a.EmployeeID
  WHERE a.Status = 'Absent'
  GROUP BY e.EmployeeID, e.FirstName
  HAVING COUNT(*)>=1;


