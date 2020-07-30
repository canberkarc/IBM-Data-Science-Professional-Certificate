drop table INSTRUCTOR; /* Drop existing table */
create table INSTRUCTOR( /* Create new table */
	ins_ind INTEGER PRIMARY KEY NOT NULL,
	country CHAR(2),
	firstname VARCHAR(15) NOT NULL,
	lastname VARCHAR(15) NOT NULL,
	city VARCHAR(15)
);

/* Inserting first row */ 
INSERT INTO INSTRUCTOR
(ins_ind,country,firstname,lastname,city)
VALUES
(1,'CA','Rav','Ahuja','Toronto');

/* Inserting other 2 rows */
INSERT INTO INSTRUCTOR
(ins_ind,country,firstname,lastname,city)
VALUES
(2,'CA','Raul','Chong','Toronto'),
(3,'US','Hima','Vasudevan','Chicago');

/* Selecting rows */
SELECT * FROM INSTRUCTOR;

/* Selecting features of row where city is Toronto*/
select firstname, lastname, country from INSTRUCTOR where city = 'Toronto';

/* Updating city */
UPDATE INSTRUCTOR SET city = 'Markham' where firstname = 'Rav';

/* Deleting row where first name is Raul */
DELETE FROM INSTRUCTOR where firstname = 'Raul';

/* Retrieving all rows */
SELECT * FROM INSTRUCTOR;