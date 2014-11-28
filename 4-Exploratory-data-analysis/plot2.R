## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimoreEmissions <- aggregate(Emissions ~ year, data=NEI[NEI$fips == 24510,], sum)

png("plot2.png", width = 480, height = 480, bg = "transparent")
barplot(baltimoreEmissions$Emissions, baltimoreEmissions$year, 
        names.arg = baltimoreEmissions[,1], 
        main = expression("Baltimore: Total emissions in PM"["2.5"]))
dev.off()