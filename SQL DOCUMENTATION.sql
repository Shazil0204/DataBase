-- 															All SQL Code

-- CREATE TABLE

CREATE TABLE celebs (
   id INTEGER, 
   name TEXT, 
   age INTEGER
);

INSERT INTO celebs (id, name, age) 
VALUES (1, 'Justin Bieber', 22);

-- ALTER

ALTER TABLE celebs 
ADD COLUMN twitter_handle TEXT; 

SELECT * FROM celebs; 

-- UPDATE
UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4; 

--DELETE
DELETE FROM celebs 
WHERE twitter_handle IS NULL;

-- Constraints

CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable'
);

-- DISTINCT

select distinct name from celebs;

-- AS

SELECT name AS ' ' FROM movies;

-- distinct

select distinct name from movies; -- this will only show one name only once so like if you have two or more then 2 movies with the same name it will only show the name once  

-- WHERE

SELECT *
FROM movies
WHERE imdb_rating > 8;

-- LIKE

SELECT * 
FROM movies
WHERE name LIKE 'Se_en';

-- BETWEEN

SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

-- AND

Select  * from movies where year < 1985 and genre = 'horror';

-- OR

select * from movies where year < 1950 or genre = 'romance';

-- order BY

select * from movies order by imdb_rating desc;

-- limit

select name from movies limit 10; -- this will only show 10 name

-- CASE

SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'
  WHEN imdb_rating > 6 THEN 'Poorly Received'
  ELSE 'Avoid at All Costs'
 END
FROM movies; -- this is just like if or else if in C#

-- COUNT

select count(*) from fake_apps where price = 0.0;

-- SUM

select sum(downloads) from fake_apps;

-- MAX/MIN

select min(downloads) from fake_apps;

select max(price) from fake_apps;

-- average

select AVG(price) from fake_apps;

-- ROUND

select round(price, 0) from fake_apps; -- this will round the number to it nears number 
-- the 0 is how many DECIMAL you want with your number

select round(avg(price), 2) from fake_apps;

-- group by 1

select price, count(*) from fake_apps where downloads > 20000 group by price ;

-- remmeber The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.

-- the group by will group columns the way it works is that it will find columns with the same name or VALUE
-- and make them one 

select category, sum(downloads) from fake_apps group by category;

-- group by 2

-- this works the same way as group by 1 the only difference is that you group two colums instead of just one

-- HAVING

SELECT price, 
   ROUND(AVG(downloads)),
   COUNT(*)
FROM fake_apps
GROUP BY price
having count(*) > 10;

-- When we want to limit the results of a query based on values of the individual rows, use WHERE.
-- When we want to limit the results of a query based on an aggregate property, use HAVING

-- combining TABLES

select * from orders join subscriptions on orders.subscription_id = subscriptions.subscription_id;

-- inner join

select count(*) from newspaper;

select count(*) from online;

select count(*) from newspaper join online on newspaper.id = online.id;

-- left join

select * from newspaper left join online on newspaper.id = online.id;

select * from newspaper left join online on newspaper.id = online.id WHERE online.id IS NULL;

-- Primary Key vs Foreign Key

-- Suppose Columbia University has two tables in their database:
-- The classes table contains information on the classes that the school offers. Its primary key is id.
-- The students table contains information on all students in the school. Its primary key is id. It contains the foreign key class_id, which corresponds to the primary key of classes.
-- Perform an inner join of classes and students using the primary and foreign keys described above, and select all the columns.

select * from classes join students on students.class_id = classes.id;

-- cross join

SELECT month, 
  COUNT(*)
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
  AND end_month >= month
GROUP BY month;

-- UNION

select * 
from newspaper
union
select * 
from online;

-- remmeber:
-- SQL has strict rules for appending data:
-- Tables must have the same number of columns.
-- The columns must have the same data types in the same order as the first table.

-- with

with previous_query AS(
  SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id
)

select customers.customer_name, previous_query.subscriptions
from previous_query join customers on customers.customer_id = previous_query.customer_id;

-- this will kind of create a new table for you. a new temporary table

