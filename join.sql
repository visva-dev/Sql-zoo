SELECT matchid, player
FROM goal
WHERE teamid = 'GER'

SELECT id, stadium, team1, team2
FROM game
WHERE id = 1012

SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid ='GER'

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON (teamid=id)
WHERE gtime<=10

SELECT mdate, teamname
FROM game JOIN eteam ON (team1= eteam.id)
WHERE coach ='Fernando Santos'

SELECT player
FROM game JOIN goal ON(id=matchid)
WHERE stadium = 'National Stadium, Warsaw'

SELECT DISTINCT player
FROM game JOIN goal ON id=matchid
WHERE teamid!='GER' AND (team1='GER'
  OR team2='GER')

SELECT teamname, COUNT(gtime)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname

SELECT stadium, COUNT(gtime)
FROM game JOIN goal ON (id=matchid)
GROUP BY stadium

SELECT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

SELECT DISTINCT matchid, mdate, COUNT(teamid)
FROM game JOIN goal ON matchid = id
WHERE (teamid ='GER')
GROUP BY  matchid,mdate

SELECT
  game.mdate, game.team1,
  SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) AS score1,
  game.team2,
  SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) AS score2
FROM
  game LEFT JOIN goal ON game.id = goal.matchid
GROUP BY
  game.mdate, game.team1, game.team2
ORDER BY
  game.mdate, goal.matchid;