## Question: Across the United States, 
## how have emissions from coal combustion-related sources changed from 1999–2008?
# Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
png('plot4.png', 480, 480)
par(mfrow = c(3, 1))
## Combustion related sources from 'SCC' Comm/Institutional
unique(grep("Coal", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
Coal_Combustion_CI_Sources <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal",
]["SCC"]
## Subset emissions due to coal combustion sources from 'NEI'
emissionFromCoal_CI <- NEI[NEI$SCC %in% Coal_Combustion_CI_Sources$SCC, ]
## Calculate the emissions due to coal each year across United States
totalCoalEmissionsByYear_CI <- tapply(emissionFromCoal_CI$Emissions, emissionFromCoal_CI$year, 
sum)
head(totalCoalEmissionsByYear_CI, 4)
plot(totalCoalEmissionsByYear_CI, x = rownames(totalCoalEmissionsByYear_CI), type = "b", 
     axes = TRUE, ylab = expression("Coal PM[2.5] Emission (tons)"), 
     xlab = "Year", main = expression("Coal Emission US Comm/Institutional"))
##
## Combustion related sources from 'SCC' Eletric Generation
unique(grep("Coal", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
Coal_Combustion_EG_Sources <- SCC[SCC$EI.Sector == "Fuel Comb - Electric Generation - Coal",
]["SCC"]
## Subset emissions due to coal combustion sources from 'NEI'
emissionFromCoal_EG <- NEI[NEI$SCC %in% Coal_Combustion_EG_Sources$SCC, ]
## Calculate the emissions due to coal each year across United States
totalCoalEmissionsByYear_EG <- tapply(emissionFromCoal_EG$Emissions, emissionFromCoal_EG$year, 
sum)
head(totalCoalEmissionsByYear_EG, 4)
plot(totalCoalEmissionsByYear_EG, x = rownames(totalCoalEmissionsByYear_EG), type = "b", 
     axes = TRUE, ylab = expression("Coal PM[2.5] Emission (tons)"), 
     xlab = "Year", main = expression("Coal Emission US Electric Generation"))
##
## Combustion related sources from 'SCC' Industrial Boilers
unique(grep("Coal", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
Coal_Combustion_IB_Sources <- SCC[SCC$EI.Sector == "Fuel Comb - Industrial Boilers, ICEs - Coal",
]["SCC"]
head(Coal_Combustion_IB_Sources, 5)
## Subset emissions due to coal combustion sources from 'NEI'
emissionFromCoal_IB <- NEI[NEI$SCC %in% Coal_Combustion_IB_Sources$SCC, ]
## Calculate the emissions due to coal each year across United States
totalCoalEmissionsByYear_IB <- tapply(emissionFromCoal_IB$Emissions, emissionFromCoal_IB$year, 
sum)
head(totalCoalEmissionsByYear_IB, 4)
plot(totalCoalEmissionsByYear_IB, x = rownames(totalCoalEmissionsByYear_IB), type = "b", 
     axes = TRUE, ylab = expression("Coal PM[2.5] Emission (tons)"), 
     xlab = "Year", main = expression("Coal Emission US Industrial Boilers, ICEs"))
dev.off()
# Answer1: Comm/Institutional and Electrical Generation emissions has a increase from 2002 to 2005.
# Answer2: Industrial Boiler has a increase by emissions from 1999 to 2002 and a decrease from 2002 to 2008. 