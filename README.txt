# Summary

This folder contains an R script "run_analysis.R" that merges the training 
and test data from the UCI HAR Dataset, and performs summary statistics
for several signals measured from each participant. The dataset consists
of signals measured from accelerometers and gyroscopes while 30 subjects
performed different movement tasks like walking and sitting. The script 
finds the average of mean and standard deviation features from this 
dataset for each subject and each movement task.

This script assumes that the UCI HAR Dataset is in your working directory
and contains subfolders test/ and train/

## run_analysis.R

First, the activity labels are extracted and the features that relate to
the mean and standard devation are found among all features. Only features
that contained 'mean()' or 'std()' within their label were used, because
it was clear that in these cases the mean or standard devation operation
was applied to the signal.

Data from the train and test sets were loaded independently and the 
appropriate feature subset was extracted. Then the subject id and activity
label were added to these data frames as factor variables. The train
and test data frames were combined with rbind() because there was no
overlap between the two data frames.

A split-apply-combine process was performed using the aggregate() function
to find the means of each subject and activity independently. This resulted
in a 'wide' format tidy data frame with one variable per column. The set
was re-ordered based on subject and activity for readability