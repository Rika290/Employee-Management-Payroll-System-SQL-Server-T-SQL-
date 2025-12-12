USE EmployeePayrollDB;
-- 1. Creating index:
GO
CREATE NONCLUSTERED INDEX idx_emp_dept
ON Employee(DepartmentID);
GO