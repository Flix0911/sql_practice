-- Create below table for Teams
create table teams(
	id serial primary key,
	name varchar(255) not null,
	stadium varchar(255),
	division varchar(255),
	conference varchar(255),
	head_coach varchar(255),
	active boolean
);

-- Create below table for Players
create table players(
	id serial primary key,
	name varchar(255) not null,
	position varchar(255),
	salary integer,
	team_id integer references teams
);


-- List the names of all NFL teams
SELECT name FROM teams;

-- List the stadium name and head coach of all NFC teams
SELECT stadium, head_coach 
FROM teams;

-- List the head coaches of the AFC South
SELECT head_coach 
FROM teams 
WHERE conference = 'AFC' AND division = 'South'

-- The total number of players in the NFL
SELECT COUNT(*) 
FROM players;

-- The team names and head coaches of the NFC North and AFC East
SELECT head_coach, name
FROM teams
WHERE (conference = 'NFC' OR conference = 'AFC')
    AND (division = 'South' OR division = 'North')


-- The 50 players with the highest salaries
SELECT salary
FROM players
ORDER BY salary DESC
LIMIT 50;

-- The average salary of all NFL players
SELECT AVG(salary)
FROM players;

-- The names and positions of players with a salary above 10_000_000
SELECT name, position
FROM players
WHERE salary > 1000000;

-- The player with the highest salary in the NFL
-- The name and position of the first 100 players with the lowest salaries
-- The average salary for a DE in the nfl