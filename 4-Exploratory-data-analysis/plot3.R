## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

library(ggplot2)

baltimore <- aggregate(Emissions ~ year + type, data=NEI[NEI$fips == 24510,], sum)

png("plot3.png", width = 480, height = 480, bg = "transparent")
qplot(year, Emissions, data = baltimore, group = type, color = type, 
      geom = c("point", "line"), ylab = expression("Total emissions in PM"["2.5"]), 
      xlab = "Year", main = "Baltimore: Total Emissions pollution type")
dev.off()