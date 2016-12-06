

Codebook for the project Getting And Cleaning Data Coursera
Course Nov-Dec 2016
##The data are from an experiment called: Human Activity Recognition Using Smartphones Data Set 

##A full description of the experiment is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Description résumé: Data have been collected from the embedded
accelerometer and gyroscope in a smart phone carried by 30 volunteers while
performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,
SITTING, STANDING, LAYING) captured 3-axial linear acceleration and 3-axial
angular velocity at a constant rate of 50Hz. The obtained dataset has been
randomly partitioned into two sets, where 70% of the volunteers was selected
for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and
50% overlap (128 readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a Butterworth
low-pass filter into body acceleration and gravity. The gravitational force is
assumed to have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was obtained
by calculating variables from the time and frequency domain.



##Data are downloaded from: 

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##Preparation step0 - Working directory and data directory (data are in sub folders inside the working area)

pathData  is the directory with the zip folder

##Preparation step1 – Download libraries
no special libraries are used for this script to run

##Preparation step2 - Download the data (calling it AcceleroData.zip) and unzip the data in a new folder called DataExtract

The extraction has produced:
1 folder (UCI HAR Dataset) containing all data: 
With #4 files and 2 folders
2 files are descriptive information for further details about the datasets: features_info.txt and README.txt 

##Preparation step3 - update data directories as other folders have been created inside
Updated pathData  
test data are in PathTestDat  (a sub folder to pathData)
train data are in PathTrainDat (a sub folder to pathData)

##Preparation step4 - Import the useful data 
“activity_labels.txt”  -> Acti_Label (is the class labels with the activities name and code.)

"features.txt" -> Features (variable coming from the signals used to estimate
variables of each pattern: and are the name of the columns of the experiment’s
data) as: 3-axial signals in the X, Y and Z directions; t for time;f for Fast
Fourier Transform (FFT) frequency; Etc.…

**********
variables detailed info: 

###Feature Selection 
The features selected for this database come from the
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These
time domain signals (prefix 't' to denote time) were captured at a constant
rate of 50 Hz. Then they were filtered using a median filter and a 3rd order
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular
velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were
calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag,
tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some
of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ,
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate
frequency domain signals). 

These signals were used to estimate variables of the feature
vector for each pattern:  

'-XYZ' is used to denote 3-axial signals in the X, Y and Z
directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Activity_Labels variables
1 to 6: 
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING




**********
##Naming of the datasets from raw data to R data
"subject_test.txt" -> subjTest

"X_test.txt" -> X_test

"y_test.txt" -> Y_test

"subject_train.txt" -> subjTrain

"X_train.txt" -> X_train

"y_train.txt" -> Y_train

“activity_labels.txt”  -> Acti_Label 

"features.txt"  -> Features 


##Step by Steps Work out
I have put the names on the columns, X_train and X_test with the data of the dataset Features;
subjTrain and subjTest with the string “subject”
and the two others Y_test and Y_train with the sting “activity”

##Request1. Merges the training and the test sets to create one data set.

The dataset has been called TestTrainData and is combination of cbind and rbind of the above datasets

##Request2. Extracts only the measurements on the mean and standard deviation for each measurement. 

with grepl I have taken only the columns of interest (Subject, activity, and the ones containing mean, std)

##Request3. Uses descriptive activity names to name the activities in the data set

With the use of match I have transformed the activity column data from codes in the co-respective activity name taken in-Acti_Label

##Request4. Appropriately labels the data set with descriptive variable names. 

I have given a descriptive variable to the column names of the data with the help of “for (i in 1:length(ColNewName))” changing the abbreviations in full names

##Request5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity
and each subject.

Created tidy data called ItsTidy with the aggregate function
and wrote it in an independent txt file called tidy.txt.

 

