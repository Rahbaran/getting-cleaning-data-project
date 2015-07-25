# Step 0: Setup
library(plyr)
rm(list=ls())

# Step 1: create one data set orginally consisting of six separate txt-files and reading headers from two addiotional files

# Step 1.1: reading all files into R-variables

xTrain <- read.table("train/X_train.txt")
yTrain <- read.table("train/y_train.txt")
subjectTrain <- read.table("train/subject_train.txt")

xTest <- read.table("test/X_test.txt")
yTest <- read.table("test/y_test.txt")
subjectTest <- read.table("test/subject_test.txt")

featureNames <- read.table("features.txt")[, 2]
activityType = read.table("activity_labels.txt")

# Step 1.2: adding xTest to xTrain
xData <- rbind(xTrain, xTest)
names(xData) <- featureNames

# Step 1.3: adding yTest to yTrain 
yData <- rbind(yTrain, yTest)

# Step 1.4: adding subjectTest to subjectTrain
subjectData <- rbind(subjectTrain, subjectTest)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std_features <- grep("-(mean|std)\\(\\)", featureNames)
xData <- xData[, mean_std_features]

# Step 3: Using descriptive activity names to name the activities in the data set
names(yData) <- "activityType" 

# Step 4: Appropriately labelling the data set with descriptive variable names
names(subjectData) <- "subject"
finalData <- cbind(xData, yData, subjectData)

# Step 5: Creating a second, independent tidy data set with the average of each variable for each activity and each subject

# Note: The avg. of col 67 + 68 (activityType + subject) is not computed
avgData <- ddply(finalData, .(subject, activityType), function(x) colMeans(x[, 1:66]))

write.table(avgData, "avgData.txt", row.name=FALSE)