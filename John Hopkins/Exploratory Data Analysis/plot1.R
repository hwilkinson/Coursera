## ----------------------------------------------------------------------
## Purpose: This program will retrieve required electrical power data and
##              create requested charts.
## Created: 03/11/2016  Heath Wilkinson for Exploratory Data Analysis
## Modifications:
##
## ----------------------------------------------------------------------


## Cleanup variables & retrieve the data source
rm(list = ls())
sourceFile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = c("factor","factor", rep("numeric", 7)), na.strings = "?")


## Create a subsets for chart source data
subData <- subset(sourceFile, Date == "1/2/2007" | Date == "2/2/2007")
rm(sourceFile)
par(mfrow = c(1, 1))

## Create plot 1
hist(subData$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


## Save image & cleanup variables
dev.copy(png,'plot1.png')
dev.off()
rm(list = ls())
