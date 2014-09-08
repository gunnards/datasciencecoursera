if (!file.exists("data")) {
        dir.create("data")
}

# Question 1
# Download dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/2006_housing.csv", method = "curl")
dateDownloaded <- date()
list.files("./data")

housingData <- read.csv("./data/2006_housing.csv")

"How many properties are worth $1,000,000 or more?"
nrow(housingData[housingData$VAL == 24 & !is.na(housingData$VAL),])

# Question 2
# Use the data you loaded from Question 1. Consider the variable FES in the code book. Which of the "tidy data" principles does this variable violate?

"Tidy data has one variable per column."

# Question 3
fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl2, destfile = "./data/NaturalGas.xlsx", method = "curl")
dateDownloaded2 <- date()
list.files("./data")

install.packages("xlsx")
library(xlsx)

gasData <- read.xlsx("./data/NaturalGas.xlsx", sheetIndex=1, header = TRUE)
rowIndex <- 18:23
colIndex <- 7:15
dat <- read.xlsx("./data/NaturalGas.xlsx", sheetIndex=1, rowIndex=rowIndex, colIndex= colIndex)

sum(dat$Zip*dat$Ext,na.rm=T) 

