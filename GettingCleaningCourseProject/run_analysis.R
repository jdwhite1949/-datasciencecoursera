# The purpose of this script is to do the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for 
#       each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#       with the average of each variable for each activity and each subject.

# Setting up data files location:
# place zipped file "getdata-projectfiles-UCI HAR Dataset.zip" into working directory
# Unzip file "getdata-projectfiles-UCI HAR Dataset.zip" 
# change working directory to "UCI HAR Dataset"

# load main datasets files and assign to variables xTrain and xTest
xTrain <- read.table("./train/X_train.txt")
xTest <- read.table("./test/X_test.txt")

# read in 561 variable names from features.txt file
var_names <- read.table("features.txt")

# create list of variable names (from var_names) to use in test and train tables
list_var_names <- as.character(var_names$V2)

# read activities into variables yTest and yTrain
yTest <- read.table("./test/y_test.txt")
yTrain <- read.table("./train/y_train.txt")

# read activity labels into variable act_labels
act_labels <- read.table("activity_labels.txt")

# read into variables the corresponding subject files
sub_test <- read.table("./test/subject_test.txt")
sub_train <- read.table("./train/subject_train.txt")

# rename columns in xTest and xTrain using list of names
for (i in 1:length(list_var_names)){
  colnames(xTest)[i] <- list_var_names[i]
}
for (i in 1:length(list_var_names)){
  colnames(xTrain)[i] <- list_var_names[i]
}

# load necessary libraries
library(dplyr)

# update yTest & yTrain tables to names of activities (instead of numbers) 
# from act_labels 
yTest2 <- inner_join(yTest, act_labels, by = "V1")
yTrain2 <- inner_join(yTrain, act_labels, by = "V1")

# rename column V2 in yTest2 & yTrain2 to "activity"
colnames(yTest2)[2] <- "activity"
colnames(yTrain2)[2] <- "activity"

# rename column V1 in sub_test & sub_train datasets
colnames(sub_test) <- "subject"
colnames(sub_train) <- "subject"

# add subject and activity data (columns) to xTest and xTrain datasets
all_xTrain <- cbind(sub_train, yTrain2[2], xTrain)
all_xTest <- cbind(sub_test, yTest2[2], xTest)

# combine datasets xTest and xTrain 
complete_data_set <- rbind(all_xTrain, all_xTest)

# select only those columns related to subject, activity, mean, and std
sub_data_set <- complete_data_set[,grep("subject|activity|mean|std", 
                                        colnames(complete_data_set))]

# clean up - remove all objects/vars except working data set from memory
rm(list = setdiff(ls(), "sub_data_set"))

# create tidy data set with the average of each variable for each activity 
# and each subject (exclude missing data)
tidy_data_set <- sub_data_set%>%group_by(subject, activity)%>%
  summarise_each(funs(mean(., na.rm=TRUE)))


# write tidy_data_set to file
write.table(tidy_data_set, file = "tidy_data_set.txt", row.names = FALSE, col.names = TRUE)

# clean up - remove all objects/vars from environment
rm(list = ls())

