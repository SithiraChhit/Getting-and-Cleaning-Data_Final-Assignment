# Loading dplyr package
library(dplyr)

# Downloading data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment.zip", method = "curl")

# Assigning data parameters to data frame
features <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Loading Test Data
X_test <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Loading Training Data
X_train <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/train/y_train.txt", col.names = "code")

## Step 1: Merges the training and the test sets to create one data set
X <- rbind(X_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_test, subject_train)
Full_Data <- cbind(Subject, Y, X)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
TidyData <- Full_Data %>% select(subject, code, contains("mean"), contains("std"))

## Step 3: Uses descriptive activity names to name the activities in the data set
TidyData$code <- activities[TidyData$code, 2]

## Step 4: Appropriately labels the data set with descriptive variable names
names(TidyData)[1] <- "Subject"
names(TidyData)[2] <- "Activities"
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
FinalData <- TidyData %>% group_by(Subject, Activities) %>% summarise_all(list(mean))
write.table(FinalData, "C:/Users/fcsda/OneDrive/Documents/Getting and Cleaning Data/Dataset_Final_Assignment/UCI HAR Dataset/tidy.txt", row.names = FALSE)
str(FinalData)
