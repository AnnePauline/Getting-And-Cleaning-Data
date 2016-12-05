

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

"subject_test.txt" -> subjTest
"X_test.txt" -> X_test
"y_test.txt" -> Y_test
"subject_train.txt" -> subjTrain
"X_train.txt" -> X_train
"y_train.txt" -> Y_train
 

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

 

