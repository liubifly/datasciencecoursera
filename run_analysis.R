library(dplyr)
library(stringr)
test <- read.table("test/X_test.txt")
train <- read.table("train/X_train.txt")
label_test <- read.table("test/y_test.txt")
label_train <- read.table("train/y_train.txt")
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

# Merges the training and the test sets to create one data set.
label_test <- rename(label_test, activityName = V1)
label_train <- rename(label_train, activityName = V1)
subject_test <- rename(subject_test, personID = V1)
subject_train <- rename(subject_train, personID = V1)
test <- cbind(subject_test, label_test, test)
train <- cbind(subject_train, label_train, train)
data <- merge(test, train, all = TRUE)

# Extracts only the measurements on the mean and standard deviation for each measurement.
mean <- lapply(data, mean)
std <- lapply(data, sd)

# Uses descriptive activity names to name the activities in the data set.
labels <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
data$activityName <- factor(data$activityName, labels = labels)

# Appropriately labels the data set with descriptive variable names.
feature <- read.table("features.txt")
names(data)[3:length(names(data))] <- make.unique(make.names(as.character(feature$V2)))

# From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
average <- summarise_all(group_by(data, personID, activityName), funs(mean))
write.table(average, "average.txt", row.name = FALSE)



