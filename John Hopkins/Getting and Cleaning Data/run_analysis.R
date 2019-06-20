## ----------------------------------------------------------------------
## Purpose: This program will retrieve source files associated with subjects'
##              exercise habits, combine all data then parse out and summarize
##              it into a report of Mean and St Dev by subject number and 
##              activity type.
## Created: 04/21/2016  Heath Wilkinson for Getting & Cleaning Data
## Modifications:
##
## ----------------------------------------------------------------------


## Clean memory then install/load plyr & reshape libraries if required
rm(list = ls())
if("plyr" %in% rownames(installed.packages()) == FALSE) {install.packages("plyr")}
if("reshape" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape")}
library(plyr)
library(reshape)


## LOad up the required source data into individual tables
sourceFile1 <- read.table("UCI HAR Dataset/train/subject_train.txt")
sourceFile2 <- read.table("UCI HAR Dataset/train/X_train.txt")
sourceFile3 <- read.table("UCI HAR Dataset/features.txt")
sourceFile4 <- read.table("UCI HAR Dataset/train/y_train.txt")
sourceFile5 <- read.table("UCI HAR Dataset/activity_labels.txt")
sourceFile6 <- read.table("UCI HAR Dataset/test/subject_test.txt")
sourceFile7 <- read.table("UCI HAR Dataset/test/X_test.txt")
sourceFile8 <- read.table("UCI HAR Dataset/test/y_test.txt")


## Joining source data into one table & adding description field names
names(sourceFile2) <- sourceFile3$V2
sourceFile2 <- cbind(sourceFile4, sourceFile2)
sourceFile2 <- cbind(sourceFile1, sourceFile2)

## Add descriptive variable names to Subject ID and Activity fields
names(sourceFile2)[1] <- "subjectID"
names(sourceFile2)[2] <- "activity"
names(sourceFile5) <- c("activity","activityDescription")
tblFullData <- join(sourceFile2, sourceFile5, by = "activity")


## Tidy our working table to just Means & St Deviation columns and get rid of any NA observations
tblMeansStDev <- subset(tblFullData, select=c(1, 2, ncol(tblFullData), grep("mean", names(tblFullData)), grep("std", names(tblFullData))))
tblSummaryData <- na.omit(tblMeansStDev)


## Summarize the data by Subject ID and Activity Description
tblSummaryData.m <- melt(tblSummaryData, id=c(1:3), measure=c(4:ncol(tblSummaryData)))
tblSummaryData.c <- cast(tblSummaryData.m, subjectID + activityDescription ~ variable, mean)
fullSummary <- tblSummaryData.c


## Would normally use the command below to free memory and only keep the table/data
## I want but for the rules of this assignment, I will comment it out so that all
## data remains for review.
##rm(list=setdiff(ls(), "tblSummaryData.c"))
