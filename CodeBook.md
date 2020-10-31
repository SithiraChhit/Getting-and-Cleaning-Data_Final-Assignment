The run_analysis.R script performs the data prepartion following the 5 steps as mentioned in the Getting and Cleaning Data's assignment.
1. Downloading data
The data collected from the accelerometers from the Samsung Galaxy S smartphone to track human activities like walking, sitting from 30 volunteer subjects.
The data can be downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Loading the data to R and assigning the data to varibales
FEATURES - Accelerometer and Gyroscope measurements that recoded in the database [contain 561 observations]
ACTIVITIES - 6 observation with 2 variables, code and activity. The codes with their corresponding activities include 'walking', 'walking upstairs', 'walking downsairs', 'sitting', 'standing', and 'laying'
subject_test - contain subject ID with 9 volunteers out of the 30 volunteers. [2947 observation, 1 variable subject (ID)]
subject_train - contain subject ID with 21 volunteers out of the 30 volunteer. [7352 observation, 1 variable subject (ID)]
x_test - database contain measurement records of Accelerometer and Gyroscope from the 9 volunteers [2947 observtions, 561 variables]
y_test - a table contain tracking activiy's code [2947 observation, 1 variable of activity's code]
x_train - database contain measurement records of Accelerometer and Gyroscope from the 21 volunteers [7352 observtions, 561 variables]
y_test - a table contain tracking activiy's code [7352 observation, 1 variable of activity's code]

3. Merge the training and test datasets to create one dataset
X - use rbind to merge X_test adn X_train [10299 observations, 561 variables]
Y - use rbind to merge y_test and y_train [10299 observations, 1 variable (activity ID)]
Subject - use rbind to merge subject_train and subject_test [10299 observations, 1 variable (subject ID)]
Full_Data - use cbind to merge Subject, Y, X [10299 observations, 561 variables]

4. Extract only wanted varibles
TidyData - Select only wanted variables that contain Mean and STD [10299 observation, 88 variables] and change the column code name to Activities name. Then change the Activities code to a descriptive activity names.

5. Lable TidyData to have a decriptive variable names
- Variable name start with 't' change to 'Time'
- Variabel name start with 'f' change to 'Frequency'
- Variabel name contain 'Acc' change to "Accelerometer'
- Variable name contain "Gyro' change to "Gyroscope'
- Variable name contain 'Mag' chagne to "Magnitude"
- Variable name contain "BodyBody" change to "Body"

6. Create tidy.txt to summary the average of the measurement for each activity and each subject.
