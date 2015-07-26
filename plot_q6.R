# motor vehicle emission trends for Baltimore and Los Angeles
# Question: Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
library(grid)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
emission_Baltimore <- NEI[NEI$SCC %in% motorVehicleSourceCodes$SCC & 
NEI$fips == "24510", ]
emission_LosAngeles <- NEI[NEI$SCC %in% motorVehicleSourceCodes$SCC & 
NEI$fips == "06037", ]
emission_Vehicles <- rbind(emission_Baltimore, emission_LosAngeles)
## Calculate the emissions 
total_Emissions_County <- aggregate(Emissions ~ fips * year, data = emission_Vehicles, FUN = sum)
total_Emissions_County$county <- ifelse(total_Emissions_County$fips == "06037", "Los Angeles", "Baltimore")
## Setup ggplot with data frame
q <- qplot(y = Emissions, x = year, data = total_Emissions_County, 
color = county)
png('plot6.png', 480, 480)
q + scale_x_continuous(breaks = seq(1999, 2008, 3)) + theme_bw() + geom_point(size = 3) + geom_line()
dev.off()
# Answer: Vehicle emission are more critical in Los Angeles than in Baltimore.