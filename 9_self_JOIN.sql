/* Question 1
How many stops are in the database.
*/

SELECT COUNT(name)
FROM stops


/* Question 2
Find the id value for the stop 'Craiglockhart'
*/

SELECT id
FROM stops
WHERE name = 'Craiglockhart'


/* Question 3
Give the id and the name for the stops on the '4' 'LRT' service.
*/

SELECT id,
       name
FROM stops
JOIN route ON stops.id = route.stop
WHERE route.num = '4'
  AND route.company = 'LRT'


/* Question 4
The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53). 
Run the query and notice the two services that link these stops have a count of 2. 
Add a HAVING clause to restrict the output to these two routes.
*/

SELECT company,
       num,
       COUNT(*)
FROM route
WHERE stop = 149
   OR stop = 53
GROUP BY company,
         num
HAVING COUNT(*) = 2


/* Question 5
Show the services from Craiglockhart to London Road.
*/

SELECT a.company,
       a.num,
       a.stop,
       b.stop
FROM route a
JOIN route b ON (a.company = b.company
                 AND a.num = b.num)
WHERE a.stop = 53
  AND b.stop = 149


/* Question 6
Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
*/




/* Question 7
Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
*/

SELECT name
FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE movieid =
    (SELECT id
     FROM movie
     WHERE title = 'Alien')


/* Question 8
Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
*/

SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE actorid =
    (SELECT id
     FROM actor
     WHERE name = 'Harrison Ford')


/* Question 9
Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, 
including 'Craiglockhart' itself, offered by the LRT company. 
Include the company and bus no. of the relevant services.
*/

SELECT title
FROM movie
JOIN casting ON casting.movieid = movie.id
WHERE actorid =
    (SELECT id
     FROM actor
     WHERE name = 'Harrison Ford')
  AND ord <> 1

/* Question 10
Find the routes involving two buses that can go from Craiglockhart to Sighthill.
Show the bus no. and company for the first bus, the name of the stop for the transfer,
and the bus no. and company for the second bus.
*/


