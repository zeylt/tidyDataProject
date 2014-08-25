# Codebook for course project

## Summary of Variables

The values included in this tidy dataset are the means of the of accelerometry and gyroscope data menas and standard deviations for each subject and each activity that was performed. The tidy data set appears in the 'wide' format where the specific measures appear along each column. The first two columns identify what subject and activity these measures correspond to.

## Variable Names

* Subject - Factor variable of participants 1-30
  
* Activity - A factor variable of the type of movement participant was performing, can take the following values
    * WALKING
    * WALKING_UPSTAIRS 
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
    
The remaining columns denote the average of the mean or standard deviation of accelerometry or gyroscope data for each participant and activity. The column names are composed as follows:

* \<domain\>\<reference\>\<signal\>-\<statistic\>-\<axis\>

Where

* \<domain\> can take on 
    * t - time domain signal
    * f - frequency domain signal
    
* \<reference\> can take on
    * Body - signals are measured with respect to body
    * Gravity - signals are measured with respect to Gravity
    
* \<signal\>
    * Acc - acceleration (m/s\^2)
    * AccJerk - jerk acceleration
    * AccJerkMag - Magnitude of jerk accleration
    * AccMag - Magnitutde of acceleration
    * Gyro - angular velocity (rad/s)
    * GyroJerk - jerk angular velocity
    * GyroJerkMag - Magnitude of jerk angular velocity
    * GyroMag - Magnitutde of angular velocity
    
* \<statistic\>
    * mean() - the mean value
    * std() - the standard deviation
    
* \<axis\>
    * X,Y, or Z to denote the direction
