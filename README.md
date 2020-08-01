# Getting And Cleaning Data

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was obtained.
<br><br>

The R script called run_analysis.R does the following:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

<br><br>

This repository contains these files:

1. run_analysis.R, the r script used to import and clean the raw data, and output our results
2. data_summary.txt, the output file from this project
3. README.txt, from the scientific experiment
4. data, a folder including all of the raw data from the experiment

<br><br><br>

# Variables

This data comes from the UCI Machine Learning Human Activity Recognition Using Smartphones Dataset<br>
** Only the columns from our final output table will be explained here **
<br><br>

activity

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

<br>
        
subjectID
    
* Unique ID of each subject
    * Ranges from 1 to 30
    
<br>

Mean and standard deviation for the following features        

* timeBodyAcc-XYZ
* timeGravityAcc-XYZ
* timeBodyAccJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyGyroJerk-XYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* freqBodyAcc-XYZ
* freqBodyAccJerk-XYZ
* freqBodyGyro-XYZ
* freqBodyAccMag
* freqBodyBodyAccJerkMag
* freqBodyBodyGyroMag
* freqBodyBodyGyroJerkMag

**Special notes and further explanation**

* The variables have been normalized and bounded within [-1, 1]
* XYZ - measures the X, Y, and Z directions (separate columns)
* Acc - Data collected from phone's accelerometer
* Gyro - Data collected from phone's gyroscope
        
