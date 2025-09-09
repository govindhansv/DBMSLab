
mysql> use govi;
Database changed
mysql> CREATE TABLE Department (
    ->     Dname VARCHAR(50) NOT NULL UNIQUE,
    ->     Dnumber INT PRIMARY KEY,
    ->     ManagerID INT,
    ->     Mgr_start_date DATE NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Employee (
    ->     Name VARCHAR(50) NOT NULL,
    ->     EmployeeID INT PRIMARY KEY,
    ->     BirthDate DATE,
    ->     HouseName VARCHAR(100),
    ->     Gender CHAR(1),
    ->     Salary DECIMAL(10,2) CHECK (Salary BETWEEN 5000 AND 25000),
    ->     SuperEID INT,
    ->     Dnumber INT,
    ->     FOREIGN KEY (SuperEID) REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> ALTER TABLE Department
    -> ADD CONSTRAINT fk_manager FOREIGN KEY (ManagerID)
    -> REFERENCES Employee(EmployeeID);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE DeptLocations (
    ->     Dnumber INT,
    ->     Dlocation VARCHAR(100),
    ->     PRIMARY KEY (Dnumber, Dlocation),
    ->     FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE Project (
    ->     Pname VARCHAR(50) NOT NULL,
    ->     Pnumber INT PRIMARY KEY,
    ->     Plocation VARCHAR(100),
    ->     Dnumber INT NOT NULL,
    ->     FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> CREATE TABLE Works_on (
    ->     EmployeeID INT,
    ->     Pnumber INT,
    ->     Hours DECIMAL(4,1) NOT NULL,
    ->     PRIMARY KEY (EmployeeID, Pnumber),
    ->     FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    ->     FOREIGN KEY (Pnumber) REFERENCES Project(Pnumber)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Dependent (
    ->     EmployeeID INT,
    ->     DependName VARCHAR(50) NOT NULL,
    ->     Sex CHAR(1),
    ->     BirthDate DATE,
    ->     Relationship VARCHAR(50),
    ->     PRIMARY KEY (EmployeeID, DependName),
    ->     FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql>



mysql> show tables;
+----------------+
| Tables_in_govi |
+----------------+
| department     |
| dependent      |
| deptlocations  |
| employee       |
| project        |
| works_on       |
+----------------+
6 rows in set (0.00 sec)

mysql>


mysql> INSERT INTO Employee (Name, EmployeeID, BirthDate, HouseName, Gender, Salary, SuperEID, Dnumber) VALUES
    -> ('Alice',   101, '1985-04-12', 'Rose Villa',   'F', 20000, NULL, 1),
    -> ('Bob',     102, '1990-09-21', 'Green House',  'M', 15000, 101, 1),
    -> ('Charlie', 103, '1988-12-02', 'Blue Cottage', 'M', 18000, 101, 2),
    -> ('Diana',   104, '1992-07-18', 'Lake View',    'F', 12000, 103, 2),
    -> ('Eve',     105, '1983-03-05', 'Hill Top',     'F', 22000, 101, 3),
    -> ('Frank',   106, '1995-11-30', 'Sunrise Home', 'M',  8000, 105, 3);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+---------+------------+------------+--------------+--------+----------+----------+---------+
| Name    | EmployeeID | BirthDate  | HouseName    | Gender | Salary   | SuperEID | Dnumber |
+---------+------------+------------+--------------+--------+----------+----------+---------+
| Alice   |        101 | 1985-04-12 | Rose Villa   | F      | 20000.00 |     NULL |       1 |
| Bob     |        102 | 1990-09-21 | Green House  | M      | 15000.00 |      101 |       1 |
| Charlie |        103 | 1988-12-02 | Blue Cottage | M      | 18000.00 |      101 |       2 |
| Diana   |        104 | 1992-07-18 | Lake View    | F      | 12000.00 |      103 |       2 |
| Eve     |        105 | 1983-03-05 | Hill Top     | F      | 22000.00 |      101 |       3 |
| Frank   |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
+---------+------------+------------+--------------+--------+----------+----------+---------+
6 rows in set (0.00 sec)

mysql>


mysql> UPDATE Department SET ManagerID = 102 WHERE Dnumber = 4;  -- Finance -> Bob
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Department SET ManagerID = 101 WHERE Dnumber = 1;  -- HR -> Alice
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Department SET ManagerID = 103 WHERE Dnumber = 2;  -- IT -> Charlie
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Department SET ManagerID = 105 WHERE Dnumber = 3;  -- Sales -> Eve
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>

INSERT INTO WORKS_ON TABLE

mysql> INSERT INTO works_on (EmployeeID, Pnumber, Hours) VALUES
    -> (101, 1, 10),   -- Alice works 10 hours on Website
    -> (101, 2, 5),    -- Alice works 5 hours on Database
    -> (102, 1, 15),   -- Bob works 15 hours on Website
    -> (103, 2, 20),   -- Charlie works 20 hours on Database
    -> (104, 2, 10),   -- Diana works 10 hours on Database
    -> (104, 3, 12),   -- Diana works 12 hours on MobileApp
    -> (105, 3, 18),   -- Eve works 18 hours on MobileApp
    -> (106, 3, 25);   -- Frank works 25 hours on MobileApp
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql>

INSERT INTO PROJECT TABLE

mysql> INSERT INTO Project (Pname, Pnumber, Plocation, Dnumber) VALUES
    -> ('Payroll System', 1, 'Kochi', 1),
    -> ('Inventory Management', 2, 'Trivandrum', 2),
    -> ('Banking App', 3, 'Kozhikode', 3);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0


