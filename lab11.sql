/* TABLE name:
    university, 
    person, 
    activity, 
    participated in, 
    body composition.
*/

/* 
    Part 1
    create a view that shows pid, the first name(fname), last name(lname), for people with a weight above 140.
    this view should be named "weight". use an INNER JOIN in this view's query 
*/

/* 
    SQL CREATE VIEW Syntax
    CREATE VIEW view_name AS
    SELECT column_name(s)
    FROM table_name
    WHERE condition
*/
CREATE  OR REPLACE VIEW weight AS SELECT person.fname, person.lname, person.pid FROM person INNER JOIN body_composition ON person.pid = body_composition.pid WHERE weight > 140;


/*
    Part 2
    Create a view that returns the fname, lname, and BMI for peopel with a weight above 150.
    named BMI, use an INNER JOIN and must reference the weight view . BMI is calculated as 703 * weight/height^2
*/

CREATE OR REPLACE VIEW BMI AS SELECT weight.fname, weight.lname,round(body_composition.weight/body_composition.height/body_composition.height*703) 
AS 'BMI'  FROM body_composition INNER JOIN weight ON body_composition.pid = weight.pid 
WHERE body_composition.weight > 150;

/* part 3
   Write a query that returns the name and city of universities with no people in the database that are associated
   with them. Your query must use NOT EXISTS to achieve this. (2 rows)
*/
SELECT * FROM university WHERE NOT EXISTS (SELECT * FROM person WHERE university.uid = person.uid);

/* part 4
    Write a query that returns only the uid value for all universities in the city Columbia. Then use that query with an IN sub-query expression to retrieve the first and last names for all people that go to school in Columbia.
*/
SELECT person.fname,person.lname  FROM person INNER JOIN university ON person.uid = university.uid WHERE person.uid IN(SELECT uid FROM university WHERE city ='Columbia');
/* part 5 Using NOT IN
    Write a query that returns all of the activities with records in the participated in table. Then use that query with a NOT IN sub-query expression to retrieve the activities that are not played by any player in the database.
*/



SELECT activity_name FROM activity 
WHERE activity_name NOT IN (SELECT activity_name FROM participated_in);

/* part 6
Using UNION
Write a query that returns the pid of all people listed in the participated in that participate in ‘running’. Then modify your query to use UNION to return all people who run or play racquetball. You must use the UNION operator to accomplish this. You cannot use OR.
*/

SELECT * FROM person WHERE person.pid IN
(SELECT participated_in.pid FROM participated_in 
WHERE participated_in.activity_name = 'running' 
UNION 
SELECT participated_in.pid FROM participated_in 
WHERE participated_in.activity_name = 'racquetball');



/* part 7
Using ORDER BY
Write a query that returns people’s first and last names, weight, height, and age. Records should be ordered first by height in descending (Z-to-A order), then by weight in ascending order, and finally by the person’s last name in ascending order.
*/
SELECT person.fname,person.lname,body_composition.weight,body_composition.height,
body_composition.age FROM person JOIN body_composition ON person.pid = body_composition.pid
ORDER BY body_composition.height DESC, body_composition.weight ASC, person.lname ASC;








