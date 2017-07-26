/* Question 1
The first example shows the goal scored by a player with the last name 'Bender'. 
The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
Modify it to show the matchid and player name for all goals scored by Germany. 
To identify German players, check for: teamid = 'GER'
*/

SELECT matchid,
       player
FROM goal
WHERE teamid = 'GER'


/* Question 2
Show id, stadium, team1, team2 for just game 1012
*/

SELECT id,
       stadium,
       team1,
       team2
FROM game
WHERE id = 1012


/* Question 3
Show the player, teamid, stadium and mdate and for every German goal.
*/

SELECT player,
       teamid,
       stadium,
       mdate
FROM goal
JOIN game ON (id = matchid)
WHERE teamid='GER'


/* Question 4
Show the team1, team2 and player for every goal scored by a player called Mario.
*/

SELECT team1,
       team2,
       player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE player LIKE 'Mario%'

/* Question 5
Show player, teamid, coach, gtime for all goals scored in the first 10 minutes.
*/

SELECT player,
       teamid,
       coach,
       gtime
FROM goal
JOIN eteam ON teamid = id
WHERE gtime <= 10


/* Question 6
List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
*/

SELECT mdate,
       teamname
FROM eteam
JOIN game ON eteam.id = team1
WHERE coach = 'Fernando Santos'


/* Question 7
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
*/

SELECT player
FROM goal
JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'


/* Question 8
Show the name of all players who scored a goal against Germany.
*/

SELECT DISTINCT player
FROM game
JOIN goal ON matchid = id
WHERE (team1='GER'
       OR team2='GER')
  AND goal.teamid <> 'GER'


/* Question 9
Show teamname and the total number of goals scored.
*/

SELECT teamname,
       COUNT(teamid)
FROM goal
LEFT JOIN eteam ON goal.teamid = eteam.id
GROUP BY teamname


/* Question 10
Show the stadium and the number of goals scored in each stadium.
*/

SELECT stadium,
       COUNT(player)
FROM game
JOIN goal ON matchid = id
GROUP BY stadium


/* Question 11
For every match involving 'POL', show the matchid, date and the number of goals scored.
*/

SELECT matchid,
       mdate,
       COUNT(player)
FROM game
JOIN goal ON matchid = id
WHERE (team1 = 'POL'
       OR team2 = 'POL')
GROUP BY matchid,
         mdate


/* Question 12
For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
*/

SELECT matchid,
       mdate,
       COUNT(player)
FROM goal
JOIN game ON matchid = id
WHERE teamid = 'GER'
GROUP BY matchid,
         mdate


/* Question 13
List every match with the goals scored by each team.
*/

SELECT mdate,
       team1,
       SUM(CASE
               WHEN teamid=team1 THEN 1
               ELSE 0
           END) score1,
       team2,
       SUM(CASE
               WHEN teamid = team2 THEN 1
               ELSE 0
           END) score2
FROM game
LEFT JOIN goal ON matchid = id
GROUP BY mdate,
         team1,
         team2
ORDER BY mdate,
         matchid,
         team1,
         team2
