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

-- group by |

select price, count(*) from fake_apps where downloads > 20000 group by price ;

-- remmeber The GROUP BY statement comes after any WHERE statements, but before ORDER BY or LIMIT.

select category, sum(downloads) from fake_apps group by category;

-- group by ||

½