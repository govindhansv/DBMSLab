1. Employees Whose Names Start with 'a'

mysql> select * from employee where name like 'a%';
+-------+------------+------------+------------+--------+----------+----------+---------+
| name  | employeeid | birthdate  | housename  | gender | salary   | supereid | dnumber |
+-------+------------+------------+------------+--------+----------+----------+---------+
| Alice |        101 | 1985-04-12 | Rose Villa | F      | 15000.00 |     NULL |       1 |
+-------+------------+------------+------------+--------+----------+----------+---------+
1 row in set (0.00 sec)

mysql>

2. Employees Born in the 1990s (1990-1999)

mysql> select * from employee where birthdate like "199%";
+-------+------------+------------+--------------+--------+----------+----------+---------+
| name  | employeeid | birthdate  | housename    | gender | salary   | supereid | dnumber |
+-------+------------+------------+--------------+--------+----------+----------+---------+
| Bob   |        102 | 1990-09-21 | Green House  | M      | 15000.00 |      101 |       1 |
| Diana |        104 | 1992-07-18 | Lake View    | F      | 15000.00 |      103 |       2 |
| Frank |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
+-------+------------+------------+--------------+--------+----------+----------+---------+
3 rows in set (0.00 sec)

mysql> select * from employee where year(birthdate) between 1990 and 1999;
+-------+------------+------------+--------------+--------+----------+----------+---------+
| name  | employeeid | birthdate  | housename    | gender | salary   | supereid | dnumber |
+-------+------------+------------+--------------+--------+----------+----------+---------+
| Bob   |        102 | 1990-09-21 | Green House  | M      | 15000.00 |      101 |       1 |
| Diana |        104 | 1992-07-18 | Lake View    | F      | 15000.00 |      103 |       2 |
| Frank |        106 | 1995-11-30 | Sunrise Home | M      |  8000.00 |      105 |       3 |
+-------+------------+------------+--------------+--------+----------+----------+---------+
3 rows in set (0.00 sec)

mysql>