--Book 2 ch 6 - Subqueries

SELECT column_name1 , column_name2,
 column_name3 = (SELECT AVG(column_name) 
   FROM table1 WHERE column_name OPERATOR value)
FROM   table1;

-- This statment finds the final grade for a student based on the sum of their assignment scores.
SELECT s.student_id, s.FirstName, s.LastName, 
       final_grade = (SELECT sum(score) 
                       FROM assignments
                      WHERE assignments.student_id = s.student_id)
  FROM students s; 
  
SELECT column_name , column_name
FROM   table1 , table2
WHERE  column_name OPERATOR
   (SELECT column_name , column_name
   FROM table1 , table2 
   WHERE column_name OPERATOR value)
   
   -- This statment finds all teachers whose salaries are greater than the average salary of all teachers.
SELECT teacher_id, first_name, last_name, salary
FROM teachers
WHERE
salary > (SELECT AVG(salary) FROM teachers);

SELECT t.column_name , t.column_name
FROM   (SELECT t.column_name , t.column_name
   FROM table1 t)

-- This statement retrieves all of the fields of the the teacher table with the use of a subquery in the FROM clause.
SELECT t.first_name, t.last_name FROM (SELECT teacher.first_name, teacher.last_name FROM teachers t);