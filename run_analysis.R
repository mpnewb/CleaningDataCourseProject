## Step 1. Merges the training and the test sets to create one data set.

## Useful(relevant) data files are: test/X_test.txt, test/y_test.txt, test/subject_test.txt, 
## train/X_test.txt,train/y_train.txt, train/subject_train.txt,
## activity_labels.txt, features.txt

## reading the files
setwd("dataset/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subj_test <- read.table("subject_test.txt")

setwd("dataset/train")
x_train <- read.table( "X_train.txt" )
y_train <- read.table("y_train.txt" )
subj_train <- read.table("subject_train.txt")

features <- read.table("features.txt" ) ## read from "features.txt"


## according to the README file, test data contains 30% of data and train contains 70% data. 
## I checked the dimensions of the x_test,x_train and they both have the same variables, 
## so combining the rows of both dataframes into one. Same with y_test, y_train and subj_test and subj_train.
## combine data sets 
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
subj <- rbind(subj_test, subj_train)

#########################################################################################################
## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## At this point data is in the three data frames, 'x', 'y' and 'subj'. 'x' has the data from the experiment, 
## y has the activities and subj has the subjects of the experiment.

## I think features.txt has the variables for the data in data frame 'x', 
## so using the data frame 'features' to name the variables in 'x'
## First, I will extract the names that match the strings "mean" and "std" from 'features'

## second column of 'features' data frame gives the string of names for variables
features_str <- as.character(features$V2)  

names(x) <- features_str  ## assign the variable names to data frame 'x' using features_str
mean_str <- grep("mean", features_str) ## extract column names with mean
std_str <- grep(c("mean","std"), features_str) ## extract column names with std

data_mean <- x[,mean_str]  ## extract mean columns from data frame 'x'
data_std <- x[,std_str]   ## extract std columns from data frame 'x'

names(subj) <- "subjects" ## name the variable for 'subj' dataframe
names(y) <- "activities"   ## name the variable for the activities dataframe 'y'

data <- cbind(subj, y, data_mean, data_std)  ## combine columns from dataframes: subj, y, data_mean and data_std

## Now we have the data frame 'data' that has variables, "subjects", "activities", 46 variables with mean, 
## 33 variables with std. Total number of variables in 'data' is 81

##############################################################################################

## Step 3.  Uses descriptive activity names to name the activities in the data set
## Using recode from package, "car", I will replace the activity numbers with their names from activity_labels.txt

data$activities <- recode(data$activities, "1 = 'walking' ; 2 = 'walking_upstairs' ; 3 = 'walking_downstairs'; 4='sitting'; 5='standing'; 6 = 
                          'laying'")

#################################################################################################
## Step 4. Appropriately labels the data set with descriptive variable names.
## At this point all the variables in data frame 'data' has descriptive variable names taken from features.txt 
## This was done in Step 2. I will remove "()" and "-" from the variable names here.

names(data) <- sub("\\(", "",names(data))
names(data) <- sub("\\)", "",names(data))
names(data) <- gsub("-", "", names(data))


#################################################################################################
## Step 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

## using summaryBy function from "doBy" package

finaldata <- summaryBy(. ~ subjects + activities, data = data, FUN = mean)

## write the data to a file.
write.table(finaldata, "CourseProjectTidyData.txt")


