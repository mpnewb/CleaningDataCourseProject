Downloaded the zip file on 3/21/2016 10:58PM CST.

Original experiment was described in README.txt file. 

After reading the README file and features_info.txt file, I think the files in the directory "Inertial Signals" under 'test' and 'train' are irrelevant files. The data from these files is summarized in X_test, X_train files. 

Data files are: test/X_test.txt, test/y_test.txt, test/subject_test.txt, train/X_test.txt, train/y_train.txt, train/subject_train.txt,

Information files are: activity_labels.txt, features.txt features_info.txt and README.txt

According to the README file, test data contains 30% of data and train contains 70% data. I checked the dimensions of the x_test,x_train and they both have the same variables, so combining the rows of both dataframes into one. Same with y_test, y_train and subj_test and subj_train. Used rbind() to merge the data frames.

After this, data is in the three data frames, x, y and subj. x has the data from the experiment, y has the activities and subj has the subjects of the experiment.  

I think features.txt is the variables for the data in X_test.txt and X_train.txt. I read the features.txt and extracted the names that match mean and std into two strings. Then I applied those names to x data frame and extracted those from the x data frame. Finally combined the data frames, subj, y, two dataframes I extracted from x data frame.  
Now we have the data frame 'data' that has variables, "subjects", "activities", 46 variables with mean, 
33 variables with std. Total number of variables in 'data' is 81

I removed, "(", ")", "-", from the variable names.

Created a new data frame with independent tidy data set with the average of each variable for each activity and each subject using summaryBy function from "doBy" package.


Variables:

Subjects:  This data is from original files, subject_test.txt and subject_train.txt.
1 -30

Activities:  This data is from original file, activity_labels.txt
 WALKING
 WALKING_UPSTAIRS
 WALKING_DOWNSTAIRS
 SITTING
 STANDING
 LAYING

Variables, 3-81 
Average of each variable from original data for each activity and each subject. Original data description is in features_info.txt.


 [1] "subjects"                          "activities"                        "tBodyAccmeanX.mean"               
 [4] "tBodyAccmeanY.mean"                "tBodyAccmeanZ.mean"                "tGravityAccmeanX.mean"            
 [7] "tGravityAccmeanY.mean"             "tGravityAccmeanZ.mean"             "tBodyAccJerkmeanX.mean"           
[10] "tBodyAccJerkmeanY.mean"            "tBodyAccJerkmeanZ.mean"            "tBodyGyromeanX.mean"              
[13] "tBodyGyromeanY.mean"               "tBodyGyromeanZ.mean"               "tBodyGyroJerkmeanX.mean"          
[16] "tBodyGyroJerkmeanY.mean"           "tBodyGyroJerkmeanZ.mean"           "tBodyAccMagmean.mean"             
[19] "tGravityAccMagmean.mean"           "tBodyAccJerkMagmean.mean"          "tBodyGyroMagmean.mean"            
[22] "tBodyGyroJerkMagmean.mean"         "fBodyAccmeanX.mean"                "fBodyAccmeanY.mean"               
[25] "fBodyAccmeanZ.mean"                "fBodyAccmeanFreqX.mean"            "fBodyAccmeanFreqY.mean"           
[28] "fBodyAccmeanFreqZ.mean"            "fBodyAccJerkmeanX.mean"            "fBodyAccJerkmeanY.mean"           
[31] "fBodyAccJerkmeanZ.mean"            "fBodyAccJerkmeanFreqX.mean"        "fBodyAccJerkmeanFreqY.mean"       
[34] "fBodyAccJerkmeanFreqZ.mean"        "fBodyGyromeanX.mean"               "fBodyGyromeanY.mean"              
[37] "fBodyGyromeanZ.mean"               "fBodyGyromeanFreqX.mean"           "fBodyGyromeanFreqY.mean"          
[40] "fBodyGyromeanFreqZ.mean"           "fBodyAccMagmean.mean"              "fBodyAccMagmeanFreq.mean"         
[43] "fBodyBodyAccJerkMagmean.mean"      "fBodyBodyAccJerkMagmeanFreq.mean"  "fBodyBodyGyroMagmean.mean"        
[46] "fBodyBodyGyroMagmeanFreq.mean"     "fBodyBodyGyroJerkMagmean.mean"     "fBodyBodyGyroJerkMagmeanFreq.mean"
[49] "tBodyAccstdX.mean"                 "tBodyAccstdY.mean"                 "tBodyAccstdZ.mean"                
[52] "tGravityAccstdX.mean"              "tGravityAccstdY.mean"              "tGravityAccstdZ.mean"             
[55] "tBodyAccJerkstdX.mean"             "tBodyAccJerkstdY.mean"             "tBodyAccJerkstdZ.mean"            
[58] "tBodyGyrostdX.mean"                "tBodyGyrostdY.mean"                "tBodyGyrostdZ.mean"               
[61] "tBodyGyroJerkstdX.mean"            "tBodyGyroJerkstdY.mean"            "tBodyGyroJerkstdZ.mean"           
[64] "tBodyAccMagstd.mean"               "tGravityAccMagstd.mean"            "tBodyAccJerkMagstd.mean"          
[67] "tBodyGyroMagstd.mean"              "tBodyGyroJerkMagstd.mean"          "fBodyAccstdX.mean"                
[70] "fBodyAccstdY.mean"                 "fBodyAccstdZ.mean"                 "fBodyAccJerkstdX.mean"            
[73] "fBodyAccJerkstdY.mean"             "fBodyAccJerkstdZ.mean"             "fBodyGyrostdX.mean"               
[76] "fBodyGyrostdY.mean"                "fBodyGyrostdZ.mean"                "fBodyAccMagstd.mean"              
[79] "fBodyBodyAccJerkMagstd.mean"       "fBodyBodyGyroMagstd.mean"          "fBodyBodyGyroJerkMagstd.mean"     


