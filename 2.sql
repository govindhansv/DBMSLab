

1.  Insert a single record into department table. 

mysql> INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date)
    -> VALUES ('Finance', 4, NULL, '2022-05-01');
Query OK, 1 row affected (0.00 sec)

2. Insert more than a record into Employee table using a single insert command. 

mysql> INSERT INTO Department (Dname, Dnumber, ManagerID, Mgr_start_date)
    -> VALUES ('HR', 1, NULL, '2021-03-15'),
    ->        ('IT', 2, NULL, '2020-07-10'),
    ->        ('Sales', 3, NULL, '2023-01-05');
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM DEPARTMENT;
+---------+---------+-----------+----------------+
| Dname   | Dnumber | ManagerID | Mgr_start_date |
+---------+---------+-----------+----------------+
| HR      |       1 |      NULL | 2021-03-15     |
| IT      |       2 |      NULL | 2020-07-10     |
| Sales   |       3 |      NULL | 2023-01-05     |
| Finance |       4 |      NULL | 2022-05-01     |
+---------+---------+-----------+----------------+
4 rows in set (0.00 sec)

mysql>


3. Update the employee table to set the salary of all employees to Rs15000/- who are getting a  
  salary>10,000. 


mysql> UPDATE Employee
    -> SET Salary = 15000
    -> WHERE Salary > 10000;
Query OK, 4 rows affected (0.02 sec)
Rows matched: 5  Changed: 4  Warnings: 0

mysql> SELECT * FROM EMPLOYEE;
+---------+------------+------------+--------------+--------+----------+----------+---------+
| Name    | EmployeeID | BirthDate  | HouseName    | Gender | Salary   | SuperEID | Dnumber |
+---------+------------+------------+--------------+--------+----------+----------+---------+
| Alice   |        101 | 1985-04-12 | Rose Villa   | F      | 15000.00 |     NULL |       1 |
| Bob     |        102 | 1990-09-21 | Green House  | M      | 15000.00 |      101 |       1 |
| Charlie |        103 | 1988-12-02 | Blue Cottage | M      | 15000.00 |      101 |       2 |
| Diana   |        104 | 1992-07-18 | Lake View    | F      | 15000.00 |      103 |       2 |
| Eve     |        105 | 1983-03-05 | Hill Top     | F      | 15000.00 |      101 |       3 |
| Frank   |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
+---------+------------+------------+--------------+--------+----------+----------+---------+
6 rows in set (0.00 sec)

mysql>

4. Move a project “P1” of department no D1 to another department D2. 

mysql> select * from project;
+----------------------+---------+------------+---------+
| Pname                | Pnumber | Plocation  | Dnumber |
+----------------------+---------+------------+---------+
| Payroll System       |       1 | Kochi      |       1 |
| Inventory Management |       2 | Trivandrum |       2 |
| Banking App          |       3 | Kozhikode  |       3 |
+----------------------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql> UPDATE Project
    -> SET Dnumber = 2
    -> WHERE Pname = 'Payroll System' AND Dnumber = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM PROJECT;
+----------------------+---------+------------+---------+
| Pname                | Pnumber | Plocation  | Dnumber |
+----------------------+---------+------------+---------+
| Payroll System       |       1 | Kochi      |       2 |
| Inventory Management |       2 | Trivandrum |       2 |
| Banking App          |       3 | Kozhikode  |       3 |
+----------------------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql>


5. Delete only those who are working on a particular project say ‘’P1’’.

mysql> SELECT * FROM WORKS_ON;
+------------+---------+-------+
| EmployeeID | Pnumber | Hours |
+------------+---------+-------+
|        101 |       1 |  10.0 |
|        101 |       2 |   5.0 |
|        102 |       1 |  15.0 |
|        103 |       2 |  20.0 |
|        104 |       2 |  10.0 |
|        104 |       3 |  12.0 |
|        105 |       3 |  18.0 |
|        106 |       3 |  25.0 |
+------------+---------+-------+
8 rows in set (0.00 sec)

mysql> DELETE FROM Works_on
    -> WHERE Pnumber = 1;
Query OK, 2 rows affected (0.00 sec)

mysql>
mysql> SELECT * FROM WORKS_ON;
+------------+---------+-------+
| EmployeeID | Pnumber | Hours |
+------------+---------+-------+
|        101 |       2 |   5.0 |
|        103 |       2 |  20.0 |
|        104 |       2 |  10.0 |
|        104 |       3 |  12.0 |
|        105 |       3 |  18.0 |
|        106 |       3 |  25.0 |
+------------+---------+-------+
6 rows in set (0.00 sec)

mysql>