mysql> select * from employee order by salary asc;
+---------+------------+------------+--------------+--------+----------+----------+---------+
| name    | employeeid | birthdate  | housename    | gender | salary   | supereid | dnumber |
+---------+------------+------------+--------------+--------+----------+----------+---------+
| Frank   |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
| Alice   |        101 | 1985-04-12 | Rose Villa   | F      | 15000.00 |     NULL |       1 |
| Bob     |        102 | 1990-09-21 | Green House  | M      | 15000.00 |      101 |       1 |
| Charlie |        103 | 1988-12-02 | Blue Cottage | M      | 15000.00 |      101 |       2 |
| Diana   |        104 | 1992-07-18 | Lake View    | F      | 15000.00 |      103 |       2 |
| Eve     |        105 | 1983-03-05 | Hill Top     | F      | 15000.00 |      101 |       3 |
+---------+------------+------------+--------------+--------+----------+----------+---------+
6 rows in set (0.00 sec)

mysql> select * from employee order by salary desc;
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


mysql> select * from employee where dnumber = 3;
+-------+------------+------------+--------------+--------+----------+----------+---------+
| name  | employeeid | birthdate  | housename    | gender | salary   | supereid | dnumber |
+-------+------------+------------+--------------+--------+----------+----------+---------+
| Eve   |        105 | 1983-03-05 | Hill Top     | F      | 15000.00 |      101 |       3 |
| Frank |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
+-------+------------+------------+--------------+--------+----------+----------+---------+
2 rows in set (0.00 sec)

mysql>

mysql> select e.name,e.birthdate from employee e join department d on e.dnumber = d.dnumber where d.dname = 'HR';
+-------+------------+
| name  | birthdate  |
+-------+------------+
| Alice | 1985-04-12 |
| Bob   | 1990-09-21 |
+-------+------------+
2 rows in set (0.00 sec)

mysql>
mysql> select p.pnumber,p.dnumber as controlingdeptno, e.name as managername, e.housename , e.birthdate from project p join department d on p.dnumber = d.dnumber join employee e on d.managerid = e.employeeid where p.plocation = 'Kochi';
+---------+------------------+-------------+--------------+------------+
| pnumber | controlingdeptno | managername | housename    | birthdate  |
+---------+------------------+-------------+--------------+------------+
|       1 |                2 | Charlie     | Blue Cottage | 1988-12-02 |
+---------+------------------+-------------+--------------+------------+
1 row in set (0.00 sec)

mysql> select e.name,e.employeeid,COUNT(w.pnumber) as noofprojects from employee e join works_on w on e.employeeid = w.employeeid group by e.name,e.employeeid having count(w.pnumber) >1 ;
+-------+------------+--------------+
| name  | employeeid | noofprojects |
+-------+------------+--------------+
| Diana |        104 |            2 |
+-------+------------+--------------+
1 row in set (0.00 sec)

mysql>