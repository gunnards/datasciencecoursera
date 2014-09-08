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