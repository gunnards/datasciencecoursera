## Read data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

coalSCC <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE),]
coalSCC$SCC <- as.character(coalSCC$SCC)

NEI$SCC <- as.character(NEI$SCC)
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC,]

coal <- aggregate(Emissions ~ year, data=coalNEI, sum)

png("plot4.png", width = 480, height = 480, bg = "transparent")
barplot(coal$Emissions, coal$year, 
        names.arg = coal[,1], 
        main = expression("Total coal emissions in PM"["2.5"]))
dev.off()