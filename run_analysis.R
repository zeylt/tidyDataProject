# This script merges the training and test data from the UCI HAR Dataset,
# and finds the average of accelerometer and gyroscope signal means and 
# standard deviations individually for each subject and movement activity
#
# This script assumes that the UCI HAR Dataset is in your working directory
# and containes subfolders test/ and train/
#
# Tim Zeyl, August 2014

# Get the descriptive activity names
act_names <- read.table(file="activity_labels.txt")

# Get the variable names
var_names <- read.table(file="features.txt") 
# find only features on the mean and std for each measurement
fIdx <- grep("mean[()]|std[()]",var_names$V2)

## ------- Training Data ---------------------
# Load the features from the training data
Tr_X <- read.table(file="train/X_train.txt")
Tr_y <- read.table(file = "train/y_train.txt")
Tr_subj <- read.table(file = "train/subject_train.txt")

# Apply names to training Data
names(Tr_X) <- var_names$V2

# Subset the training Data for mean and std features
Tr_X <- Tr_X[,fIdx]

# Include the output and subject id in training data
Tr_X$output <- Tr_y$V1
Tr_X$subject <- Tr_subj$V1

## ------ Testing Data --------------------
# Load the features from the testing data
Te_X <- read.table(file="test/X_test.txt")
Te_y <- read.table(file = "test/y_test.txt")
Te_subj <- read.table(file = "test/subject_test.txt")

# Apply names to the testing data
names(Te_X) <- var_names$V2
vnames <- var_names$V2[fIdx] 

# Subset the training Data for mean and std features
Te_X <- Te_X[,fIdx]

# Include the output and subject id in training data
Te_X$output <- Te_y$V1
Te_X$subject <- Te_subj$V1

## --- merge the training and testing data 
# (since there is no overlap, we can use rbind)
Data <- rbind(Tr_X,Te_X)

# Add factor names to output
Data$output<-factor(Data$output,labels=act_names$V2)
Data$subject<-factor(Data$subject)

## --- Data set of averages of each variable for each activity and each subject
tidyData <- aggregate(Data[,names(Data) %in% vnames], by = list(Data$subject,Data$output), FUN = "mean")
names(tidyData)[2] <- "Activity"
names(tidyData)[1] <- "Subject"

## --- Order the data based on Subject, then activity
library(plyr)
tidyData <- arrange(tidyData,Subject,Activity)

write.table(tidyData,file="tidyDataset.txt",row.names=FALSE)
