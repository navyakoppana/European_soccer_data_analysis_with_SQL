STEP-1:Extraction of matches.csv file from sqlite file using Pandas
#Note:All other csv files are extracted from other tables in same manner.
import pandas as pd
import sqlite3 
conn = sqlite3.connect('database.sqlite')
c = conn.cursor()
c.execute("""SELECT * FROM Match;""")
match = pd.DataFrame(c.fetchall())
match.columns = [x[0] for x in c.description]
match=match.iloc[:,:11]
match.to_csv('matches.csv',index=False)
**********************************************************************************************************************************************
STEP-2: CREATE a new database 'soccer'IN PostgreSQL and CREATE tables by importing data from above extracted .csv files 
  For instance,say
  CREATE TABLE league(
  id integer
  country_id integer
  name varchar)
After creating table and its columns, import the data from extracted leagues.csv file
**********************************************************************************************************************************************
STEP-3:Data analysis using PostgreSQL
  
Q.1. What are the total no of matches & leagues ?
    
SELECT COUNT(m.id) AS no_of_matches,COUNT(DISTINCT(l.name)) AS no_of_leagues
FROM League l
JOIN match m
ON m.league_id=l.id;

Q.2. How many matches for each season?

SELECT season,COUNT(id)as no_of_matches
FROM match
GROUP BY season
ORDER BY season;

Q.3. How many matches for each month of the year?

SELECT DATE_PART('year',date) AS Year,DATE_PART('month',date) AS Month,COUNT(id)as no_of_matches
FROM match
GROUP BY Year,Month
ORDER BY Year,Month;

Q.4. How many teams each country has?

SELECT c.name, COUNT(DISTINCT(t.team_long_name)) AS no_of_teams
FROM match m
JOIN country c
ON m.country_id=c.id
JOIN team t
ON m.home_team_Api_id=t.team_api_id
GROUP BY c.name
ORDER BY no_of_teams DESC;

Q.5. In which season the max goals are scored by home team grouped by country?

SELECT t2.name,t3.season,t3.Goals_scored_in_homecountry
FROM
(SELECT t1.name,max(t1.Goals_scored_in_homecountry) AS max_goals
FROM(SELECT c.name,m.season,SUM(m.home_team_goal) AS Goals_scored_in_homecountry
FROM match m
JOIN country c
ON m.country_id=c.id
GROUP BY c.name,m.season
ORDER BY c.name)t1
GROUP BY t1.name)t2
JOIN
(SELECT c.name,m.season,SUM(m.home_team_goal) AS Goals_scored_in_homecountry
FROM match m
JOIN country c
ON m.country_id=c.id
GROUP BY c.name,m.season)t3
ON t2.name=t3.name AND t2.max_goals=t3.Goals_scored_in_homecountry
ORDER BY t2.name;

Q.6. How many matches are won,lost and tie by teams?

SELECT t.team_long_name AS team,COUNT(CASE WHEN m.home_team_goal>away_team_goal THEN 'Win' END) AS no_of_wins,
						 COUNT(CASE WHEN m.home_team_goal<away_team_goal THEN 'Lose' END) AS no_of_losses,
						 COUNT(CASE WHEN m.home_team_goal=away_team_goal THEN 'Tie' END) AS no_of_ties
FROM match m
JOIN team t
ON m.home_team_api_id=t.team_api_id
GROUP BY t.team_long_name
ORDER BY no_of_wins DESC;

