library(DBI)
library(RMySQL)


# specify credentials for DCAST group in ~/.my.cnf file
con <- dbConnect(MySQL(), 
      group="C:/Users/brandon/Dropbox/ECSU Fall 2017/Senior research/Research topic/databases/usrLoginSQL11_8_17.sql",
      password="Pugpug911", user="root", port=3306,dbname="mydb")

# query the database
rs <-  dbSendQuery(con,
    "select * from usrnme where UsrNme = 'xyz'")

# get the first 10 results
results <- fetch(rs)
print(results)

# get the rest of the results
print(fetch(rs))
#############################################
########### Security check point for the SQL query 
sql<-"select * from usrnme where UsrNme =?UsrNme;"
z<-sqlInterpolate(ANSI(),sql,UsrNme = "xyz' union select 1,2,3 --+' Limit0,1'")

dbGetQuery(con,z)
z

