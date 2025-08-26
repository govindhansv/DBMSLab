-- =========================================================
-- 1. DROP tables if already exist (to reset environment)
-- =========================================================
DROP TABLE IF EXISTS Works_on;
DROP TABLE IF EXISTS Dependent;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS DeptLocations;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- =========================================================
-- 2. CREATE TABLES (without circular foreign keys first)
-- =========================================================

-- Department table (without ManagerID foreign key for now)
CREATE TABLE Department (
    Dname VARCHAR(50) NOT NULL UNIQUE,
    Dnumber INT PRIMARY KEY,
    ManagerID INT, -- FK will be added later
    Mgr_start_date DATE NOT NULL
);

-- Employee table (without Dnumber foreign key for now)
CREATE TABLE Employee (
    Name VARCHAR(50) NOT NULL,
    EmployeeID INT PRIMARY KEY,
    BirthDate DATE,
    HouseName VARCHAR(100),
    Gender ENUM('M', 'F', 'Other'),
    Salary DECIMAL(10,2) CHECK (Salary >= 5000 AND Salary <= 25000),
    SuperEID INT,
    Dnumber INT, -- FK will be added later
    FOREIGN KEY (SuperEID) REFERENCES Employee(EmployeeID)
);

-- DeptLocations table
CREATE TABLE DeptLocations (
    Dnumber INT,
    Dlocation VARCHAR(50),
    PRIMARY KEY (Dnumber, Dlocation)
);

-- Project table
CREATE TABLE Project (
    Pname VARCHAR(50) NOT NULL,
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(50),
    Dnumber INT NOT NULL
);

-- Works_on table
CREATE TABLE Works_on (
    EmployeeID INT,
    Pnumber INT,
    Hours DECIMAL(5,2) NOT NULL
);

-- Dependent table
CREATE TABLE Dependent (
    EmployeeID INT,
    DependName VARCHAR(50) NOT NULL,
    Sex ENUM('M', 'F', 'Other'),
    BirthDate DATE,
    Relationship VARCHAR(50),
    PRIMARY KEY (EmployeeID, DependName)
);

-- =========================================================
-- 3. INSERT SAMPLE DATA
-- =========================================================

-- Department sample data
INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date) VALUES
('Research', 1, NULL, '2025-08-01'),
('Development', 2, NULL, '2025-08-02');

-- Employee sample data
INSERT INTO Employee (Name, EmployeeID, BirthDate, HouseName, Gender, Salary, SuperEID, Dnumber) VALUES
('John Doe', 101, '1990-05-10', 'Rose Villa', 'M', 12000, NULL, 1),
('Jane Smith', 102, '1992-08-20', 'Sunshine House', 'F', 18000, 101, 1),
('Raj Kumar', 103, '1988-11-15', 'Lotus Villa', 'M', 9000, 101, 1),
('Priya Menon', 104, '1995-02-25', 'Green Villa', 'F', 22000, NULL, 2);

-- DeptLocations sample data
INSERT INTO DeptLocations (Dnumber, Dlocation) VALUES
(1, 'New York'),
(1, 'Boston'),
(2, 'Chicago');

-- Project sample data
INSERT INTO Project (Pname, Pnumber, Plocation, Dnumber) VALUES
('P1', 1001, 'New York', 1),
('P2', 1002, 'Chicago', 2);

-- Works_on sample data
INSERT INTO Works_on (EmployeeID, Pnumber, Hours) VALUES
(101, 1001, 20),
(102, 1001, 15),
(103, 1002, 10);

-- Dependent sample data
INSERT INTO Dependent (EmployeeID, DependName, Sex, BirthDate, Relationship) VALUES
(101, 'Alice Doe', 'F', '2010-06-15', 'Daughter'),
(102, 'Bob Smith', 'M', '2012-09-10', 'Son');

-- =========================================================
-- 4. ADD FOREIGN KEYS (after inserting base data)
-- =========================================================

ALTER TABLE Employee
ADD CONSTRAINT fk_employee_dnumber FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Department
ADD CONSTRAINT fk_department_managerid FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID);

ALTER TABLE DeptLocations
ADD CONSTRAINT fk_deptlocations_dnumber FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Project
ADD CONSTRAINT fk_project_dnumber FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber);

ALTER TABLE Works_on
ADD CONSTRAINT fk_workson_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
ADD CONSTRAINT fk_workson_project FOREIGN KEY (Pnumber) REFERENCES Project(Pnumber);

ALTER TABLE Dependent
ADD CONSTRAINT fk_dependent_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

-- =========================================================
-- 5. UPDATE FOREIGN KEY COLUMNS (manager assignments)
-- =========================================================
UPDATE Department SET ManagerID = 101 WHERE Dnumber = 1;
UPDATE Department SET ManagerID = 104 WHERE Dnumber = 2;

-- =========================================================
-- 6. TEST DML COMMANDS
-- =========================================================

-- 1. Insert a single record into Department
INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date)
VALUES ('HR', 3, NULL, '2025-08-05');

-- 2. Insert multiple Employee records in single command
INSERT INTO Employee (Name, EmployeeID, BirthDate, HouseName, Gender, Salary, SuperEID, Dnumber) VALUES
('Amit Sharma', 105, '1991-07-14', 'Palm Residency', 'M', 14000, NULL, 3),
('Neha Verma', 106, '1993-03-10', 'Blue Hills', 'F', 17000, 105, 3);

-- 3. Update salaries > 10000 to 15000
UPDATE Employee
SET Salary = 15000
WHERE Salary > 10000;

-- 4. Move project "P1" from department 1 to department 2
UPDATE Project
SET Dnumber = 2
WHERE Pname = 'P1' AND Dnumber = 1;

-- 5. Delete employees working on "P1"
DELETE FROM Employee
WHERE EmployeeID IN (
    SELECT emp_id FROM (
        SELECT EmployeeID AS emp_id
        FROM Works_on
        WHERE Pnumber = (SELECT Pnumber FROM Project WHERE Pname = 'P1')
    ) AS temp
);
