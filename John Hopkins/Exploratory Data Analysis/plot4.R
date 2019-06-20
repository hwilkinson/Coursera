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


## Create a subsets of the source data for chart data, setup 2x2 format & clear source data
subData <- subset(sourceFile, Date == "1/2/2007" | Date == "2/2/2007")
par(mfrow=c(2,2))
rm(sourceFile)


## Create Plot 1
plot(subData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt = "n", xaxp= c(0,2800,2))
axis(side = 1, at = c("0","1400","2800"),labels = c("Thu","Fri","Sat"))


## Create Plot 2
plot(subData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt = "n", xaxp= c(0,2800,2))
axis(side = 1, at = c("0","1400","2800"),labels = c("Thu","Fri","Sat"))


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
       cex=.6,
       pt.cex = 1.5,
       text.font = 2,
       bty = "n")


## Create Plot 4
plot(subData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", xaxt = "n", xaxp= c(0,2800,2))
axis(side = 1, at = c("0","1400","2800"),labels = c("Thu","Fri","Sat"))


## Save image & cleanup variables
dev.copy(png,'plot4.png')
dev.off()
rm(list = ls())