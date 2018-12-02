SPOOL project.out
SET ECHO ON
/*
CIS 353 - Database Design Project
Devin Monday
Kyle VanDenHeuvel
Nathan VandenHoek
Samuel Ventocilla
*/

--< The SQL/DDL code that creates your schema >

--
-- Drop the tables
--
DROP TABLE players CASCADE CONSTRAINTS;
DROP TABLE game CASCADE CONSTRAINTS;
DROP TABLE properties CASCADE CONSTRAINTS;
DROP TABLE special_properties CASCADE CONSTRAINTS;
DROP TABLE special_spaces CASCADE CONSTRAINTS;
DROP TABLE plays CASCADE CONSTRAINTS;
DROP TABLE rent CASCADE CONSTRAINTS;
--
-- Create tables
--
CREATE TABLE players (
	username	varchar2(15) PRIMARY KEY,
	bankaccount	char,
	gamepiece 	char,
	password    	char,
	firstname	char,
	lastname	char,
--
-- PlIC1: All players must have a unique username
CONSTRAINT PlIC1 UNIQUE (username),
-- PRIC1: The property name is the foreign key for the player
-- FIXME 
);
--
CREATE TABLE game (
	gameID		integer
	gamerules	char
	playersingame	integer
--
-- GIC1: There can be no more than 6 players in a game
CONSTRAINT GIC1 CHECK (playersingame <= 6),
);
--
CREATE TABLE properties (
	propertyname	char,
	mortgagevalue	integer,
	rentperhouse	integer,
	price		integer,
	renthouseprice	integer,
	location	char,
);
--
CREATE TABLE special_properties (
	location	
	rent		integer,
	price		integer,
	propertype
--
-- SPIC1: If type is utilities the price can't be more than $250
CONSTRAINT SPIC1 CHECK (NOT(type = "utilities" AND price > 250),
);
--
CREATE TABLE special_spaces (
	locationnumber	integer,
	spacetype	char,
);
--
CREATE TABLE plays (
	PRIMARY KEY (username, gameID)
);
--
CREATE TABLE rent (
	primary key (
		username,
		rentamt integer),\
);

--
-- Add foreign keys:
ALTER TABLE properties
ADD FOREIGN KEY (location) references special_properties(location)
Deferrable initially deferred;
ALTER TABLE plays
ADD FOREIGN KEY (username) references players(location)
Deferrable initially deferred;
ALTER TABLE plays
ADD FOREIGN KEY (gameID) references game(gameID)
Deferrable initially deferred;
ALTER TABLE special_properties
ADD FOREIGN KEY (location) references rent(location)
Deferrable initially deferred;

SET FEEDBACK OFF

--< The INSERT statements that populate the tables>
--Important: Keep the number of rows in each table small enough so that the results of your
--queries can be verified by hand. See the Sailors database as an example.
SET FEEDBACK ON
COMMIT;

--< One query (per table) of the form: SELECT * FROM table; in order to print out your
--database >

--< The SQL queries>. Include the following for each query:
--1. A comment line stating the query number and the feature(s) it demonstrates
--(e.g. – Q25 – correlated subquery).
--2. A comment line stating the query in English.
--3. The SQL code for the query.

--< The insert/delete/update statements to test the enforcement of ICs >
--Include the following items for every IC that you test (Important: see the next section titled
-- "Submit a final report" regarding which ICs to test).
  --A comment line stating: Testing: < IC name>
  --A SQL INSERT, DELETE, or UPDATE that will test the IC.
COMMIT;
--
SPOOL OFF
