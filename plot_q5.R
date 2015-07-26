# motor vehicle sources in Baltimore, Maryland between 1999 - 2008
# Question: How have emissions from motor vehicle sources changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
motorVehicleSourceDesc <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, 
value = TRUE))
head(motorVehicleSourceDesc)
motorVehicleSourceCodes <- SCC[SCC$EI.Sector %in% motorVehicleSourceDesc, ]["SCC"]
## Subset emissions due to motor vehicle sources
emissionFromMotorVehiclesInBaltimore <- NEI[NEI$SCC %in% motorVehicleSourceCodes$SCC & 
NEI$fips == "24510", ]
## Calculate the emissions
totalMotorVehicleEmissionsByYear <- tapply(emissionFromMotorVehiclesInBaltimore$Emissions, 
emissionFromMotorVehiclesInBaltimore$year, sum)
head(totalMotorVehicleEmissionsByYear, 4)
png('plot5.png', 480, 480)
plot(totalMotorVehicleEmissionsByYear, x = rownames(totalMotorVehicleEmissionsByYear), 
type = "b", axes = TRUE, ylab = expression("Motor Vehicle PM[2.5] Emission (tons)"), xlab = "Year", main = expression("Motor Vehicle Related PM"[2.5] * 
"Baltimore (1999 - 2008)"))
dev.off()
# Answer: Vehicle emission decrease in Baltimore during all range from 1999 to 2008.
