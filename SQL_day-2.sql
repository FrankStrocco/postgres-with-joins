Relatively Simple JOINS

<!-- What languages are spoken in the United States? (12) Brazil? (not Spanish...) Switzerland? (6) -->

SELECT
	c.code,
    c.name AS country,
    cl.language AS language
FROM
	country c JOIN
    countrylanguage cl ON c.code = cl.countrycode
WHERE name= 'United States'

ORDER BY
	c.name,
    language

    SELECT
    	c.code,
        c.name AS country,
        cl.language AS language
    FROM
    	country c JOIN
        countrylanguage cl ON c.code = cl.countrycode
    WHERE name= 'Brazil'

    ORDER BY
    	c.name,
        language

        SELECT
        	c.code,
            c.name AS country,
            cl.language AS language
        FROM
        	country c JOIN
            countrylanguage cl ON c.code = cl.countrycode
        WHERE name= 'Switzerland'

        ORDER BY
        	c.name,
            language



What are the cities of the US? (274) India? (341)
Languages

SELECT
	cy.name AS city,
    c.name AS country
FROM
	city cy JOIN
    country c ON cy.countrycode = c.code
WHERE c.name='United States'


SELECT
	cy.name AS city,
    c.name AS country
FROM
	city cy JOIN
    country c ON cy.countrycode = c.code
WHERE c.name='India'



What are the official languages of Switzerland? (4 languages)

SELECT
	cl.language AS countrylanguage,
    c.code AS country
FROM
    country c JOIN
    countrylanguage cl ON cl.countrycode = c.code

WHERE cl.countrycode='CHE'



Which country or contries speak the most languages? (12 languages)
Hint: Use GROUP BY and COUNT(...)
SELECT
    c.code AS country,
    count(cl.language) AS LangCount
FROM
    country c JOIN
    countrylanguage cl ON cl.countrycode = c.code

GROUP BY
	c.code
ORDER BY
	LangCount desc
LIMIT (SELECT max(count(cl.language)))



Which country or countries have the most offficial languages? (4 languages)
Hint: Use GROUP BY and ORDER BY

SELECT

	c.code AS country,
    count(cl.isofficial) AS officialcount
FROM
	country c JOIN
    countrylanguage cl ON cl.countrycode = c.code
WHERE
	(cl.isofficial = true)
GROUP BY
	c.code
ORDER BY
	officialcount desc


Which languages are spoken in the ten largest (area) countries?
Hint: Use WITH to get the countries and join with that table

WITH largest10countries AS (SELECT surfacearea, name, code FROM country ORDER BY surfacearea desc LIMIT 10)
SELECT
	l10c.name AS country,
    l10c.surfacearea AS countrySize,
    cl.language AS countrylanguage
FROM
	largest10countries l10c JOIN
    countrylanguage cl ON cl.countrycode = l10c.code
GROUP BY
	l10c.name, l10c.surfacearea, cl.language
ORDER BY
	l10c.surfacearea desc





What languages are spoken in the 20 poorest (GNP/ capita) countries in the world? (94 with GNP > 0)
Hint: Use WITH to get the countries, and SELECT DISTINCT to remove duplicates
WITH poorest20 AS (SELECT name, code, (gnp/population) AS capita FROM country
                   WHERE population > 0 and gnp > 0 ORDER BY capita asc LIMIT 20)
SELECT
	pt20.capita,
    pt20.name,
    cl.language
FROM
	poorest20 pt20 JOIN
    countrylanguage cl ON pt20.code = cl.countrycode
GROUP BY
	pt20.name,
    pt20.capita,
    cl.language
ORDER BY pt20.capita asc




Are there any countries without an official language?
Hint: Use NOT IN with a SELECT

SELECT
	c.code AS country,
    cl.isofficial AS countrylanguage

FROM
	country c JOIN
    countrylanguage cl ON c.code = cl.countrycode

WHERE NOT cl.isofficial IS NULL

What are the languages spoken in the countries with no official language? (49 countries, 172 languages, incl. English)
Which countries have the highest proportion of official language speakers? The lowest?

SELECT
	c.code AS country,
    cl.isofficial AS countrylanguage,
    cl.language AS countrylanguage,
    count(cl.isofficial=false) AS nonofficiallangs,
    count(cl.language) AS langs


FROM
	country c JOIN
    countrylanguage cl ON c.code = cl.countrycode
WHERE

GROUP BY
	c.code,
    cl.isofficial,
    cl.language
ORDER BY country desc;


What is the most spoken language in the world?
Cities

What is the population of the United States? What is the city population of the United States?
What is the population of the India? What is the city population of the India?
Which countries have no cities? (7 not really contries...)
Languages and Cities

What is the total population of cities where English is the offical language? Spanish?
Hint: The official language of a city is based on country.
Which countries have the 100 biggest cities in the world?
What languages are spoken in the countries with the 100 biggest cities in the world?
