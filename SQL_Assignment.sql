
-- **SQL ASSIGNMENT :**

/*
**Important Note:**
I have used the Sakila database when the question does not provide clear instructions on which database to use. 
There is no significant difference between the Sakila and Mavenmovies databases, so you can use them interchangeably. However, if the question does not specify a database, I default to using Sakila.
*/
/*question =1 
 Create a table called employees with the following structure;
 emp_id (integer, should not be N<LL and should be a primary key)`
 emp_name (text, should not be N<LL)`
 age (integer, should have a check constraint to ensure the age is at least 18)`
 email (text, should be unique for each employee)`
 salary (decimal, with a default value of 30,000)a
Write the SQL query to create the above table with all constraints.
*/
-- ANSWER 

-- Create the database
CREATE DATABASE my_database;

-- Select the database
USE my_database;

-- Create the employees table with the specified constraints
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,                -- PRIMARY KEY automatically implies NOT NULL and UNIQUE
    emp_name VARCHAR(100) NOT NULL,        -- NOT NULL ensures the employee name cannot be empty
    age INT CHECK (age >= 18),             -- CHECK ensures age must be at least 18
    email VARCHAR(100) UNIQUE,             -- UNIQUE ensures no two employees have the same email
    salary DECIMAL(10,2) DEFAULT 30000     -- DEFAULT sets the salary to 30,000 if no value is provided
);

-- Verify table creation
SHOW TABLES;
select*from employees;

-- Describe the employees table structure
DESCRIBE employees;
-- -------------------------------------------------------------------------------------------------------------------------------------------

/*
Question 2:
Explain the purpose of constraints and how they help maintain data integrity in a database. Provide 
examples of common types of constraints.
*/
-- ANSWER

-- Purpose of Constraints:
-- Constraints in a database are rules applied to columns in a table to ensure the accuracy, consistency, and integrity of the data.
-- They prevent invalid, duplicate, or inconsistent data from being inserted or updated in the database.
-- Constraints are essential for maintaining data integrity by enforcing specific rules, ensuring that the data stored in the database is reliable and follows the intended structure.

-- How Constraints Help Maintain Data Integrity:
-- 1. Prevention of Invalid Data: Constraints stop incorrect or incomplete data from being entered into the database.
--    Example: A NOT NULL constraint ensures that a column cannot be left empty.
-- 2. Enforcement of Uniqueness: Constraints can ensure that specific columns (like email or emp_id) contain unique values, preventing duplicate entries.
-- 3. Consistency Across Tables: Using foreign keys, constraints ensure that relationships between tables remain consistent.
--    Example: A FOREIGN KEY constraint ensures that an employee's department_id exists in the departments table.
-- 4. Logical Data Validation: Constraints like CHECK can enforce logical rules.
--    Example: A CHECK constraint can ensure that employees are at least 18 years old.

-- Examples of Common Types of Constraints:
-- 1. NOT NULL Constraint:
--    Purpose: Ensures that a column cannot have a NULL (empty) value.
--    Example: emp_name VARCHAR(100) NOT NULL
--             NOT NULL ensures that the emp_name cannot be NULL (empty).
-- 2. UNIQUE Constraint:
--    Purpose: Ensures that all values in a column are distinct, preventing duplicates.
--    Example: email VARCHAR(255) UNIQUE
--             UNIQUE ensures that the email addresses are unique (no duplicates).
-- 3. PRIMARY KEY Constraint:
--    Purpose: Uniquely identifies each row in a table. It’s a combination of NOT NULL and UNIQUE.
--    Example: emp_id INT PRIMARY KEY
--             PRIMARY KEY ensures that the emp_id is unique and cannot be NULL.
-- 4. FOREIGN KEY Constraint:
--    Purpose: Ensures that the value in a column corresponds to a value in another table, maintaining referential integrity between tables.
--    Example: department_id INT, FOREIGN KEY (department_id) REFERENCES departments(department_id)
--             FOREIGN KEY ensures that department_id in employees must exist in the departments table.
-- 5. CHECK Constraint:
--    Purpose: Ensures that a condition is true before data can be inserted into a column.
--    Example: age INT CHECK (age >= 18)
--             CHECK ensures that the age must be at least 18.
-- 6. DEFAULT Constraint:
--    Purpose: Assigns a default value to a column if no value is provided.
--    Example: salary DECIMAL(10,2) DEFAULT 30000
--             DEFAULT ensures that a column is set to a specific default value if no value is provided.

-- Conclusion:
-- Constraints in SQL are essential for ensuring that the data entered into the database is accurate, consistent, and reliable. They enforce rules that maintain data integrity, such as ensuring values are unique, preventing empty fields, and enforcing logical conditions:
-- The NOT NULL constraint ensures required fields are filled.
-- The UNIQUE constraint prevents duplicate values.
-- The PRIMARY KEY uniquely identifies rows in a table.
-- The FOREIGN KEY ensures valid references between tables.
-- The CHECK constraint enforces logical conditions on values.
-- The DEFAULT constraint provides automatic default values for columns.

-- ---------------------------------------------------------------------------------------------------------------------------------------
/*
Question 3:
Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify 
your answer.
*/
-- ANSWER 

-- Purpose of the NOT NULL Constraint:
-- The NOT NULL constraint ensures that a column cannot have a NULL (empty or missing) value.
-- When you apply the NOT NULL constraint to a column, you're telling the database that a value
-- must be provided when inserting or updating a row in the table.
-- In other words, it guarantees that no row in the table can have an empty value for that column.

-- Why Apply the NOT NULL Constraint?
-- 1. Data Integrity:
--    By preventing NULL values, the NOT NULL constraint ensures that essential
--    data is always present. For example, in an employees table, it wouldn’t make sense for an employee 
--    to exist without an employee name or ID, so those fields should be marked as NOT NULL.
-- 2. Business Logic: 
--    Sometimes, certain data fields are required for logical reasons. For example, an e-commerce platform
--    might require a price field for all products. If a product has a NULL value for price, it wouldn't make sense
--    in business terms because every product should have a price.
-- 3. Enforcing Required Fields:
--    In forms or applications, you might want to enforce that certain fields are mandatory. For example,
--    fields like first_name, last_name, and email are typically required for users, so they should be marked
--    as NOT NULL in the database.
-- 4. Efficient Querying:
--    If a column allows NULL values, it can complicate queries and data manipulation. By using NOT NULL, 
--    you simplify your database logic, as you don’t need to handle NULL cases separately in queries.

-- Can a Primary Key Contain NULL Values?
-- No, a primary key cannot contain NULL values. This is because a primary key serves as a unique identifier for
-- each row in a table, and every row must be identifiable by a distinct value in the primary key column. A NULL
-- value represents the absence of a value, which contradicts the purpose of the primary key.

-- Justification:
-- 1. Uniqueness Requirement:
--    A primary key uniquely identifies each row in a table. If a primary key column allowed NULL values, it would not be able to uniquely
--    identify the row because NULL means "unknown" or "missing," and two NULL values are not considered equal in SQL. This would lead to 
--    ambiguity and violate the uniqueness requirement of the primary key.
-- 2. Not a Meaningful Identifier: 
--    Since NULL represents the absence of a value, it cannot meaningfully represent a record in a database. A primary key must always have 
--    a valid, known value that distinguishes it from other records.
-- 3. Integrity of Relationships:
--    Primary keys are often used in foreign key relationships to maintain referential integrity between tables. If a primary key were allowed
--    to be NULL, it would break the ability to reference the row properly in other tables.

-- Conclusion:
-- NOT NULL ensures that a column always has a value and prevents empty or missing data.
-- A primary key cannot contain NULL values because it must uniquely identify each row and be a valid,
-- known value. Allowing NULL in a primary key would violate the fundamental rule of uniqueness and make
-- the primary key meaningless as an identifier.

-- --------------------------------------------------------------------------------------------------------------------------------------------

/*
Question 4:
Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an 
example for both adding and removing a constraint.
*/

-- Answer:
-- Constraints are rules applied to columns in a database table to enforce data integrity. 
-- Sometimes, it’s necessary to add or remove constraints on an existing table to meet changing requirements. 
-- Below are the steps and commands to add and remove constraints, with examples for both.

-- Steps and SQL Commands to Add a Constraint:
-- 1. Determine the Constraint Type:
--    Decide on the type of constraint needed, such as NOT NULL, UNIQUE, CHECK, or FOREIGN KEY.                         
-- 2. Use ALTER TABLE with ADD CONSTRAINT:
--    Use the ALTER TABLE command to add a constraint to the existing table.

-- Example of Adding a Constraint:
-- Let’s say we want to add a CHECK constraint to the employees table to ensure that the salary column has a minimum value of 20,000.
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- ADD CONSTRAINT check_salary_min
-- CHECK (salary >= 20000);

-- Steps and SQL Commands to Remove a Constraint:
-- 1. Identify the Constraint to Remove:
--    Find the name of the constraint you wish to remove. Many databases require you to specify the constraint name (e.g., check_salary_min).
-- 2. Use ALTER TABLE with DROP CONSTRAINT:
--    Use ALTER TABLE to remove the constraint.

-- Example of Removing a Constraint:
-- To remove the check_salary_min constraint added above, use the following command:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- DROP CONSTRAINT check_salary_min;

-- Examples of Common Constraints with Syntax:
-- 1. Adding a NOT NULL Constraint:
--    Adding NOT NULL to the emp_name column:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- MODIFY COLUMN emp_name VARCHAR(100) NOT NULL;

-- 2. Adding a UNIQUE Constraint:
--    Adding a UNIQUE constraint on email:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- ADD CONSTRAINT unique_email UNIQUE (email);

-- 3. Removing a UNIQUE Constraint:
--    Dropping the UNIQUE constraint on email:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- DROP CONSTRAINT unique_email;

-- 4. Adding a Foreign Key Constraint:
--    Adding a FOREIGN KEY on department_id to reference departments:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- ADD CONSTRAINT fk_department
-- FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- 5. Removing a Foreign Key Constraint:
--    Removing the FOREIGN KEY constraint fk_department:
-- Note: To test the workflow, please uncomment the following query.
-- ALTER TABLE employees
-- DROP FOREIGN KEY fk_department;

-- Conclusion:
-- Adding Constraints:
-- Use ALTER TABLE ... ADD CONSTRAINT with the type of constraint to enforce new rules on data.
-- Removing Constraints:
-- Use ALTER TABLE ... DROP CONSTRAINT with the constraint name to remove restrictions.

-- ----------------------------------------------------------------------------------------------------------------------------------------------

/*
Question 5:
Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.
*/

-- Constraints in a database help maintain data integrity by enforcing rules on the data.
-- If data operations (INSERT, UPDATE, DELETE) violate these constraints, the database generates an error.
-- Below are examples of common constraint violations and their expected error messages.

-- 1. Violating the NOT NULL Constraint:
-- The NOT NULL constraint ensures that a column cannot contain NULL values.
-- Attempting to insert a NULL value in a NOT NULL column will cause an error.

-- Example:
-- Assuming emp_name is a NOT NULL column in the employees table:
-- INSERT INTO employees (emp_id, emp_name) VALUES (1, NULL);
-- Expected Error Message:
-- ERROR 1048 (23000): Column 'emp_name' cannot be null

-- 2. Violating the UNIQUE Constraint:
-- The UNIQUE constraint ensures that all values in a column are unique, preventing duplicates.
-- Attempting to insert a duplicate value in a UNIQUE column will cause an error.

-- Example:
-- Assuming product_name is a UNIQUE column in the products table:
-- INSERT INTO products (product_id, product_name) VALUES (1, 'Laptop');
-- INSERT INTO products (product_id, product_name) VALUES (2, 'Laptop'); -- Duplicate value
-- Expected Error Message:
-- ERROR 1062 (23000): Duplicate entry 'Laptop' for key 'product_name'

-- 3. Violating the PRIMARY KEY Constraint:
-- The PRIMARY KEY constraint uniquely identifies each row and cannot contain NULL or duplicate values.
-- Attempting to insert a duplicate or NULL value in a primary key column will cause an error.

-- Example:
-- Assuming order_id is the primary key in the orders table:
-- INSERT INTO orders (order_id, product_name) VALUES (1, 'Tablet');
-- INSERT INTO orders (order_id, product_name) VALUES (1, 'Phone'); -- Duplicate primary key
-- Expected Error Message:
-- ERROR 1062 (23000): Duplicate entry '1' for key 'PRIMARY'

-- 4. Violating the FOREIGN KEY Constraint:
-- The FOREIGN KEY constraint enforces a relationship between two tables, ensuring that values in the foreign key column match values in the referenced table.
-- Attempting to insert a non-existent foreign key value will cause an error.

-- Example:
-- Assuming department_id in employees table references department_id in departments table:
-- INSERT INTO employees (emp_id, emp_name, department_id) VALUES (1, 'Alice', 999); -- 999 does not exist in departments
-- Expected Error Message:
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails

-- 5. Violating the CHECK Constraint:
-- The CHECK constraint enforces a specific condition on a column's values.
-- Attempting to insert or update a value that does not satisfy the CHECK condition will cause an error.

-- Example:
-- Assuming age column in employees table has CHECK (age >= 18):
-- INSERT INTO employees (emp_id, emp_name, age) VALUES (1, 'Bob', 15); -- Age is less than 18
-- Expected Error Message:
-- ERROR 3819 (HY000): Check constraint 'employees_chk_1' is violated

-- -------------------------------------------------------------------------------------------------------------------------------------------

/*
Question 6:

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);
Now, you realise that:
- The product_id should be a primary key.
- The price should have a default value of 50.00.

*/
-- Answer:

-- Select the database
USE my_database;

-- Create the products table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);


-- Verify table creation
SELECT * FROM products;
DESCRIBE products;

-- Adding PRIMARY KEY constraint to product_id
ALTER TABLE products
ADD PRIMARY KEY (product_id);

-- Adding DEFAULT constraint to price
ALTER TABLE products
ALTER COLUMN price SET DEFAULT 50.00;

-- Verify the updates
SELECT * FROM products;
DESCRIBE products;

-- -------------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 7:
You have two tables:
students:
+------------+--------------+----------+
| student_id | student_name | class_id | 
+------------+--------------+----------+
| 1          | Alice        | 101      |
| 2          | Bob          | 102      |
| 3          | Charlie      | 101      |
+------------+--------------+----------+

Classes:
+------------+-------------+
| class_id   | class_name  |  
+------------+-------------+
| 101        | Math        | 
| 102        | Science     | 
| 103        | History     |
+------------+-------------+

Products:
+------------+--------------+----------+
| product_id | product_name | order_id | 
+------------+--------------+----------+
| 1          | laptop       | 1        |
| 2          | phone        | NULL     |
+------------+--------------+----------+

Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are listed even if they are not associated with an order.

Hint: (use INNER JOIN and LEFT JOIN).
*/

-- Answer

-- Creating the students table
CREATE DATABASE new_database;
USE new_database;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    class_id INT
);

-- Inserting records into students table
INSERT INTO students (student_id, student_name, class_id) VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 101);

-- Creating the classes table
CREATE TABLE classes (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(50)
);

-- Inserting records into classes table
INSERT INTO classes (class_id, class_name) VALUES
(101, 'Math'),
(102, 'Science'),
(103, 'History');

-- Creating the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    order_id INT
);

-- Inserting records into products table
INSERT INTO products (product_id, product_name, order_id) VALUES
(1, 'Laptop', 1),
(2, 'Phone', NULL);

-- To show the tables
SELECT * FROM students;
SELECT * FROM classes;
SELECT * FROM products;

-- Query to show all order_id, customer_name, and product_name
SELECT 
    products.order_id,
    students.student_name AS customer_name,
    products.product_name
FROM 
    products
LEFT JOIN 
    students ON products.order_id = students.student_id;

-- -------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 8:
Given the following tables:
sales:
+------------+--------------+----------+
| sale_id    | product_id   | amount   | 
+------------+--------------+----------+
| 1          | 101          | 500      |
| 2          | 102          | 300      |
| 3          | 101          | 700      |
+------------+--------------+----------+

products:
+------------+-------------+
| product_id | product_name|  
+------------+-------------+
| 101        | Laptop      | 
| 102        | Phone       | 
+------------+-------------+

Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
*/

-- Answer

-- Create the Products table with a primary key
USE new_database;

CREATE TABLE Products_ (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO Products_ (product_id, product_name)
VALUES
    (101, 'Laptop'),
    (102, 'Phone');

-- Create the Sales table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    amount INT
);

INSERT INTO Sales (sale_id, product_id, amount)
VALUES
    (1, 101, 500),
    (2, 102, 300),
    (3, 101, 700);

-- Query to find the total sales amount for each product
SELECT p.product_name, SUM(s.amount) AS total_sales
FROM Sales s
INNER JOIN Products_ p ON s.product_id = p.product_id
GROUP BY p.product_name;

USE mavenmovies;
SELECT * FROM address;
DESCRIBE address;

-- ------------------------------------------------------------------------------------------------------------------------------------------
/*
Question 9:
You are given three tables:
orders:
+------------+--------------+-------------+
| order_id   | order_date   | customer_id | 
+------------+--------------+-------------+
| 1          | 2024-01-02   | 1           |
| 2          | 2024-01-05   | 2           |
+------------+--------------+-------------+

Customers:
+-------------+--------------+
| customer_id | customer_name|  
+-------------+--------------+
| 1           | Alice        | 
| 2           | Bob          | 
+------------+---------------+

order_Details:
+------------+--------------+----------+
| order_id   | product_id   | quantity | 
+------------+--------------+----------+
| 1          | 101          | 2        |
| 1          | 102          | 1        |
| 2          | 101          | 3        |
+------------+--------------+----------+

Write a query to display the order_id, customer_name, and the quantity of products ordered by each customer using an INNER JOIN between all three tables.
Note - The above-mentioned questions don't require any dataset.
*/

-- Answer

-- Creating the orders table
USE new_database;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT
);

-- Inserting records into orders table
INSERT INTO orders (order_id, order_date, customer_id) VALUES
(1, '2024-01-02', 1),
(2, '2024-01-05', 2);

-- Creating the customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

-- Inserting records into customers table
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Creating the order_details table
CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT
);

-- Inserting records into order_details table
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 101, 2),
(1, 102, 1),
(2, 101, 3);

-- To show the tables
SELECT * FROM orders;
SELECT * FROM customers;
SELECT * FROM order_details;

-- Query to display the order_id, customer_name, and the quantity of products ordered by each customer
SELECT 
    orders.order_id,
    customers.customer_name,
    order_details.quantity
FROM 
    orders
INNER JOIN 
    customers ON orders.customer_id = customers.customer_id
INNER JOIN 
    order_details ON orders.order_id = order_details.order_id;

-- -------------------------------------------------------------------------------------------------------------------------------------------

-- SQL COMMANDS

/*
Question 1:
Identify the primary keys and foreign keys in Maven Movies DB. Discuss the differences.
*/

-- Primary Keys:
-- A primary key is a unique identifier for a record in a database table. In the Maven Movies database, the primary keys are as follows:
-- - actor: actor_id
-- - actor_award: actor_award_id
-- - address: address_id
-- - advisor: advisor_id
-- - category: category_id
-- - city: city_id
-- - country: country_id
-- - customer: customer_id
-- - film: film_id
-- - film_actor: actor_id and film_id (composite primary key)
-- - film_category: film_id and category_id (composite primary key)
-- - inventory: inventory_id
-- - investor: investor_id
-- - language: language_id
-- - payment: payment_id
-- - rental: rental_id
-- - staff: staff_id
-- - store: store_id

-- Foreign Keys:
-- A foreign key is a column or set of columns in one table that references the primary key of another table. In the Maven Movies database, the foreign keys are as follows:
-- - address: city_id referencing city.city_id
-- - customer: address_id referencing address.address_id and store_id referencing store.store_id
-- - film: language_id and original_language_id referencing language.language_id
-- - film_actor: actor_id referencing actor.actor_id and film_id referencing film.film_id
-- - film_category: film_id referencing film.film_id and category_id referencing category.category_id
-- - inventory: film_id referencing film.film_id and store_id referencing store.store_id
-- - payment: customer_id referencing customer.customer_id, staff_id referencing staff.staff_id, and rental_id referencing rental.rental_id
-- - rental: inventory_id referencing inventory.inventory_id, customer_id referencing customer.customer_id, and staff_id referencing staff.staff_id
-- - staff: address_id referencing address.address_id and store_id referencing store.store_id
-- - store: address_id referencing address.address_id and manager_staff_id referencing staff.staff_id

-- Key Differences:
-- Primary Keys: Uniquely identify rows within a table.
-- Foreign Keys: Establish relationships between tables, ensuring data integrity and consistency.

/*
Question 2:
List all details of actors.
*/
USE mavenmovies;
SELECT * FROM actor;

/*
Question 3:
List all customer information from DB.
*/
SELECT * FROM customer;

/*
Question 4:
List different countries.
*/
USE mavenmovies;
SELECT DISTINCT country FROM country;

/*
Question 5:
Display all active customers.
*/
SELECT * FROM customer WHERE active = 1;

/*
Question 6:
List of all rental IDs for customer with ID 1.
*/
SELECT rental_id
FROM rental
WHERE customer_id = 1;

/*
Question 7:
Display all the films whose rental duration is greater than 5.
*/
SELECT title            -- , rental_duration -- "uncomment this to check duration column as well "
FROM film
WHERE rental_duration > 5;

/*
Question 8:
List the total number of films whose replacement cost is greater than $15 and less than $20.
*/
SELECT COUNT(*) AS film_count 
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

/*
Question 9:
Display the count of unique first names of actors.
*/
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

/*
Question 10:
Display the first 10 records from the customer table.
*/
SELECT *
FROM customer
LIMIT 10;

/*
Question 11:
Display the first 3 records from the customer table whose first name starts with ‘b’.
*/
SELECT *
FROM customer
WHERE first_name LIKE 'b%'
LIMIT 3;

/*
Question 12:
Display the names of the first 5 movies which are rated as ‘G’.
*/
SELECT title
FROM film
WHERE rating = 'G'
LIMIT 5;

/*
Question 13:
Find all customers whose first name starts with "a".
*/
SELECT *
FROM customer
WHERE first_name LIKE 'a%';

/*
Question 14:
Find all customers whose first name ends with "a".
*/
SELECT *
FROM customer
WHERE first_name LIKE '%a';

/*
Question 15:
Display the list of first 4 cities which start and end with ‘a’.
*/
SELECT city
FROM city
WHERE city LIKE 'a%a'
LIMIT 4;

/*
Question 16:
Find all customers whose first name have "NI" in any position.
*/
SELECT *
FROM customer
WHERE first_name LIKE '%NI%';

/*
Question 17:
Find all customers whose first name have "r" in the second position.
*/
SELECT *
FROM customer
WHERE first_name LIKE '_r%';

/*
Question 18:
Find all customers whose first name starts with "a" and are at least 5 characters in length.
*/
SELECT *
FROM customer
WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

/*
Question 19:
Find all customers whose first name starts with "a" and ends with "o".
*/
SELECT *
FROM customer
WHERE first_name LIKE 'a%o';

/*
Another approach to achieve the same result:
*/
SELECT *
FROM customer
WHERE first_name LIKE 'a%' AND first_name LIKE '%o';

/*
Question 20:
Get the films with PG and PG-13 rating using IN operator.
*/
SELECT *
FROM film
WHERE rating IN ('PG', 'PG-13');

/*
Question 21:
Get the films with length between 50 to 100 using BETWEEN operator.
*/
SELECT *
FROM film
WHERE length BETWEEN 50 AND 100;

/*
Question 22:
Get the top 50 actors using LIMIT operator.
*/
SELECT *
FROM actor
LIMIT 50;

/*
Question 23:
Get the distinct film IDs from inventory table.
*/
SELECT DISTINCT film_id
FROM inventory;

-- ------------------------------------------------------------------------------------------------------------------------------------------
					
		-- FUNCTIONS
		-- Basic Aggregate Functions:

/*
Question 1:
Retrieve the total number of rentals made in the Sakila database.

Hint: Use the COUNT() function.
*/
USE sakila;
SELECT COUNT(*) AS total_rentals FROM rental;

/*
Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database.

Hint: Utilize the AVG() function.
*/
SELECT AVG(DATEDIFF(return_date, rental_date)) AS average_rental_duration
FROM rental;

/*
Question 3:
Display the first name and last name of customers in uppercase.

Hint: Use the UPPER () function.
*/
SELECT UPPER(first_name) AS first_name, UPPER(last_name) AS last_name
FROM customer;

/*
Question 4:
Extract the month from the rental date and display it alongside the rental ID.

Hint: Employ the MONTH() function.
*/
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

/*
Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).

Hint: Use COUNT () in conjunction with GROUP BY.
*/
SELECT customer_id, COUNT(*) AS total_rentals
FROM rental
GROUP BY customer_id;

/*
Question 6:
Find the total revenue generated by each store.

Hint: Combine SUM() and GROUP BY.
*/
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
INNER JOIN rental r ON p.rental_id = r.rental_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id;

/*
Question 7:
Determine the total number of rentals for each category of movies.

Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY.
*/
SELECT c.name, COUNT(r.rental_id) AS total_rentals
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

/*
Question 8:
Find the average rental rate of movies in each language.

Hint: JOIN film and language tables, then use AVG () and GROUP BY.
*/
USE sakila;
SELECT l.name AS language, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

/*
Note: The language table has many languages, but the result only shows English because
the film table only has one language ID, which is for English.
*/
-- This query explains why only the average for one language is returned.
USE mavenmovies;
SELECT language_id, COUNT(*)
FROM film
GROUP BY language_id;

-- ------------------------------------------------------------------------------------------------------------------

	-- JOINS
																		
/*
Question 9:
Display the title of the movie, customer's first name, and last name who rented it.

Hint: Use JOIN between the film, inventory, rental, and customer tables.
*/
SELECT f.title, c.first_name, c.last_name
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN customer c ON r.customer_id = c.customer_id;

/*
Question 10:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind."

Hint: Use JOIN between the film actor, film, and actor tables.
*/
USE mavenmovies;
SELECT a.first_name, a.last_name
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

-- Note: This movie does not exist in the film table, so no results will be returned.
-- This is the case for both Sakila and Maven Movies databases. You can check this with the following query:

SELECT * FROM film WHERE title = 'Gone with the Wind';

-- To see results, you can use a movie that exists in the table. Here is an example:

SELECT f.title, a.first_name, a.last_name
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'ACADEMY DINOSAUR';

/*
Question 11:
Retrieve the customer names along with the total amount they've spent on rentals.

Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
*/
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name;

/*
Question 12:
List the titles of movies rented by each customer in a particular city (e.g., 'London').

Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
*/
SELECT 
    c.first_name, 
    c.last_name, 
    f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

-- ------------------------------------------------------------------------------------------------------------------------------------------

	-- Advanced Joins and GROUP BY:
                                                            
/*
Question 13:
Display the top 5 rented movies along with the number of times they've been rented.

Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.
*/
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;

/*
Question 14:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).

Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
*/
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT i.store_id) = 2;

-- --------------------------------------------------------------------------------------------------------------------------------

-- Windows Function:


/*
1. Rank the customers based on the total amount they've spent on rentals.
*/
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS `rank`
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

/*
2. Calculate the cumulative revenue generated by each film over time.
*/
SELECT 
    f.film_id, 
    f.title, 
    r.rental_date, 
    SUM(p.amount) AS revenue,
    SUM(SUM(p.amount)) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.film_id, f.title, r.rental_date
ORDER BY f.film_id, r.rental_date;

/*
3. Determine the average rental duration for each film, considering films with similar lengths.
*/
SELECT 
    f.film_id, 
    f.title, 
    f.length, 
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration,
    AVG(AVG(DATEDIFF(r.return_date, r.rental_date))) OVER (PARTITION BY f.length) AS avg_duration_similar_length
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title, f.length
ORDER BY f.length;

/*
4. Identify the top 3 films in each category based on their rental counts.
*/
WITH FilmRentalCounts AS (
    SELECT 
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        ROW_NUMBER() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS row_num
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, c.name, f.title
)
SELECT category_name, title, rental_count
FROM FilmRentalCounts
WHERE row_num <= 3
ORDER BY category_name, row_num;

/*
5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
*/
WITH CustomerRentals AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        COUNT(r.rental_id) AS total_rentals
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
AverageRentals AS (
    SELECT 
        AVG(total_rentals) AS avg_rentals
    FROM CustomerRentals
)
SELECT 
    cr.customer_id,
    cr.first_name,
    cr.last_name,
    cr.total_rentals,
    ar.avg_rentals,
    (cr.total_rentals - ar.avg_rentals) AS rental_difference
FROM CustomerRentals cr
CROSS JOIN AverageRentals ar
ORDER BY rental_difference DESC;

/*
6. Find the monthly revenue trend for the entire rental store over time.
*/
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
GROUP BY DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY DATE_FORMAT(p.payment_date, '%Y-%m');

/*
7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
*/
WITH CustomerSpending AS (
    SELECT 
        c.customer_id, 
        c.first_name, 
        c.last_name, 
        SUM(p.amount) AS total_spent
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON r.rental_id = p.rental_id
    GROUP BY c.customer_id, c.first_name, c.last_name
),
RankedSpending AS (
    SELECT 
        cs.customer_id, 
        cs.first_name, 
        cs.last_name, 
        cs.total_spent,
        PERCENT_RANK() OVER (ORDER BY cs.total_spent DESC) AS percentile_rank
    FROM CustomerSpending cs
)
SELECT 
    customer_id, 
    first_name, 
    last_name, 
    total_spent
FROM RankedSpending
WHERE percentile_rank >= 0.8
ORDER BY total_spent DESC;

/*
8. Calculate the running total of rentals per category, ordered by rental count.
*/
SELECT 
    c.name AS category, 
    f.title, 
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS running_total
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name, f.title
ORDER BY c.name, rental_count DESC;

/*
9. Find the films that have been rented less than the average rental count for their respective categories.
*/
USE sakila;

WITH AvgCategoryRentals AS (
    SELECT 
        c.category_id,
        c.name AS category_name,
        AVG(FilmCategoryRentals.rental_count) AS avg_rentals
    FROM (
        SELECT 
            fc.category_id,
            f.film_id,
            COUNT(r.rental_id) AS rental_count
        FROM film f
        JOIN film_category fc ON f.film_id = fc.film_id
        JOIN inventory i ON f.film_id = i.film_id
        JOIN rental r ON i.inventory_id = r.inventory_id
        GROUP BY fc.category_id, f.film_id
    ) AS FilmCategoryRentals
    JOIN category c ON FilmCategoryRentals.category_id = c.category_id
    GROUP BY c.category_id, c.name
)
SELECT 
    f.title,
    c.name AS category_name,
    COUNT(r.rental_id) AS rental_count,
    acr.avg_rentals
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN AvgCategoryRentals acr ON fc.category_id = acr.category_id
GROUP BY f.title, c.name, acr.avg_rentals
HAVING COUNT(r.rental_id) < acr.avg_rentals
ORDER BY c.name, f.title;

/*
10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
*/
SELECT 
    DATE_FORMAT(p.payment_date, '%Y-%m') AS month,
    SUM(p.amount) AS monthly_revenue
FROM payment p
GROUP BY DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 5;


-- ----------------------------------------------------------------------------------------------------------------------------

	-- Normalisation & CTE
                                                         
                                                         
/*
question 1. First Normal Form (1NF):
a. Identify a table in the Sakila database that violates 1NF. Explain how you would normalize it to achieve 1NF.
*/

/*
First Normal Form (1NF):
A table is in First Normal Form (1NF) if it meets the following conditions:
1. Each table must have a primary key.
2. Each cell must contain a single, atomic value.

Identifying a 1NF Violation in the Sakila Database:
The `payment` table in the Sakila database violates 1NF because the `payment_date` column contains both date and time components, which are not atomic values.

Normalizing the `payment` table:
To normalize the `payment` table, we can split the `payment_date` column into two separate columns:
1. `payment_date`: This column will store the date component of the payment.
2. `payment_time`: This column will store the time component of the payment.
*/

-- Check the payment table
USE sakila;
DESCRIBE payment;
SELECT * FROM payment;

-- Here's the modified table structure:
USE my_database;
CREATE TABLE payment_normalized (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    rental_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_time TIME
);
DESCRIBE payment_normalized;
SELECT * FROM payment_normalized;

/*
By separating the date and time components, we ensure that each cell contains a single, atomic value, adhering to the principles of 1NF. This normalized table structure improves data integrity and makes it easier to query and manipulate the data.
*/

/*
question 2. Second Normal Form (2NF):
a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. If it violates 2NF, explain the steps to normalize it.
*/

/*
Understanding 2NF:
Second Normal Form (2NF) means:
1. The table is already in First Normal Form (1NF).
2. It has no partial dependencies; no non-key attribute depends on just part of a composite primary key.

Choosing a Table in Sakila Database:
Chosen Table: rental

Structure of rental table:
*/
USE sakila;
SELECT * FROM rental;

/*
Determining Whether the Table is in 2NF:
1. 1NF Compliance:
   The rental table is in 1NF as it has atomic values and no repeating groups.
2. Candidate Key:
   The primary key is rental_id.
3. Partial Dependency:
   No non-key attributes (like rental_date, inventory_id, customer_id, return_date, staff_id, last_update) depend only on part of the primary key.
  
Conclusion:
The rental table is in 2NF because there are no partial dependencies.
*/

/*
Example of Violating 2NF and Normalizing:
Hypothetical Example: Violating 2NF
Consider a hypothetical orders table:
Creating Hypothetical Orders Table
*/
USE my_database;
CREATE TABLE orders (
    order_id INT,
    product_id INT,
    product_name VARCHAR(255),
    quantity INT,
    customer_id INT,
    customer_name VARCHAR(255),
    PRIMARY KEY (order_id, product_id)
);
SELECT * FROM orders;

/*
Issues:
- `product_name` depends only on `product_id`.
- `customer_name` depends only on `customer_id`.

Steps to Normalize:
1. Identify Partial Dependencies:
   - `product_name` depends on `product_id`.
   - `customer_name` depends on `customer_id`.
2. Create New Tables:

Example of splitting a hypothetical table into 2NF:
Create Products Table
*/
USE my_database;
CREATE TABLE _products_ (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);
SELECT * FROM products;
DESCRIBE products;

/*
Create Customers Table:
*/
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);
SELECT * FROM customers;
DESCRIBE customers;

/*
Create Orders Table:
*/
CREATE TABLE _orders (
    order_id INT,
    product_id INT,
    quantity INT,
    customer_id INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SELECT * FROM orders;
DESCRIBE orders;

/*
By creating Products, Customers, and Orders tables, each non-key attribute depends only on the whole primary key, achieving 2NF.

/*
3. Third Normal Form (3NF):
a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies present and outline the steps to normalize the table to 3NF.
*/

/*
Third Normal Form (3NF):
A table is in Third Normal Form (3NF) if it meets the following conditions:
1. The table is in Second Normal Form (2NF).
2. It has no transitive dependencies; non-key attributes do not depend on other non-key attributes.

Identifying a 3NF Violation in the Sakila Database:
The `payment` table in the Sakila database violates 3NF because the `customer_name` and `staff_name` fields depend on `customer_id` and `staff_id` respectively, which in turn depend on `payment_id`.

Transitive Dependencies:
1. `payment_id` -> `customer_id`
2. `customer_id` -> `customer_name`
3. `payment_id` -> `staff_id`
4. `staff_id` -> `staff_name`

Normalizing the `payment` table to 3NF:
To normalize the `payment` table, we can split it into three tables: `payment`, `customers`, and `staff`.

Steps:
1. Remove the `customer_name` and `staff_name` fields from the `payment` table.
2. Create new `customers` and `staff` tables that include the `customer_id` and `staff_id` fields along with `customer_name` and `staff_name` respectively.
*/

-- Check the payment table
USE sakila;
DESCRIBE payment;
SELECT * FROM payment;

-- Here's the modified table structure:
CREATE DATABASE my_database_2;

-- Create Customers Table:
USE my_database_2;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);
DESCRIBE customers;
SELECT * FROM customers;

-- Create Staff Table:
CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(255)
);
DESCRIBE staff;
SELECT * FROM staff;

-- Create Payment Table:
CREATE TABLE payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    rental_id INT,
    amount DECIMAL(5,2),
    payment_date DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);
DESCRIBE payment;
SELECT * FROM payment;

-- Insert Sample Data to Demonstrate Normalization
INSERT INTO customers (customer_id, customer_name) VALUES 
(1, 'John Doe');

INSERT INTO staff (staff_id, staff_name) VALUES 
(2, 'Staff A');

INSERT INTO payment (payment_id, customer_id, staff_id, rental_id, amount, payment_date) VALUES 
(1, 1, 2, 16046, 2.99, '2023-01-01 10:00:00'),
(2, 1, 2, 16047, 0.99, '2023-01-01 11:00:00');

-- Verify the Data in New Tables:
SELECT * FROM customers;
SELECT * FROM staff;
SELECT * FROM payment;

/*
By creating Customers, Staff, and Payment tables, each non-key attribute depends only on the primary key of its respective table, achieving 3NF.
-- **Note:** For demonstration purposes, I have created a new database instead of using the existing Sakila database. 
   Please keep this in mind when running queries and checking results.

*/

/*
4. Normalization Process:
a. Take a specific table in Sakila and guide through the process of normalizing it from the initial unnormalized form up to at least 2NF.
*/

-- Unnormalized Form
-- Let's start with the `address` table in Sakila as an example:
USE sakila;
SELECT * FROM address;
DESCRIBE address;

/*
This table is unnormalized because it includes the city name in addition to the city_id.
*/

-- First Normal Form (1NF)
-- To achieve 1NF, we need to ensure each column contains only atomic values and there are no repeating groups.
-- Let's restructure the table to ensure all values are atomic:

-- Create Address Table in New Database:
CREATE DATABASE my_database_3;
USE my_database_3;
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    address VARCHAR(255),
    address2 VARCHAR(255),
    district VARCHAR(255),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(20)
);
DESCRIBE address;
SELECT * FROM address;

/*
-- Insert sample data to demonstrate 1NF
INSERT INTO address (address_id, address, address2, district, city_id, postal_code, phone) VALUES 
(1, '47 MySakila', 'Apt. 101', 'Alberta', 300, '123456', '555-1234'),
(2, '28 MyStreet', 'Suite 202', 'Ontario', 301, '234567', '555-5678');

-- Verify the data in new table
SELECT * FROM address;

-- The `address` table is now in 1NF because each column contains only atomic values.
*/

-- Second Normal Form (2NF)
-- To achieve 2NF, we must eliminate partial dependencies. Let's also normalize the `city` information by moving it to a separate table.

-- Create City Table:
USE my_database_3;
CREATE TABLE city (
    city_id INT PRIMARY KEY,
    city VARCHAR(255)
);
DESCRIBE city;
SELECT * FROM city;

-- Create Updated Address Table:
CREATE TABLE address_new (
    address_id INT PRIMARY KEY,
    address VARCHAR(255),
    address2 VARCHAR(255),
    district VARCHAR(255),
    city_id INT,
    postal_code VARCHAR(10),
    phone VARCHAR(20),
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);
DESCRIBE address_new;
SELECT * FROM address_new;

/*
-- Insert sample data to demonstrate 2NF
INSERT INTO city (city_id, city) VALUES 
(300, 'Edmonton'),
(301, 'Toronto');

INSERT INTO address_new (address_id, address, address2, district, city_id, postal_code, phone) VALUES 
(1, '47 MySakila', 'Apt. 101', 'Alberta', 300, '123456', '555-1234'),
(2, '28 MyStreet', 'Suite 202', 'Ontario', 301, '234567', '555-5678');

-- Verify the data in new tables
SELECT * FROM city;
SELECT * FROM address_new;

/*
By creating `City` and `Address` tables, each non-key attribute depends only on the whole primary key of its respective table, achieving 2NF.
*/

/*
5. CTE Basics:
a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they have acted in from the actor and film_actor tables.
*/
USE sakila;

-- Create the CTE to calculate the number of films each actor has acted in
WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        a.first_name,
        a.last_name,
        COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)

-- Select from the CTE to get the distinct list of actor names and their film counts
SELECT 
    first_name,
    last_name,
    film_count
FROM ActorFilmCount
ORDER BY last_name, first_name;

/*
6. CTE with Joins:
a. Create a CTE that combines information from the film and language tables to display the film title, language name, and rental rate.
*/
-- Creating a CTE that combines information from the film and language tables
WITH FilmLanguageCTE AS (
    SELECT 
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
-- Select from the CTE
SELECT * FROM FilmLanguageCTE;

/*
7. CTE for Aggregation:
a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) from the customer and payment tables.
*/
USE sakila;

-- Create the CTE to calculate the total revenue generated by each customer
WITH CustomerRevenue AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)

-- Select from the CTE to get the total revenue for each customer
SELECT 
    customer_id,
    first_name,
    last_name,
    total_revenue
FROM CustomerRevenue
ORDER BY total_revenue DESC;

/*
8. CTE with Window Functions:
a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
*/
USE sakila;

-- Create the CTE to calculate the rental duration for each film and rank them
WITH FilmRank AS (
    SELECT 
        film_id,
        title,
        rental_duration,
        RANK() OVER (ORDER BY rental_duration DESC) AS film_rank
    FROM film
)

-- Select from the CTE to get the film rankings
SELECT 
    film_rank,
    title,
    rental_duration
FROM FilmRank
ORDER BY film_rank;

/*
9. CTE and Filtering:
a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the customer table to retrieve additional customer details.
*/
USE sakila;

-- Create the CTE to find customers with more than two rentals
WITH CustomerRentals AS (
    SELECT 
        r.customer_id,
        COUNT(r.rental_id) AS rental_count
    FROM rental r
    GROUP BY r.customer_id
    HAVING COUNT(r.rental_id) > 2
)

-- Join the CTE with the customer table to retrieve additional customer details
SELECT 
    cr.customer_id,
    c.first_name,
    c.last_name,
    cr.rental_count
FROM CustomerRentals cr
JOIN customer c ON cr.customer_id = c.customer_id
ORDER BY cr.rental_count DESC;

/*
10. CTE for Date Calculations:
a. Write a query using a CTE to find the total number of rentals made each month, considering the rental_date from the rental table.
*/
USE sakila;

-- Create the CTE to calculate the total number of rentals made each month
WITH MonthlyRentals AS (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
        COUNT(rental_id) AS total_rentals
    FROM rental
    GROUP BY rental_month
)

-- Select from the CTE to get the total number of rentals each month
SELECT 
    rental_month,
    total_rentals
FROM MonthlyRentals
ORDER BY rental_month;

/*
11. CTE and Self-Join:
a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
*/
USE sakila;

-- Create the CTE to list all actor-film combinations
WITH ActorFilms AS (
    SELECT 
        actor_id,
        film_id
    FROM film_actor
)

-- Self-join the CTE to find pairs of actors who have appeared in the same film
SELECT 
    af1.actor_id AS actor_id1,
    af2.actor_id AS actor_id2,
    af1.film_id
FROM ActorFilms af1
JOIN ActorFilms af2 ON af1.film_id = af2.film_id
WHERE af1.actor_id < af2.actor_id
ORDER BY af1.actor_id, af2.actor_id;

/*
12. CTE for Recursive Search:
a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column.
*/
USE sakila;

-- Add the reports_to column to the staff table (if not already present)
ALTER TABLE staff
ADD COLUMN reports_to TINYINT UNSIGNED AFTER store_id;

-- Update the reports_to column with example data (if not already present)
UPDATE staff SET reports_to = 1 WHERE staff_id IN (2, 3);  -- Staff 2 and 3 report to Staff 1
UPDATE staff SET reports_to = 2 WHERE staff_id IN (4, 5);  -- Staff 4 and 5 report to Staff 2

-- Verify the data has been updated
SELECT * FROM staff;

-- Create the recursive CTE to find employees reporting to a specific manager
WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: find the direct reports of the specific manager
    SELECT staff_id, first_name, last_name, reports_to
    FROM staff
    WHERE reports_to = 1  -- Specify the manager's staff_id

    UNION ALL

    -- Recursive member: find the employees who report to the direct reports
    SELECT s.staff_id, s.first_name, s.last_name, s.reports_to
    FROM staff s
    INNER JOIN EmployeeHierarchy eh ON s.reports_to = eh.staff_id
)

-- Select the results from the CTE
SELECT staff_id, first_name, last_name, reports_to
FROM EmployeeHierarchy;

/*
Important Note:
The `reports_to` column has been added to the `staff` table in the Sakila database to address the final question on implementing
a recursive CTE to find all employees who report to a specific manager using the `reports_to` column. This column wasn't originally
part of the database, so it has been added specifically for question 12.

If this addition conflicts with any other questions, you may drop this column and 
use it only for the final question. To remove the column, execute the following:

    USE sakila;
    ALTER TABLE staff
    DROP COLUMN reports_to;
*/

/*
I want to extend my heartfelt gratitude to the faculty and 
staff at PW Skills for their exceptional support and guidance throughout this assignment. 
Their expertise and encouragement have been instrumental in helping me grasp and apply SQL effectively.
I am especially thankful for their time and insightful feedback in assessing this assignment.
This experience has significantly enhanced my understanding of database management and SQL queries, inspiring 
me to further delve into this field. I am eager to apply these skills to real-world scenarios and continue my journey in data management and analysis.
*/



