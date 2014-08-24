# The purpose of this project is to demonstrate your ability to collect, work 
# with, and clean a data set. The goal is to prepare tidy data that can be used 
# for later analysis. You will be graded by your peers on a series of yes/no 
# questions related to the project. You will be required to submit: 
# 1) a tidy data set as described below, 
# 2) a link to a Github repository with your script for performing the analysis, 
# and 3) a code book that describes the variables, the data, and any 
# transformations or work that you performed to clean up the data called 
# CodeBook.md. 
# You should also include a README.md in the repo with your scripts. This repo 
# explains how all of the scripts work and how they are connected.  

# One of the most exciting areas in all of data science right now is wearable 
# computing - see for example this article . Companies like Fitbit, Nike, and 
# Jawbone Up are racing to develop the most advanced algorithms to attract new 
# users. The data linked to from the course website represent data collected from 
# the accelerometers from the Samsung Galaxy S smartphone. A full description is 
# available at the site where the data was obtained: 
# 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+
#         Smartphones 
# 
# Here are the data for the project: 
#         
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%
#         20Dataset.zip 

# You should create one R script called run_analysis.R that does the following. 
#####################################################################################
#1. Merges the training and the test sets to create one data set.

options(stringsAsFactors=FALSE)
setwd("E:/DataScientist/DataScientistToolbox/DataScience/datasciencecoursera/getdata-projectfiles-UCI HAR Dataset/")
directory3='UCI HAR Dataset'

files3 <- list.files(directory3, full.names=TRUE)  
files3   # character class and mode
# [1] "UCI HAR Dataset/activity_labels.txt"
# [2] "UCI HAR Dataset/features.txt"       
# [3] "UCI HAR Dataset/features_info.txt"  
# [4] "UCI HAR Dataset/README.txt"         
# [5] "UCI HAR Dataset/test"               
# [6] "UCI HAR Dataset/train"         


#read.table()
activity_labels <-read.table(files3[1],as.is=TRUE,colClasses="character",blank.lines.skip=TRUE)
#features<-read.table(files3[2],as.is=TRUE,colClasses="character",blank.lines.skip=TRUE)
# 'data.frame':  6 obs. of  2 variables:
#   $ V1: int  1 2 3 4 5 6
# $ V2: chr  "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" ...
features<-read.csv("UCI HAR Dataset/features.CSV",header=FALSE)


setwd("E:/DataScientist/DataScientistToolbox/DataScience/datasciencecoursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")
directory1='train'
directory2='test'

files <- list.files(directory1, full.names=TRUE)  
files
# [1] "train/Inertial Signals" 
# [2] "train/subject_train.csv"
# [3] "train/subject_train.txt"
# [4] "train/X_train.csv"      
# [5] "train/X_train.txt"      
# [6] "train/y_train.csv"      
# [7] "train/y_train.txt"      
files2 <- list.files(directory2, full.names=TRUE)  
files2
# [1] "test/Inertial Signals"
# [2] "test/subject_test.txt"
# [3] "test/X_test.csv"      
# [4] "test/X_test.txt"      
# [5] "test/y_test.csv"      
# [6] "test/y_test.txt"      



#read.table()
subject_train<-read.table(files[3])
X_train<-read.table(files[5])
y_train<-read.table(files[7])
subject_test<-read.table(files2[2])
X_test<-read.table(files2[4])
y_test<-read.table(files2[6])

# combine X_train with X_test 7352 rows by 561 col with 2947 rows by 561 col 
XX<-rbind(X_train,X_test)  # 10299obs by 561 variables
# combine subject_train with subject_test 7352 by 1, 2947 by 1
ss<-rbind(subject_train,subject_test) # 10299obs by 1 variable
# combine y_train with y_test 7352 by 1, 2947 by 1
yy<-rbind(y_train,y_test)  # 10299 obs by 1 variable
# add features to XX along 561 as colnames
#fxx<-rbind(features,xx) # don't use do colnames(xx) <- features
head(features)
# V1                V2
# 1  1 tBodyAcc-mean()-X
# 2  2 tBodyAcc-mean()-Y
# 3  3 tBodyAcc-mean()-Z
# 4  4  tBodyAcc-std()-X
# 5  5  tBodyAcc-std()-Y
# 6  6  tBodyAcc-std()-Z
features[1:10,2]
colnames(XX) <- features[,2]
head(XX)
names(XX)
# [1] "tBodyAcc-mean()-X"                   
# [2] "tBodyAcc-mean()-Y"                   
# [3] "tBodyAcc-mean()-Z"                   
# [4] "tBodyAcc-std()-X"                    
# [5] "tBodyAcc-std()-Y"                    
# [6] "tBodyAcc-std()-Z"                    
# [7] "tBodyAcc-mad()-X"                    
# [8] "tBodyAcc-mad()-Y"                    
# [9] "tBodyAcc-mad()-Z"                    
# [10] "tBodyAcc-max()-X"                    
 
        


# add activity to yy along 6 factors  split by factors
# merge activity with yy using 1-6 activity code
head(yy)
head(activity_labels)
yy<-merge(yy,activity_labels,by.x="V1",by.y="V1")
head(yy)
# V1      V2
# 1  1 WALKING
# 2  1 WALKING
# 3  1 WALKING
# 4  1 WALKING
# 5  1 WALKING
# 6  1 WALKING
str(yy)
colnames(yy)<-c("actcode","activity")

#############  Now we have XX , yy, and ss   
dim(XX)   # 10299 by 561
dim(yy)   # 10299 by 1
dim(ss)   # 10299 by 1
# cbind() them
data <- cbind(XX,ss,yy)   # 10299obs by 564 variables
str(data)
names(data)  # keep only measurements of mean and stdev amongst measurements
# col 562  from ss does not have column heading
unique(data[,562])   # ids 1- 30 rename subject id
names(data)<-sub("V1",'subjectid',names(data))  # worked as expected

#########################################################################
#2. Extracts only the measurements on the mean and stdev for each measurement. 
# Used search feature of notepad++ to find which variable names had mean or std 
data2<-cbind(data[,1:6],data[,41:46],data[,81:86],data[,121:126],data[,161:166])
data2_1<-cbind(data[,201:202],data[,214:215],data[,227:228],data[,240:241],data[,253:254])
data2_2<-cbind(data[,266:271],data[,294:296],data[,345:350],data[,373:375])
data2_3<-cbind(data[,424:429],data[,452:454],data[,503:504],data[,513],data[,516:517])
# data[,513] colname = "fBodyAccMag-meanFreq()", data[,539]="fBodyBodyGyroMag-meanFreq()" 
data2_4<-cbind(data[,526],data[,529:530],data[,539],data[,542:543],data[,552],data[,555:564])
# data[,526] "fBodyBodyAccJerkMag-meanFreq()", data[,552]= "fBodyBodyGyroJerkMag-meanFreq()"
data3<-cbind(data2,data2_1,data2_2,data2_3,data2_4)
# 10299 obs by 69 variables
str(data3)
names(data3)


#############################################################################
#3. Uses descriptive activity names to name the activities in the data set
# columns 70, 73, 76, 79 should be dropped as variable name is not included 
# make a note if the meanFreq information is needed later(the names were recorded above incase they are needed to be included later)
# Keeping 'actcode' and 'activity" since 'actcode' is numeric and 
# 'activity' is character
# [1] "WALKING"           
# [2] "WALKING_UPSTAIRS"  
# [3] "WALKING_DOWNSTAIRS"
# [4] "SITTING"           
# [5] "STANDING"          
# [6] "LAYING"            
data3 <-cbind(data3[,1:69],data3[71:72],data3[74:75],data3[77:78],data3[80:89])
# 10299 obs by 83 variables
names(data3)
# These names are descriptive enough. They can not be confused.

###########################################################################
#4. Appropriately labels the data set with descriptive variable names. 
# example gsub("-|\\()", "", "fbody-body-gyro-jerck-mag-sd()")
names(data3)<-gsub("-|\\()|\\(|\\)","",names(data3))
#names(data3)<-gsub("-","",names(data3))
#names(data3)
names(data3)<-tolower(names(data3))
names(data3)
names(data3)<-gsub("\\,","with",names(data3))
names(data3)<-gsub("bodybody","body",names(data3))  
# seems to be a typo after checking featuresinfo.txt file
names(data3)

######   Decision to keep tname and fname format as this has to do with 
#       Time Domain and Frequency Domain ideas in Fourier Analysis
#       the t and f have enough information.  

#######################################################
# put subjectid, activity, actcode in front of dataset
data4<-cbind(data3[,83:85],data3[,1:82])
names(data4)
save(data4,file= "./data4.RData")   # saved as an R object
#######################################################################
###########    data4 is my official data set after steps 1-4 of project

#5. Creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject. 
# clear environment , clear console
## restore the saved values to the user's workspace
setwd("E:/DataScientist/DataScientistToolbox/DataScience/datasciencecoursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")

load("data4.RData", .GlobalEnv)
names(data4)
measures<-data4[,4:85]
by1<-data4[,1]
by2<-data4[,2]
by3<-data4[,3]
length(by1)   #10299
length(by2)
length(by3)
unique(by1)   # 1-30
unique(by2)
unique(by3)
# [1] "WALKING"            "WALKING_UPSTAIRS"  
# [3] "WALKING_DOWNSTAIRS" "SITTING"           
# [5] "STANDING"           "LAYING" 
# not satisfied with aggregates output will use tapply with two factors
# and loop over the 79 variables.
# data5<-data.structure()
# for(i in 4:85){
# data5[,i]<-tapply(data4[,i],INDEX=list(by1,by2),FUN='mean',simplify=TRUE)
# }

library(reshape2)
library(plyr)

data4melt <- melt(data4,id.vars=c("subjectid","actcode","activity"),
                  variable.name = "measurement_variables",
                  value.name = "measurement_value")
str(data4melt)
# 'data.frame':        844518 obs. of  5 variables:
#         $ subjectid            : int  1 1 1 1 1 1 1 1 1 1 ...
# $ actcode              : int  1 1 1 1 1 1 1 1 1 1 ...
# $ activity             : chr  "WALKING" "WALKING" "WALKING" "WALKING" ...
# $ measurement_variables: Factor w/ 82 levels "tbodyaccmeanx",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ measurement_value    : num  0.289 0.278 0.28 0.279 0.277 ...
dim(data4melt)
#[1] 844518      5  Long Form

data5<-dcast(data4melt, subjectid+actcode+activity~measurement_variables,fun.aggregate=mean)

dim(data5)
#[1] 35 85
# data5 is the "Tidy Data Set"
save(data5,file= "./data5.RData")   
load("data5.RData", .GlobalEnv)
names(data5)
str(data5)
# Please upload the tidy data set created in step 5 of the instructions. Please
# upload your data set as a txt file created with write.table() using 
# row.name=FALSE (do not cut and paste a dataset directly into the text box, as 
# this may cause errors saving your submission).
write.table(data5,file= "./data5.txt",row.names=FALSE)
