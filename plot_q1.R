# Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
## Calculate total PM2.5 emissions by year
totalPM25_ano <- tapply(NEI$Emissions, NEI$year, sum)
head(totalPM25_ano, 5)
totalPM25_ano_media <- tapply(NEI$Emissions, NEI$year, mean)
head(totalPM25_ano_media, 5)
# Questions1 :total emissions from PM2.5 decreased in the United States?
# make a plot showing the total PM2.5 emission
png('plot1.png', 480, 480)
plot(totalPM25_ano, x = rownames(totalPM25_ano), type = "b", axes = TRUE, 
     ylab = expression("Total PM2.5 Emission (tons)"), xlab = "Year", 
     main = expression("Total PM2.5 Emission (1999 - 2008)"))
dev.off()
# Answer: Total PM2.5 emission decrease from 1999 to 2008.
