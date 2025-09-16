
mysql> select * from department;
+---------+---------+-----------+----------------+
| Dname   | Dnumber | managerid | mgr_start_date |
+---------+---------+-----------+----------------+
| HR      |       1 |       101 | 2020-01-01     |
| Finance |       2 |       103 | 2021-05-15     |
| IT      |       3 |       105 | 2019-09-01     |
+---------+---------+-----------+----------------+
3 rows in set (0.00 sec)

mysql> insert into department (dname , dnumber, managerid , mgr_start_date)
    -> values('Sales',4,NULL,'2022-05-16');
Query OK, 1 row affected (0.31 sec)

mysql> select * from department;
+---------+---------+-----------+----------------+
| Dname   | Dnumber | managerid | mgr_start_date |
+---------+---------+-----------+----------------+
| HR      |       1 |       101 | 2020-01-01     |
| Finance |       2 |       103 | 2021-05-15     |
| IT      |       3 |       105 | 2019-09-01     |
| Sales   |       4 |      NULL | 2022-05-16     |
+---------+---------+-----------+----------------+
4 rows in set (0.00 sec)

mysql> update department set managerid = 102 where dnumber = 4;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from department;
+---------+---------+-----------+----------------+
| Dname   | Dnumber | managerid | mgr_start_date |
+---------+---------+-----------+----------------+
| HR      |       1 |       101 | 2020-01-01     |
| Finance |       2 |       103 | 2021-05-15     |
| IT      |       3 |       105 | 2019-09-01     |
| Sales   |       4 |       102 | 2022-05-16     |
+---------+---------+-----------+----------------+
4 rows in set (0.00 sec)

mysql>

mysql> update employee set salary=15000 where salary > 10000;
Query OK, 4 rows affected (0.00 sec)
Rows matched: 5  Changed: 4  Warnings: 0

mysql> select * from employee;
+---------+------------+------------+--------------+--------+----------+----------+---------+
| name    | employeeid | birthdate  | housename    | gender | salary   | supereid | dnumber |
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

mysql> update project set dnumber = 2 where pnumber = 1 and dnumber = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from project;
+----------------------+---------+------------+---------+
| pname                | pnumber | plocation  | dnumber |
+----------------------+---------+------------+---------+
| Payroll System       |       1 | Kochi      |       2 |
| Inventory Management |       2 | Trivandrum |       2 |
| Banking App          |       3 | Kozhikode  |       3 |
+----------------------+---------+------------+---------+
3 rows in set (0.00 sec)

mysql>

5. Delete only those who are working on a particular project say ‘’P1’’.


mysql> select * from works_on;
+------------+---------+-------+
| employeeid | pnumber | hours |
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
8 rows in set (0.01 sec)

mysql> delete from works_on where pnumber = 1;
Query OK, 2 rows affected (0.00 sec)

mysql> select * from works_on;
+------------+---------+-------+
| employeeid | pnumber | hours |
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