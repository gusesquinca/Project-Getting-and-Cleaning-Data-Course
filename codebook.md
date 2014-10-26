##Code Book for Course Project
#_____________________________

The course Project submitted is not finished, I just was able to finish the steps 1, 3 and 4.
Remember to unzip the files in the right location:
D:\Mis Documentos\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset

First step: Read all the data set and put it in dataframes
Just to clear the code I create a variable with the location of the files, please consider this location 
of the files when running the function.
Put all the data set in dataframes with read.csv function.
X_test.txt,
y_test.txt
X_train.txt
y_train.txt
features.txt
activity_labels.txt
subject_test.txt
subject_train.txt

For Step 3: Merge all data in one data set
Put together subject data , activity data and data values for test and train indpendently
Then put the correct column names with the features file.
And then using the r bind function put all the data together.

This is all I could do, for this course. I got the time over me. Next time I will finished, I know I 
could use the dplyr library for extracting the mean and std variables.
