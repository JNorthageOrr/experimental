SQL databases:

Pronounced: ("sequal") 

Relational database. Stores data in rows that are contained in tables.

ACID Compliance: SQL is a specification, meaning it has to comply to the following requirements to insure data integrity:

Atomicity - Guarantees all transactions either succeed or fail together. (bank account transfer, subtract $ from A, add $ to B.)
Consistency - Guarantees all transactions abide by the rules of the table or database. 
Isolation - Guarantees that transactions are never seen in an intermediary state. Each trans is resolved before subsequent transactions are allowed. 
Durability - Guarantees that all confirmed transactions are recorded and thus reproducible in the event of a system failure.  (database can be rolled back or restored to previously saved state.)

CRUD: Basic operations for managing databases:
Create - create new record
Read - reads an existing record
Update - Update an existing record
Destroy - Destroy an existing record


All stored data must have a type. Common Types:

- VARCHAR(length) ==> VARCHAR(30) ==> Varchar max length 30 characters
	- VARCHAR is basically a string, or text format, will hold letters and numbers data, do not use if you need your numbers to be used for calculating purposes ($ or time...etc)

- INTEGER
	- Stores whole numbers. Integers. 19, 190, 1900...etc

- FLOAT - https://www.postgresql.org/docs/10/datatype-numeric.html#DATATYPE-FLOAT
 	- Stores floating point numbers. Decimals. 10.5, 100.5, 1000.5...etc
 	- Common types, FLOAT, real, numeric. There are a bunch of different data types which store information with different levels of precision. Most of the time, you will not need super precise datatypes, as you will not care about the difference between 100.000000012 and 100.000000013. Nevertheless, they exist, if you are dealing with high precision data.

Serial - This is used to index data stored in a table. It means that each row of data will be assigned a number that is incremental to the previously stored data, e.g. if used for "ID's" the third row writting to the table will have an ID of 3.

PRIMARY KEY - Used to uniquely identify a row of data in a table. It ensures that only one row in the database can be identified by the specified field. Example: There may be many registered users with the name Jim James, but only one user can have the email address jim@james.com, if the email field is assigned as the PRIMARY KEY. 

