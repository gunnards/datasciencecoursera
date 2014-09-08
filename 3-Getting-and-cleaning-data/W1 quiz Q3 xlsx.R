if (!file.exists("data")) {
        dir.create("data")
}

# Question 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "./data/NaturalGas.xlsx", method = "curl")
dateDownloaded2 <- date()
list.files("./data")

install.packages("xlsx")
library(xlsx)

gasData <- read.xlsx("./data/NaturalGas.xlsx", sheetIndex=1, header = TRUE)
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("./data/NaturalGas.xlsx", sheetIndex=1, rowIndex=rowIndex, colIndex= colIndex)

sum(dat$Zip*dat$Ext,na.rm=T)