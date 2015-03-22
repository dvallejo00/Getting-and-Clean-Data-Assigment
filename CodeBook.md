#Introduction:
The script performs 5 activities and use a dataset that could be downloaded [here]

# Requirements for project
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- Creates the tidy data set with the average of each variable for each activity and each subject.

#Variables: 
- Training data tables: x_train,  y_train, subject_train
- Test data tables: x_test, y_test, subject_test
- Tables merged : data_merge(x), y_merge, subject_merge
- Correct names: features and Index helper verctor
- Clean Data Merged: information from: subject,activities and data is merged in clean_data_merge
- **tidy**: Is a table resulted of the averdage of each variable. 

#Description
- Please Unzip the data and set your working directory as: setwd("~/Documents/Coursera/UCI HAR Dataset")
- Reshape Libray will be used in the 5 step
- Read Train and Test Data and store in : x_train,  y_train, subject_train,x_test, y_test, subject_test
- Merge data of the same  type: data_merge for x, y_merge, subject_merge
- Extracts measurements on the mean and standard deviation for each measurement
- Read features.txt and use this info for asign the correct names
- Finally, we generate a new dataset with all the average measures for each Subject and Activities type 
- The output file is called tidyData.txt, and uploaded to this repository.

[here]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
