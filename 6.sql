1. List all employees whose age lies between 25 - 45 years 

mysql> select name, employeeid,birthdate,timestampdiff(year,birthdate,curdate()) as age from employee where timestampdiff(year,birthdate,curdate()) between 25 and 45 order by age;
+---------+------------+------------+------+
| name    | employeeid | birthdate  | age  |
+---------+------------+------------+------+
| Frank   |        106 | 1995-11-30 |   29 |
| Diana   |        104 | 1992-07-18 |   33 |
| Bob     |        102 | 1990-09-21 |   34 |
| Charlie |        103 | 1988-12-02 |   36 |
| Alice   |        101 | 1985-04-12 |   40 |
| Eve     |        105 | 1983-03-05 |   42 |
+---------+------------+------------+------+
6 rows in set (0.01 sec)

mysql>

2. Calculate the service period of all managers. 


