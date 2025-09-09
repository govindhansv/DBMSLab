
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

