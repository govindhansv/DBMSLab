1️⃣ Insert a single record into Department

INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date)
VALUES ('Research', 1, NULL, '2025-08-05');


2️⃣ Insert multiple Employee records in a single command

INSERT INTO Employee (Name, EmployeeID, BirthDate, HouseName, Gender, Salary, SuperEID, Dnumber)
VALUES 
('John Doe', 101, '1990-05-10', 'Rose Villa', 'M', 12000, NULL, 1),
('Jane Smith', 102, '1992-08-20', 'Sunshine House', 'F', 18000, 101, 1),
('Raj Kumar', 103, '1988-11-15', 'Lotus Villa', 'M', 9000, 101, 1);


3️⃣ Update salary > 10000 to 15000

UPDATE Employee
SET Salary = 15000
WHERE Salary > 10000;

