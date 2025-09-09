mysql> create database govi;
Query OK, 1 row affected (0.01 sec)

mysql> use govi;
Database changed
mysql>  CREATE TABLE Department (
    ->     ->     Dname VARCHAR(50) NOT NULL UNIQUE,
    ->     ->     Dnumber INT PRIMARY KEY,
    ->     ->     ManagerID INT,
    ->     ->     Mgr_start_date DATE NOT NULL
    ->     -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '->     Dname VARCHAR(50) NOT NULL UNIQUE,
    ->     Dnumber INT PRIMARY KEY,
  ' at line 2
mysql> CREATE TABLE Department (
    ->  Dname VARCHAR(50) NOT NULL UNIQUE,
    -> Dnumber int primary key,
    -> managerid int,
    -> mgr_start_date date not null
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> show tables;
+----------------+
| Tables_in_govi |
+----------------+
| department     |
+----------------+
1 row in set (0.00 sec)

mysql> desc department;
+----------------+------------+------+-----+---------+-------+
| Field          | Type       | Null | Key | Default | Extra |
+----------------+------------+------+-----+---------+-------+
| Dname          | varchar(5) | NO   | UNI | NULL    |       |
| Dnumber        | int        | NO   | PRI | NULL    |       |
| managerid      | int        | YES  |     | NULL    |       |
| mgr_start_date | date       | NO   |     | NULL    |       |
+----------------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table employee (
    -> name varchar(50) not null,
    -> employeeid int primary key,
    -> birthdate date,
    -> housename varchar(100),
    -> gender char(1)
    -> ,salary decimal
    -> (10,2) check (salary between 5000 and 25000),
    -> supereid int, dnumber int,
    -> foreign key (supereid) references employee(employeeid),
    -> foreign key (dnumber) references department (dnumber)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> desc employee;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| name       | varchar(50)   | NO   |     | NULL    |       |
| employeeid | int           | NO   | PRI | NULL    |       |
| birthdate  | date          | YES  |     | NULL    |       |
| housename  | varchar(100)  | YES  |     | NULL    |       |
| gender     | char(1)       | YES  |     | NULL    |       |
| salary     | decimal(10,2) | YES  |     | NULL    |       |
| supereid   | int           | YES  | MUL | NULL    |       |
| dnumber    | int           | YES  | MUL | NULL    |       |
+------------+---------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> alter table department add constraint fk_manager foreign key (managerid)
    -> references employee(employeeid);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc department;
+----------------+------------+------+-----+---------+-------+
| Field          | Type       | Null | Key | Default | Extra |
+----------------+------------+------+-----+---------+-------+
| Dname          | varchar(5) | NO   | UNI | NULL    |       |
| Dnumber        | int        | NO   | PRI | NULL    |       |
| managerid      | int        | YES  | MUL | NULL    |       |
| mgr_start_date | date       | NO   |     | NULL    |       |
+----------------+------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> create table deptlocations (
    -> dnumber int,
    -> dlocation varchar(100),
    -> primary key (dnumber,dlocation),
    -> foreign key (dnumber) references department(dnumber));
Query OK, 0 rows affected (0.02 sec)

mysql> create table project (
    -> pname varchar(50) not null,
    -> pnumber int primary key,
    -> plocation varchar(100),
    -> dnumber int not null,
    -> foreign key (dnumber) references department(dnumber)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> create table works_on (
    -> employeeid int,
    -> pnumber int.,
    -> ^C
mysql> create table works_on (
    -> employeeid int,
    -> pnumber int,
    -> hours decimal(4,1) not null,
    -> primary key (employeeid,pnumber),
    -> foreign key (employeeid) references employee (employeeid),
    -> foreign key (pnumber) references project(pnumber)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> create table dependent (
    -> employeeid int,
    -> dependname varchar(50) not null,
    -> sex char(1),
    -> birthdate date,
    -> relationship varchar(50),
    -> primary key (employeeid,dependname),
    -> foreign key (employeeid) references employee(employeeid)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> desc dependent;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| employeeid   | int         | NO   | PRI | NULL    |       |
| dependname   | varchar(50) | NO   | PRI | NULL    |       |
| sex          | char(1)     | YES  |     | NULL    |       |
| birthdate    | date        | YES  |     | NULL    |       |
| relationship | varchar(50) | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> show works_on;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'works_on' at line 1
mysql> desc works_on;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| employeeid | int          | NO   | PRI | NULL    |       |
| pnumber    | int          | NO   | PRI | NULL    |       |
| hours      | decimal(4,1) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc project;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| pname     | varchar(50)  | NO   |     | NULL    |       |
| pnumber   | int          | NO   | PRI | NULL    |       |
| plocation | varchar(100) | YES  |     | NULL    |       |
| dnumber   | int          | NO   | MUL | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc deptlocations;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| dnumber   | int          | NO   | PRI | NULL    |       |
| dlocation | varchar(100) | NO   | PRI | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql>
