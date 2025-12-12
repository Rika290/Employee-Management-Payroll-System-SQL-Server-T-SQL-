-- EmployeePayrollDB
-- 1. Creating Database:
CREATE DATABASE EmployeePayrollDB;
GO
USE EmployeePayrollDB;
GO
-- 2. Creating Tables:
-- 1. Department:
CREATE TABLE Department(
 DepartmentID INT IDENTITY PRIMARY KEY,
 DepartmentName VARCHAR(50) NOT NULL UNIQUE);
-- 2. JobRole:
CREATE TABLE JobRole(
 JobRoleID INT IDENTITY PRIMARY KEY,
 RoleName VARCHAR(50) NOT NULL UNIQUE);
-- 3. Employee:
CREATE TABLE Employee(
 EmployeeID INT IDENTITY PRIMARY KEY,
 FirstName VARCHAR(50) NOT NULL,
 LastName VARCHAR(50) NOT NULL,
 Email VARCHAR(50) NOT NULL UNIQUE,
 DepartmentID INT NOT NULL 
       REFERENCES Department(DepartmentID),
 JobRoleID INT NOT NULL 
       REFERENCES JobRole(JobRoleID),
 HireDate DATE NOT NULL,
 IsActive BIT DEFAULT 1    
);
-- 4. Salary:
CREATE TABLE Salary(
 EmployeeID INT PRIMARY KEY 
      REFERENCES Employee(EmployeeID),
 Amount DECIMAL(10,2) CHECK (Amount >0),
 EffectiveDate DATE NOT NULL
);
-- 5. Attendance:
CREATE TABLE Attendance(
  AttendanceID INT IDENTITY PRIMARY KEY,
  EmployeeID INT NOT NULL
        REFERENCES Employee(EmployeeID),
  AttendanceDate DATE NOT NULL,
  Status VARCHAR(10) CHECK (Status IN ('Present','Absent'))
);
-- 6. Payroll:
CREATE TABLE Payroll(
 PayrollID INT IDENTITY PRIMARY KEY,
 EmployeeID INT NOT NULL
      REFERENCES Employee(EmployeeID),
 PayMonth VARCHAR(7),
 NetPay DECIMAL(10,2) CHECK (NetPay>0)
);

  
