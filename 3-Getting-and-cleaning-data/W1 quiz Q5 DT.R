if (!file.exists("data")) {
        dir.create("data")
}

# Question 5
install.packages("data.table")
library(data.table)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file(fileUrl, destfile = "./data/idaho.csv", method = "curl")

DT <- fread("./data/idaho.csv")

#Wrong
# rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
# mean(DT$pwgtp15,by=DT$SEX)


system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
system.time(DT[,mean(pwgtp15),by=SEX])

# tie breaker
system.time(for (i in 1:10) (sapply(split(DT$pwgtp15,DT$SEX),mean))) ## winner
system.time(for (i in 1:10) (tapply(DT$pwgtp15,DT$SEX,mean)))