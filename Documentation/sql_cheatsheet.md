# <--- Lines starting with # are comments

# Get into postres:

$psql

#---- Common commands ----#

\q - quit
\l - list databases 
\c - connect to databased ⇒  \c experimental
\d - display tables in database

#---- Create Database: ----#

CREATE DATABASE database_name;


#---- Grant Access to Database: ----#
# not needed if you have a superuser who has access to all databases, otherwise, do and grant command:

GRANT ALL PRIVILEGES ON DATABASE database_name to user_name;


#---- Show psql users & roles: ----#

\du


#---- Connect to database: ----#

\c experimental
#or whatever your database is named


#---- Create table in database from .sql file (DO THIS FROM TERMINAL, NOT IN PSQL: ----#

psql -d database_name -f file_name.sql


#---- Create table in database from .sql file, import data from csv file ----#

See file seeds/farmers_market_seeds.sql example


#---- Retrieve values from database: ----#

# Retrieve all table rows from table STUDENTS:

SELECT * FROM STUDENTS;

# Retrieve row from table STUDENTS where id = 1 

SELECT * FROM STUDENTS WHERE id = 1;


#---- Insert into Table: ----#

INSERT INTO STUDENTS (name,age) VALUES ('jake', 18);
#--------table_name(column, column) values (column_values, column_values)

