## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

motorSCC <- SCC[grepl("motor", SCC$Short.Name, ignore.case = TRUE),]
motorSCC$SCC <- as.character(motorSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
motorNEI <- NEI[NEI$SCC %in% motorSCC$SCC,]

motor <- aggregate(Emissions ~ year, data=motorNEI[motorNEI$fips == 24510,], sum)

png("plot5.png", width = 480, height = 480, bg = "transparent")
barplot(motor$Emissions, motor$year, 
        names.arg = motor[,1], 
        main = expression("Total motor emissions in Baltimore in PM"["2.5"]))
dev.off()