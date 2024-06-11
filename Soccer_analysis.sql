**Extraction of matches.csv file from sqlite file using Pandas**
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
*********************************************************************************************
*********************************************************************************************
