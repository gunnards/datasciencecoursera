library(sqldf)

if (!file.exists("data")) {
        dir.create("data")
}

# Download dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "./data/acs_w2q2.csv", method = "curl")

# Read dataset
acs <- read.csv("./data/acs_w2q2.csv")

# Q2
#a
head(sqldf("select pwgtp1 from acs"),10)
#b
head(sqldf("select pwgtp1 from acs where AGEP < 50"),10)
#c
head(sqldf("select * from acs where AGEP < 50"),10)
#d
head(sqldf("select * from acs"),10)

#Q3
# a
sqldf("select distinct AGEP from acs")
#b
sqldf("select unique AGEP from acs")
#c
sqldf("select unique * from acs")
#d
sqldf("select distinct pwgtp1 from acs")