# total emissions of PM2.5 in Baltimore
# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City?
# Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
# Calculate total PM2.5 emissions by year in Baltimore
Baltimore <- NEI[NEI$fips == "24510", ]
head(Baltimore, 5)
totalPM25_ano_balt <- tapply(Baltimore$Emissions, Baltimore$year, sum)
head(totalPM25_ano_balt, 5)
totalPM25_ano_balt_media <- tapply(Baltimore$Emissions, Baltimore$year, mean)
head(totalPM25_ano_balt_media, 5)
# Create plot
png('plot2.png', 480, 480)
plot(totalPM25_ano_balt, x = rownames(totalPM25_ano_balt), type = "b", axes = TRUE, 
     ylab = expression("Total PM2.5 Emission (tons)"), xlab = "Year", 
     main = expression("Total PM2.5 Emission Baltimore (1999 - 2008)"))
dev.off()
# Answer: Total PM2.5 emission decrease from 1999 to 2008 in Baltmore.
# An increase is showed during the period from 2000 to 2005.