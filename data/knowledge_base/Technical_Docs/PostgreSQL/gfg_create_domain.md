# CREATE DOMAIN

> Source: https://www.geeksforgeeks.org/postgresql/postgresql-user-defined-data-type/

PostgreSQL supports the creation of user-defined data types through the CREATE DOMAIN and CREATE TYPE statements. These capabilities allow for the customization and extension of data types to fit specific application needs, providing more flexibility and control over data integrity and consistency. 
Let us get a better understanding of the CREATE DOMAIN and CREATE TYPE Statement in PostgreSQL from this article.
- CREATE DOMAIN: It creates a user-defined data type that can have optional constraints.
- CREATE TYPE: It is often applied to create a composite type (data type that are mixes of two or more data types) using stored procedures.
CREATE DOMAIN
In PostgreSQL, a domain is a data type that has optional constraints. It is a must to have a unique name and a well-defined schema range.
Syntax:
CREATE DOMAIN domain_name AS data_type [CONSTRAINT constraint_name CHECK (expression)];
Example:
First, we create a table (say, marksheet) using the below command:
CREATE TABLE marksheet (
student_id SERIAL PRIMARY KEY,
first_name VARCHAR NOT NULL,
last_name VARCHAR NOT NULL,
email VARCHAR NOT NULL,
marks_obtained INT NOT NULL,
CHECK (
first_name !~ '\s'
AND last_name !~ '\s'
)
);
The 'first_name' and 'last_name' fields are not null and must not contain any spaces. For the simplicity of the teachers we can make a 'student_detail' domain using the below command:
CREATE DOMAIN student_detail AS 
VARCHAR NOT NULL CHECK (value !~ '\s');
Now we can use the student_detail as the data type of the first_name and last_name fields as follows:
CREATE TABLE marksheet (
student_id serial PRIMARY KEY,
first_name student_detail,
last_name student_detail,
marks_obtained INT NOT NULL,
email VARCHAR NOT NULL
);
Now insert some data to the table using the below command:
INSERT INTO marksheet (first_name, last_name,marks_obtained, email)
VALUES
( 'Raju K', 'Singh', 95, 'rajukumar@gmail.com' );
This will raise the following error because 'first_name' contains a space:
ERROR:  value for domain marksheet violates check constraint "marksheet_check"
- Modifying or Deleting a Domain: So, the behaviour is as we expected. To modify or delete a domain, one can make use of the ALTER DOMAIN or DROP DOMAIN respectively.
- Listing All Domains: To get all domains in the current database use the below command:
\dD
Output:
CREATE TYPE
The CREATE TYPE statement is used to define composite types, which are combinations of two or more data types. These types are particularly useful in stored procedures and for defining table structures that require multiple attributes grouped together.
Syntax:
CREATE TYPE type_name AS (
attribute_name data_type,
...
);
Example: Creating a Composite Type
Suppose we want to create a composite type named address:
CREATE TYPE address AS (
street VARCHAR,
city VARCHAR,
state CHAR(2),
zip_code CHAR(5)
);
We can now use this type in a table definition:
CREATE TABLE employee (
employee_id SERIAL PRIMARY KEY,
name VARCHAR NOT NULL,
home_address address,
work_address address
);
Using Composite Types in Functions
Composite types can also be used in stored procedures to simplify the handling of complex data structures.
CREATE OR REPLACE FUNCTION get_employee_address(emp_id INT) RETURNS address AS $$
DECLARE
emp_address address;
BEGIN
SELECT home_address INTO emp_address FROM employee WHERE employee_id = emp_id;
RETURN emp_address;
END;
$$ LANGUAGE plpgsql;
Conclusion
In conclusion, PostgreSQL's support for user-defined data types through CREATE DOMAIN and CREATE TYPE provides powerful tools for enhancing data integrity, simplifying database design, and handling complex data structures. These features are essential for any database administrator or developer looking to leverage the full potential of PostgreSQL.
