## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

motorSCC <- SCC[grepl("motor", SCC$Short.Name, ignore.case = TRUE),]
motorSCC$SCC <- as.character(motorSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
motorNEI <- NEI[NEI$SCC %in% motorSCC$SCC,]

motorBaltLA <- aggregate(Emissions ~ year + fips, 
                         data = motorNEI[motorNEI$fips %in% c("24510","06037"),], sum)

# Rename fips to county name
motorBaltLA$fips[motorBaltLA$fips == "06037"] <- "Los Angeles County"
motorBaltLA$fips[motorBaltLA$fips == "24510"] <- "Baltimore County"
names(motorBaltLA)[2] <- "county"


png("plot6.png", width = 480, height = 480, bg = "transparent")
qplot(year, Emissions, data = motorBaltLA, group = county, color = county, 
      geom = c("point", "line"), ylab = expression("Total emissions in PM"["2.5"]), 
      xlab = "Year", main = "Total motor emissions ")
dev.off()