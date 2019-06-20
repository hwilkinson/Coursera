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


## Create Plot 3
plot(subData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", xaxt = "n", xaxp= c(0,2800,2))
lines(subData$Sub_metering_2, col="red", lwd=1)
lines(subData$Sub_metering_3, col="blue", lwd=1)
axis(side = 1, at = c("0","1400","2800"),labels = c("Thu","Fri","Sat"))
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(1,1,1),
       col=c("black", "red", "blue"),
       cex=.65,
       text.font = 3)


## Save image & cleanup variables
dev.copy(png,'plot3.png')
dev.off()
rm(list = ls())
