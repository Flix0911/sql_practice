-- Homework 1

-- Clue #1: We recently got word that someone fitting Carmen Sandiego's description has been traveling through Southern Europe. She's most likely traveling someplace where she won't be noticed, so find the least populated country in Southern Europe, and we'll start looking for her there.
SELECT name
FROM country
WHERE region = 'Southern Europe'
ORDER BY population ASC
LIMIT 1;

Output
Holy See (Vatican City State)


-- Clue #2: Now that we're here, we have insight that Carmen was seen attending language classes in this country's officially recognized language. Check our databases and find out what language is spoken in this country, so we can call in a translator to work with you.
SELECT code
FROM country
WHERE name = "Holy See (Vatican City State)";

Output
VAT

SELECT lanugage 
FROM countrylanguage
WHERE countrycode = 'VAT';

Output
Italian

-- Clue #3: We have new news on the classes Carmen attended: our gumshoes tell us she's moved on to a different country, a country where people speak only the language she was learning. Find out which nearby country speaks nothing but that language.
SELECT countrycode, isofficial
FROM countrylanguage
WHERE language = 'Italian';

Output
ITA
SMR
VAT - Already were here

-- Clue #4: We're booking the first flight out: maybe we've actually got a chance to catch her this time. There are only two cities she could be flying to in the country. One is named the same as the country – that would be too obvious. We're following our gut on this one; find out what other city in that country she might be flying to.

SELECT name
FROM city
WHERE countrycode = 'SMR'

Output
Serravalle
San Marino

Ruling out ITA

-- Clue #5: We're close! Our South American agent says she just got a taxi at the airport, and is headed towards the capital! Look up the country's capital, and get there pronto! Send us the name of where you're headed and we'll follow right behind you!

SELECT name
FROM country
WHERE code = 'SMR';

Output
Serravalle

-- Clue #6: Oh no, she pulled a switch: there are two cities with very similar names, but in totally different parts of the globe! She's headed to South America as we speak; go find a city whose name is like the one we were headed to, but doesn't end the same. Find out the city, and do another search for what country it's in. Hurry!
SELECT countrycode, name
FROM city
WHERE city.name ILIKE 'Serra';

Output
BRA
Serra

SELECT name
FROM country
WHERE code = 'BRA';

Output
Brazil

-- Clue #7: She knows we're on to her: her taxi dropped her off at the international airport, and she beat us to the boarding gates. We have one chance to catch her, we just have to know where she's heading and beat her to the landing dock.

-- Reference back to earlier saying the capital

SELECT capital
FROM country
WHERE code = 'BRA'


Output
211

SELECT name
from city
WHERE id = 211

Output
Bras�lia
-- Lucky for us, she's getting cocky. She left us a note, and I'm sure she thinks she's very clever, but if we can crack it, we can finally put her where she belongs – behind bars.

91804 - current population
9185 - when she get there

SELECT name, countrycode, district
from city
WHERE population = 91084

She is in Santa Monica, CA, USA