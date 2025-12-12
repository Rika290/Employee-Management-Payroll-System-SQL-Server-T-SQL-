USE EmployeePayrollDB;
-- 1. Department:
INSERT INTO Department(DepartmentName)
 VALUES('IT'),('HR'),('Finance'),('Operations'),('Sales');
SELECT * FROM Department;
-- 2. JobRole:
INSERT INTO JobRole(RoleName)
 VALUES('Software Engineer'),
('SQL Developer'),
('HR Executive'),
('Accountant'),
('Manager');
SELECT * FROM JobRole;
-- 3. Employee;
INSERT INTO Employee(FirstName,LastName,Email,DepartmentID,JobRoleID,HireDate)
VALUES
 ('Asha','Kumar','asha1@company.com',1,1,'2023-01-10'),
('Ravi','Sharma','ravi2@company.com',1,2,'2023-02-15'),
('Neha','Singh','neha3@company.com',2,3,'2023-03-12'),
('Kiran','Patel','kiran4@company.com',3,4,'2023-01-20'),
('Meena','Iyer','meena5@company.com',4,5,'2023-04-01'),
('Arun','Das','arun6@company.com',1,1,'2023-02-02'),
('Pooja','Nair','pooja7@company.com',1,2,'2023-05-10'),
('Suresh','Rao','suresh8@company.com',2,3,'2023-06-15'),
('Divya','Menon','divya9@company.com',3,4,'2023-07-01'),
('Vikram','Jain','vikram10@company.com',4,5,'2023-08-20'),

('Anita','Kapoor','anita11@company.com',1,1,'2023-01-05'),
('Rahul','Mehta','rahul12@company.com',1,2,'2023-02-08'),
('Sneha','Roy','sneha13@company.com',2,3,'2023-03-11'),
('Naveen','Gupta','naveen14@company.com',3,4,'2023-04-19'),
('Priya','Seth','priya15@company.com',4,5,'2023-05-25'),
('Manoj','Verma','manoj16@company.com',1,1,'2023-06-30'),
('Kavita','Joshi','kavita17@company.com',1,2,'2023-07-10'),
('Amit','Kulkarni','amit18@company.com',2,3,'2023-08-15'),
('Ritika','Malhotra','ritika19@company.com',3,4,'2023-09-01'),
('Sanjay','Bansal','sanjay20@company.com',4,5,'2023-10-12'),

('Deepa','Chopra','deepa21@company.com',1,1,'2023-01-18'),
('Anil','Mishra','anil22@company.com',1,2,'2023-02-21'),
('Nisha','Agarwal','nisha23@company.com',2,3,'2023-03-24'),
('Pankaj','Tiwari','pankaj24@company.com',3,4,'2023-04-28'),
('Shilpa','Pandey','shilpa25@company.com',4,5,'2023-05-30'),
('Rajesh','Khanna','rajesh26@company.com',1,1,'2023-06-02'),
('Monika','Arora','monika27@company.com',1,2,'2023-07-06'),
('Tarun','Saxena','tarun28@company.com',2,3,'2023-08-09'),
('Isha','Bhardwaj','isha29@company.com',3,4,'2023-09-14'),
('Kunal','Aggarwal','kunal30@company.com',4,5,'2023-10-18'),

('Pallavi','Desai','pallavi31@company.com',1,1,'2023-01-22'),
('Abhishek','Reddy','abhishek32@company.com',1,2,'2023-02-26'),
('Swati','Ghosh','swati33@company.com',2,3,'2023-03-29'),
('Nitin','Sawant','nitin34@company.com',3,4,'2023-04-30'),
('Rekha','Pillai','rekha35@company.com',4,5,'2023-05-31'),
('Gaurav','Srivastava','gaurav36@company.com',1,1,'2023-06-05'),
('Bhavya','Lal','bhavya37@company.com',1,2,'2023-07-08'),
('Yogesh','Chandra','yogesh38@company.com',2,3,'2023-08-11'),
('Priti','Nanda','priti39@company.com',3,4,'2023-09-17'),
('Harish','Singhal','harish40@company.com',4,5,'2023-10-20'),

('Lakshmi','Subramanian','lakshmi41@company.com',1,1,'2023-01-25'),
('Vinod','Kannan','vinod42@company.com',1,2,'2023-02-28'),
('Sandhya','R','sandhya43@company.com',2,3,'2023-03-31'),
('Balaji','M','balaji44@company.com',3,4,'2023-04-15'),
('Sowmya','Hegde','sowmya45@company.com',4,5,'2023-05-18'),
('Rohit','Naik','rohit46@company.com',1,1,'2023-06-22'),
('Keerthi','Shetty','keerthi47@company.com',1,2,'2023-07-25'),
('Mahesh','Yadav','mahesh48@company.com',2,3,'2023-08-28'),
('Apoorva','Joshi','apoorva49@company.com',3,4,'2023-09-30'),
('Shankar','I','shankar50@company.com',4,5,'2023-10-25');
SELECT * FROM Employee;
-- 4. Salary:
INSERT INTO Salary(EmployeeID,Amount,EffectiveDate)
 SELECT EmployeeID,
        30000 + (EmployeeID * 500),
        HireDate
 FROM Employee;
SELECT * FROM Salary;
-- 5. Attendance:
INSERT INTO Attendance (EmployeeID, AttendanceDate, Status) VALUES
(1,'2025-01-01','Present'),
(2,'2025-01-01','Present'),
(3,'2025-01-01','Absent'),
(4,'2025-01-01','Present'),
(5,'2025-01-01','Present'),
(6,'2025-01-01','Present'),
(7,'2025-01-01','Absent'),
(8,'2025-01-01','Present'),
(9,'2025-01-01','Present'),
(10,'2025-01-01','Present'),

(11,'2025-01-01','Present'),
(12,'2025-01-01','Absent'),
(13,'2025-01-01','Present'),
(14,'2025-01-01','Present'),
(15,'2025-01-01','Present'),
(16,'2025-01-01','Present'),
(17,'2025-01-01','Absent'),
(18,'2025-01-01','Present'),
(19,'2025-01-01','Present'),
(20,'2025-01-01','Present'),

(21,'2025-01-01','Present'),
(22,'2025-01-01','Present'),
(23,'2025-01-01','Absent'),
(24,'2025-01-01','Present'),
(25,'2025-01-01','Present'),
(26,'2025-01-01','Present'),
(27,'2025-01-01','Absent'),
(28,'2025-01-01','Present'),
(29,'2025-01-01','Present'),
(30,'2025-01-01','Present'),

(31,'2025-01-01','Present'),
(32,'2025-01-01','Absent'),
(33,'2025-01-01','Present'),
(34,'2025-01-01','Present'),
(35,'2025-01-01','Present'),
(36,'2025-01-01','Present'),
(37,'2025-01-01','Absent'),
(38,'2025-01-01','Present'),
(39,'2025-01-01','Present'),
(40,'2025-01-01','Present'),

(41,'2025-01-01','Present'),
(42,'2025-01-01','Absent'),
(43,'2025-01-01','Present'),
(44,'2025-01-01','Present'),
(45,'2025-01-01','Present'),
(46,'2025-01-01','Present'),
(47,'2025-01-01','Absent'),
(48,'2025-01-01','Present'),
(49,'2025-01-01','Present'),
(50,'2025-01-01','Present');

SELECT * FROM Attendance;
-- 6. Payroll:
INSERT INTO Payroll(EmployeeID,PayMonth,NetPay)
VALUES(1,'2025-01',45000),
(2,'2025-01',47000),
(3,'2025-01',48000),
(4,'2025-01',52000),
(5,'2025-01',50000),
(6,'2025-01',46000),
(7,'2025-01',43000),
(8,'2025-01',49000),
(9,'2025-01',53000),
(10,'2025-01',51000),

(11,'2025-01',48000),
(12,'2025-01',45000),
(13,'2025-01',47000),
(14,'2025-01',52000),
(15,'2025-01',55000),
(16,'2025-01',50000),
(17,'2025-01',44000),
(18,'2025-01',49500),
(19,'2025-01',52500),
(20,'2025-01',51000),

(21,'2025-01',47000),
(22,'2025-01',49000),
(23,'2025-01',46000),
(24,'2025-01',52000),
(25,'2025-01',50000),
(26,'2025-01',48000),
(27,'2025-01',45000),
(28,'2025-01',49500),
(29,'2025-01',53000),
(30,'2025-01',51500),

(31,'2025-01',48000),
(32,'2025-01',46000),
(33,'2025-01',49000),
(34,'2025-01',52000),
(35,'2025-01',55000),
(36,'2025-01',50500),
(37,'2025-01',44500),
(38,'2025-01',50000),
(39,'2025-01',53500),
(40,'2025-01',52000),

(41,'2025-01',48000),
(42,'2025-01',46000),
(43,'2025-01',49500),
(44,'2025-01',52500),
(45,'2025-01',55000),
(46,'2025-01',51000),
(47,'2025-01',45000),
(48,'2025-01',50000),
(49,'2025-01',54000),
(50,'2025-01',52000);
SELECT * FROM Payroll;

-- Checking all tables after inserting values:
SELECT * FROM Department;   
SELECT * FROM JobRole;
SELECT * FROM Employee;
SELECT * FROM Salary;
SELECT * FROM Attendance;
SELECT * FROM Payroll;