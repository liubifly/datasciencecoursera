# datasciencecoursera

## Introduction   
 This is for my assignment in coursera of getting and cleaning data course, and the data set I am using is from Human Activity Recognition Using Smartphones Data Set in UCI Machine Learning repository. And the project requirement is as follows for the R script called run_analysis.R,   
 1. Merges the training and the test sets to create one data set.
 1. Extracts only the measurements on the mean and standard deviation for each measurement.
 1. Uses descriptive activity names to name the activities in the data set.
 1. Appropriately labels the data set with descriptive variable names.
 1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Explanation for the R script file
* The R script file first read the test and train set into the variables, also with the labels and subjects.
* After merging the test subjects and labels with the test data set, also the train subjects and labels with the train data set, the column names of labels and subjects are renamed into personID and activityName. Then these two data sets are merged based on the intersection of column names, which in this case are personID and activityName.
* Mean and standard deviation for each measurement are extracted.
* The activities in the data set are represented in numbers which are not intuitive, thus they are then modified into descriptive names including "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
* The names of features now are V1, V2, ..., which are not understandable enough, thus the column names are changed into clearer names based on the feature text file given by the original data set. And the function make.unique() and make.names() are used to generate names because the names read from the text file don't strictly satisfy the name requirement in R.
* Another tidy data set is generated with the average of each variable for each activity and each subject. The data set is firstly grouped by the subject and activity and then summarized. The output text file is named average.txt. Also, there is a file named cookbook which illustrates the column names of the output data set.



Enjoy!!
