
#######################################################################################################
#### Project for the Getting and Cleaning Data Coursera Course - Nov-Dec 2016####
#Anne Pauline
#The purpose of this project is to demonstrate  ability to collect, work with, and clean a data set.
#### The data are from an experiment called: Human Activity Recognition Using Smartphones Data Set ####
#### A full description of the experiment is available at :####
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Data are downloaded from: ####
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#######################################################################################################

####Preparation steps - Working directory and data directory (data are in sub folders of the working directory)####
#Working directory
getwd()

#data directory 
pathData <- "./DataForFinalPorject/"

#### Preparation step1 - used libraries ####
#no special libraries are used here

####Preparation step2 - Download the data and unzip the data####
ProjURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
ProjFile <- "AcceleroData.zip"

download.file(ProjURL, destfile = paste0(pathData,ProjFile),mode="wb") 
unzip(paste0(pathData,ProjFile),exdir= paste0(pathData,"DataExtract"))

####Preparation step3 - update data directories as other folders have been created####
pathData <- paste0(pathData,"DataExtract/UCI HAR Dataset/")
PathTestDat <- paste0(pathData,"test/")
PathTrainDat <- paste0(pathData,"train/")

####Preparation step4 - Import the useful data####
# read the first files "activity_labels.txt" "features.txt"  
Acti_Label <- read.table(paste0(pathData,"activity_labels.txt"),header=FALSE) 
#Acti-Label is the class labels with their activity name.
Features <- read.table(paste0(pathData,"features.txt"),header=FALSE) 
#Features are signals  used to estimate variables of each pattern: 
#3-axial signals in the X, Y and Z directions.
#t for time
#f for Fast Fourier Transform (FFT) frequency

#lets see what is in the folders test and train
dir(PathTestDat)
#"Inertial Signals" "subject_test.txt" "X_test.txt"       "y_test.txt" 
dir(PathTrainDat)
# "Inertial Signals"  "subject_train.txt" "X_train.txt"       "y_train.txt" 

#In each folder train and test, read the data from the files subject, X and y
subjTest <- read.table(paste0(PathTestDat,"subject_test.txt"),header=FALSE)
X_test <- read.table(paste0(PathTestDat,"X_test.txt"),header=FALSE)
Y_test <- read.table(paste0(PathTestDat,"y_test.txt"),header=FALSE)

subjTrain <- read.table(paste0(PathTrainDat,"subject_train.txt"),header=FALSE) 
X_train <- read.table(paste0(PathTrainDat,"X_train.txt"),header=FALSE)
Y_train <- read.table(paste0(PathTrainDat,"y_train.txt"),header=FALSE)

####1.Merges the training and the test sets to create one data set.####
#put the labels on the columns

names(X_train) <- Features[,2]
names(X_test) <- Features[,2]
names(subjTrain)<-"subject"
names(subjTest)<- "subject"
names(Y_train)<- "activity"
names(Y_test)<- "activity"

#bind each set of data
Train <- cbind(subjTrain,Y_train,X_train)
Test <- cbind(subjTest,Y_test,X_test)

#As requested Merge all data in 1 dataset
TestTrainData <- rbind(Test,Train)



####2.Extracts only the measurements on the mean and standard deviation for each measurement. ####

#take only the columns of interest (Subject, activity,mean, std)
TestTrainData <- TestTrainData[grepl(".*mean.*|.*std.*|subject|activity", names(TestTrainData))]


####3.Uses descriptive activity names to name the activities in the data set####
TestTrainData$activity <-Acti_Label[,2][match(TestTrainData$activity,Acti_Label[,1])]


####4.Appropriately labels the data set with descriptive variable names. ####

ColNewName <- colnames(TestTrainData)


for (i in 1:length(ColNewName))  
{ 
  ColNewName[i] = gsub("\\()","",ColNewName[i]) 
  ColNewName[i] = gsub("-std","-StdDev",ColNewName[i]) 
  ColNewName[i] = gsub("-mean","-Mean",ColNewName[i]) 
  ColNewName[i] = gsub("^(t)","Time-",ColNewName[i]) 
  ColNewName[i] = gsub("^(f)","Freq-",ColNewName[i]) 
  ColNewName[i] = gsub("Acc","-Accelerometer",ColNewName[i]) 
  ColNewName[i] = gsub("([Gg]ravity)","-Gravity",ColNewName[i]) 
  ColNewName[i] = gsub("[Gg]yro","-Gyroscope",ColNewName[i]) 
  ColNewName[i] = gsub("Mag","-Magnitude",ColNewName[i]) 
  ColNewName[i] = gsub("([Bb]ody)","-Body",ColNewName[i]) 
  ColNewName[i] = gsub("Jerk","-JerkSignal-",ColNewName[i])
  ColNewName[i] = gsub("--","-",ColNewName[i])
} 

colnames(TestTrainData)<- ColNewName 


####5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.####
#to avoid the creation of two new columns group1 and 2, I have taken only from col 3 to 81
#to avoid the rename of the firs two columns in group1 and 2, I have inserted the column name subject and activity for the output

ItsTidy <- aggregate(TestTrainData[, 3:81], list(subject=TestTrainData$subject,activity=TestTrainData$activity), mean,na.rm=TRUE)

write.table(ItsTidy, "tidy.txt", row.names = FALSE, quote = FALSE)

