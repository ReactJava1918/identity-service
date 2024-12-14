                                                        IMPORTING DATABASE TO AWS RDS
                                                        ================================
step1:-Taking local db back up
================================
C:\db_backup>mysqldump -u root -p javatechie  >  javatechie.sql
Enter password: ****

step2:-Connecting to aws rds from local
=====================================================
C:\Users\ADMIN>mysql -h javatechie.cpaec4eeem0e.eu-north-1.rds.amazonaws.com  -P 3306 -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.39 Source distribution

Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.17 sec)

mysql> CREATE DATABASE javatechie;
Query OK, 1 row affected (0.19 sec)

mysql> show databaes;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databaes' at line 1
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| javatechie         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.17 sec)


step3:-Importing bakeup db to aws rds
============================================================================================================
ADMIN@DESKTOP-FUHSSDU MINGW64 /c/db_backup
$ ls
javatechie.sql

ADMIN@DESKTOP-FUHSSDU MINGW64 /c/db_backup
$ mysql -h javatechie.cpaec4eeem0e.eu-north-1.rds.amazonaws.com  -P 3306 -u root -p javatechie < javatechie.sql
Enter password: ********

ADMIN@DESKTOP-FUHSSDU MINGW64 /c/db_backup
$



step4 :- Confirmation on importing  db back up to  rds
===============================================================================================================
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| javatechie         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.17 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| javatechie         |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.17 sec)

mysql> use javatechie;
Database changed
mysql> show tables;
+----------------------+
| Tables_in_javatechie |
+----------------------+
| usercredential       |
+----------------------+
1 row in set (0.19 sec)

mysql> select from usercredential;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from usercredential' at line 1
mysql> select * from usercredential;
+----+----------------------+----------+--------------------------------------------------------------+
| id | email                | name     | password                                                     |
+----+----------------------+----------+--------------------------------------------------------------+
|  1 | john.doe@example.com | John Doe | $2a$10$Gqj5FrP0zRgS66fXD3air.YT67PI2sNty9lXEscMcw4/0qOstgju6 |
|  2 | siva@example.com     | siva     | $2a$10$KsWENpNg4HAxprC30BmOZ.BTjxcsCQ6HThBGoUZjHr4XDorcelKGO |
+----+----------------------+----------+--------------------------------------------------------------+
2 rows in set (0.17 sec)

mysql>