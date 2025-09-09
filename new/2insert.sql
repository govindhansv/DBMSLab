mysql> INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date)
    -> VALUES
    -> ('HR',        1, NULL, '2020-01-01'),
    -> ('Finance',   2, NULL, '2021-05-15'),
    -> ('IT',        3, NULL, '2019-09-01');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>


mysql> INSERT INTO Employee
    -> (Name, EmployeeID, BirthDate, HouseName, Gender, Salary, SuperEID, Dnumber)
    -> VALUES
    -> ('Alice',   101, '1985-04-12', 'Rose Villa',   'F', 20000, NULL, 1),
    -> ('Bob',     102, '1990-09-21', 'Green House',  'M', 15000, 101, 1),
    -> ('Charlie', 103, '1988-12-02', 'Blue Cottage', 'M', 18000, 101, 2),
    -> ('Diana',   104, '1992-07-18', 'Lake View',    'F', 12000, 103, 2),
    -> ('Eve',     105, '1983-03-05', 'Hill Top',     'F', 22000, 101, 3),
    -> ('Frank',   106, '1995-11-30', 'Sunrise Home', 'M',  8000, 105, 3);
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> UPDATE Department SET ManagerID = 101 WHERE Dnumber = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Department SET ManagerID = 103 WHERE Dnumber = 2;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE Department SET ManagerID = 105 WHERE Dnumber = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql>


mysql> INSERT INTO Project (Pname, Pnumber, Plocation, Dnumber) VALUES
    -> ('Payroll System',         1, 'Kochi',       1),
    -> ('Inventory Management',   2, 'Trivandrum',  2),
    -> ('Banking App',            3, 'Kozhikode',   3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO works_on (EmployeeID, Pnumber, Hours) VALUES
    -> (101, 1, 10),   -- Alice works 10 hours on Payroll System
    -> (101, 2, 5),    -- Alice works 5 hours on Inventory Management
    -> (102, 1, 15),   -- Bob works 15 hours on Payroll System
    -> (103, 2, 20),   -- Charlie works 20 hours on Inventory Management
    -> (104, 2, 10),   -- Diana works 10 hours on Inventory Management
    -> (104, 3, 12),   -- Diana works 12 hours on Banking App
    -> (105, 3, 18),   -- Eve works 18 hours on Banking App
    -> (106, 3, 25);   -- Frank works 25 hours on Banking App
Query OK, 8 rows affected (0.00 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql>
