#Script for coursera Getting and Cleaning Data project submission
#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_Analysis <- function()
#For running the function you will need to install the dplyr package.
library(dplyr)

#For part 1
#First step: Read all the data set and put it dataframes

#Just to clear the code I create a variable with the location of the files, please consider this location of the files
#when running the function.

local_test <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//test//X_test.txt"
local_ytest <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//test//y_test.txt"
local_train <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//train//X_train.txt"
local_ytrain <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//train//y_train.txt"
local_feat <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//features.txt"
local_activity <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//activity_labels.txt"
local_subtest <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//test//subject_test.txt"
local_subtrain <- "D://Mis Documentos//getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset//train//subject_train.txt"


#Then put all the data set in dataframes

data_test <- read.table(local_test, header = FALSE, sep = "")
data_train <- read.table(local_train, header = FALSE, sep = "")
data_ytest <- read.table(local_ytest, header = FALSE, sep = "")
data_ytrain <- read.table(local_ytrain, header = FALSE, sep = "")
data_feat <- read.table(local_feat, header = FALSE, sep = "")
data_activity <- read.table(local_activity, header = FALSE, sep = "")
data_subtest <- read.table(local_subtest, header = FALSE, sep = "")
data_subtrain <- read.table(local_subtrain, header = FALSE, sep = "")

#Second step: Merge all data in one data set

#By parts this lines put together subject data and data values
data_test$subject = data_subtest
data_train$subject = data_subtrain
data_test$activity = data_ytest
data_train$activity = data_ytrain

#Put the same names to the columns so you can rbind them.
colnames(data_test) <- c(as.character(data_feat$V2),"subject","activity")
colnames(data_train) <- c(as.character(data_feat$V2),"subject","activity")

data_tog <- rbind(data_test, data_train)

#Third step extract mean and standard deviation for each columns or measurement
extract_data <- data_tog[data_tog %in% c("mean","std")]

#Fourth step: Add labels to the measurmentes created in step three, using the

#descriptive labels text file and save it on another data frame.

#Fifth step create a txt file from it.
