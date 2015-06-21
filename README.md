# getting-cleaning-data-project

## Intro

This is the final project of "Getting and Cleaning Data" hosted on Coursera by John Hopkins University. More info reg. the data can be found in the cookbook. The task:

> You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5 .From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How-to-manual

1. [Download]("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") the data.
2. IMPORTANT: Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```. The parent directory has to be your working directory (use  ```setwd()```).
3. Run ```source("run_analysis.R")```
