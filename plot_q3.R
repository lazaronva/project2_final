# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
## Load libraries required for plot
library(ggplot2)
library(grid)
# Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
head(NEI, 5)
head(SCC, 5)
unique(NEI$type)
## Calculate total PM2.5 emissions for each type by year in Baltimore
Baltimore <- NEI[NEI$fips == "24510", ]
head(Baltimore, 5)
emissions_type_Year_balt <- aggregate(Emissions ~ type * year, data = Baltimore, FUN = sum)
head(emissions_type_Year_balt, 5)
## Setup ggplot with data frame
q <- qplot(y = Emissions, x = year, data = emissions_type_Year_balt, color = type, facets = . ~ type)
png('plot3.png', 480, 480)
q + scale_x_continuous(breaks = seq(1999, 2008, 3)) + theme_bw() + geom_point(size = 3) + geom_line()
dev.off()
## Answer: Overall decrease in PM2.5 emissions, and 'POINT' type 
## has a much different trend compared to the other three sources