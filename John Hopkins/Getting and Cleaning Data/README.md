# Getting_and_Cleaning_Data_Course_Project

Instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
Review criteria: 
<ol>
  <li>  The submitted data set is tidy.
  <li>  The Github repo contains the required scripts.</li>
  <li>  GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.</li>
  <li>  The README that explains the analysis files is clear and understandable.</li>
  <li>  The work submitted for this project is the work of the student who submitted it.</li>
</ol>

The script used to create the datasets, run_analysis.R, does the following:
<ol>
<li>Clears data from memory.</li>
<li>Collects all source data.</li>
<li>Joins all source data to create one master dataset.</li>
<li>Adds descriptive names to the joined fields.</li>
<li>Extracts the Mean and Standard Deviation fields from the master dataset.</li>
<li>Uses extracted data to create summary file with fields averaged and summarized by Subject ID and Activity.</li>
</ol>


The analysis files included in this repository include:
<ul>
<li>All Joined Data.zip - this file contains all source data joined into one large dataset</li>
<li>Extracted Means and StDev.txt - this table is an extraction of the Mean and St Dev fields of the All Joined Data file.</li>
<li>Summary Table.txt - this table is a summary by Subject ID and Activity Type of the Extracted Mean and St Dev dataset.</li>
</ul>

<hr width="50%" size="2">

Getting and Cleaning Data Course Project 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
<ol>
    <li>Merges the training and the test sets to create one data set.</li>
    <li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
    <li>Uses descriptive activity names to name the activities in the data set</li>
    <li>Appropriately labels the data set with descriptive variable names.</li>
    <li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
Good luck!
