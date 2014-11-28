## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

totalEmissions <- aggregate(Emissions ~ year, data=NEI, sum)

png("plot1.png", width = 480, height = 480, bg = "transparent")
barplot(totalEmissions$Emissions, totalEmissions$year, 
        names.arg = totalEmissions[,1], 
        main = expression("Total emissions from PM"["2.5"]))
dev.off()