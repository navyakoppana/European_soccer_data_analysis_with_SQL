# European_soccer_data_analysis_with_SQL
## Table of contents
Overview
Files in the repository
Summary of the analysis
Acknowledgements

### Overview
The goal of this project is to apply query language(PostgreSQL) to examine the dataset in aggregate, uncovering meaningful insights.
### Files in repository
Soccer_analysis.sql:This file contains all queries analyzed including extraction of csv files from sqlite file.
countries.csv: It contains the list of countries where the games are played and their unique ids.
leagues.csv: It contains the specific titles of the sports events/league matches.
matches.csv: It contains performance metrics of various players for different league matches. The information is specified using the unique ids of the other three tables: Country, League, and Team.
players.csv: It has Players’ names, height, weight, birth date, FIFA ID, and API ID.
player_attributes.csv: It has various parameters like rating, possible score, best foot, etc., for each player to highlight their overall performance.
teams.csv: It contains teams’ names (short and long), and their IDs for API and FIFA.
team_attributes(1).csv: It contains various columns that reflect each team’s performance.
### Summary of the analysis
1. A total of 25979 matches and 11 leagues in dataset.
2. Out of 8 seasons played from 2008-2016, the highest number of matches are playes in 2008-09,2015-16 matches.
3. The matches were played from July 2008 to May 2016.
4. France has the highest number of teams and Switzerland has the least number of teams.
5. The highest number of goals are scored by England in 2009-10.
6. The Spanish team "FC Barcelona" has the highest number of wins
### Acknowledgements
The dataset is taken from Kaggle <a href="https://www.kaggle.com/datasets/abdelrhmanragab/european-soccer-database">European_Soccer_Database</a>
