

# This Script use a data set from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Please UnZip the data and set your working directory as: setwd("~/Documents/Coursera/UCI HAR Dataset")
# Reshape Libray will be used in the 5 step

library(reshape2)

# STEP 1: Merges the training and the test sets to create one data set.

# train data
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")
subject_train<-read.table("train/subject_train.txt")

# test data
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")

# Merge test & train data, as a result
x_merge<-rbind(x_train,x_test)
y_merge<-rbind(y_train,y_test)
subject_merge<-rbind(subject_train,subject_test)

# STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features<-read.table("features.txt")
Index<-grep("mean\\(\\)|std\\(\\)",features[,2])
data_merge<-x_merge[,Index]


#STEP 3 Uses descriptive activity names to name the activities in the data set

# Asign the name from features and delete ()
names(data_merge)<-gsub("\\(\\)", "",features[Index,2])
activities <- read.table("activity_labels.txt")
y_merge[, 1] <- activities[y_merge[, 1], 2]
names(y_merge)<-"Activities"

#STEP 4 Appropriately labels the data set with descriptive variable names
names(subject_merge)<-"Subject"

clean_merge<-cbind(subject_merge,y_merge,data_merge)

#STEP 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melted <- melt(clean_merge, id=c("Subject","Activities"))
tidy <- dcast(melted, Subject+Activities ~ variable, mean)

# write the tidy data set to a file
write.table(tidy, './tidyData.txt',row.names=FALSE,sep='\t');