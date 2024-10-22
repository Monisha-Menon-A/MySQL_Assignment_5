create database assignment_5;
use assignment_5;

create table country (id int primary key,
country_name varchar(50),
population varchar(50),
area_sqkm varchar(50));
desc country;
insert into country(id, country_name, population, area_sqkm)
values(1, 'India', '90000000', '32 lakhs'),
(2, 'China', '90000000', '97 lakhs'),
(3, 'USA', '80000000', '93 lakhs'),
(4, 'UK', '70000000', '2 lakhs'),
(5, 'Canada', '60000000', '99 lakhs'),
(6, 'Australia', '50000000', '50 lakhs'),
(7, 'Netherlands', '40000000', '32 lakhs'),
(8, 'Sweden', '30000000', '4 lakhs'),
(9, 'Austria', '20000000', '3 lakhs'),
(10, 'Switzerland', '10000000', '2 lakhs');
select*from country;

create table persons (id int primary key,
first_name varchar(50),
last_name varchar(50),
population varchar(50),
rating int,
country_id int,
country_name varchar(50));
desc persons;
insert into persons(id, first_name, last_name, population,rating,country_id,country_name)
values(1, 'Lisha', 'Thomas', '90000000', 1, 1, 'India'),
(2, 'Chaang', 'Yaang', '90000000', 2, 2, 'China'),
(3, 'Thomas', 'Cook', '80000000', 3, 3, 'USA'),
(4, 'Diana', 'Xavier', '90000000', 1, 1, 'India'),
(5, 'Freddy', 'Dainz', '60000000', 5, 5, 'Canada'),
(6, 'Hari', 'Sharma', '90000000', 1, 1, 'India'),
(7, 'william', 'Blake', '40000000', 7, 7, 'Netherlands'),
(8, 'Right', 'Thomas', '30000000',8, 8, 'Sweden'),
(9, 'Cindrella', 'John', '20000000', 9, 9, 'Austria'),
(10, 'Irene', 'Dizooza', '10000000', 10, 10, 'Iceland');
select*from persons;

#print the first three characters of Country_name from the Country table
select substring(country_name,1,3) as FirstThreeCharacters from country;

#concatenate first name and last name from Persons table
select concat(first_name, ' ', last_name) as FULLNAME from persons;

#count the number of unique country names from Persons table
select count(distinct country_name) as DISTINCTCOUNTRIES from persons;

#print the maximum population from the Country table
select max(population) as MAXIMUMPOPULATION from country;

#print the minimum population from Persons table
select min(population) as MINIIMUMPOPULATION from persons;

# Insert 2 new rows to the Persons table making the Lname NULL
insert into persons(id, first_name, last_name, population,rating,country_id,country_name)
values(11, 'Janu', NULL, '90000000', 1, 1, 'India'),
(12, 'Hansu', NULL, '10000000', 10, 10, 'Iceland');
select*from persons;
#count Lname from Persons table
select count(last_name) as COUNTLASTNAME from persons;

#number of rows in the Persons table
select count(id) as NoOfRows from persons;

#population of the Country table for the first 3 rows
select country_name,population from country limit 3;

#print 3 random rows of countries
select* from country order by rand() limit 3;

#List all persons ordered by their rating in descending order
select*from persons order by rating desc;

# total population for each country in the Persons table
select sum(population) as TOTALPOPULATION from persons;

#countries in the Persons table with a total population greater than 50,000
select distinct country_name from persons where population>50000;

/*total number of persons and average rating for each country, 
but only for countries with more than 2 persons, ordered by the average rating 
in ascending order*/
select count(first_name) as totalpersons, avg(rating) as avgrating, country_name from 
persons group by country_name having count(country_name)>2 
order by avgrating asc;