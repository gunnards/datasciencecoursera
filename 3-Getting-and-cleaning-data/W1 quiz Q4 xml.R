if (!file.exists("data")) {
        dir.create("data")
}

# Question 4
install.packages("XML")
library(XML)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "./data/restaurant.xml", method = "curl")
restaurantData <- xmlTreeParse("./data/restaurant.xml", useInternal = TRUE)

rootNode <- xmlRoot(restaurantData)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]][[1]]

zipcodes <- xpathSApply(rootNode,"//zipcode", xmlValue)
length(zipcodes[zipcodes == "21231"])
