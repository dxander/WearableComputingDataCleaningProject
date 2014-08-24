---
title: "Readme"
author: "Don Alexander Eckford"
date: "Saturday, August 23, 2014"
output: html_document
---
# Introduction
The initial data files were obtained from UC Irvine's data depository 
The data comes from a study of Human Activity Recognition using Smartphones

The links for the study and data are provided
 http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+
         Smartphones 
 
 Here are the data for the project: 
         
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%
         20Dataset.zip 

The data were initially downloaded in .zip format and stored in the file 
                getdata-projectfiles-UCI HAR Dataset
## Procedures
This script carries out procedures on the data contained in the directory above.  

1. Merges the training and the tests sets to create one data set.  
2. Extracts only the measurements on the mean and stdev.  
3. Provides descriptive activity names to name the activities.  
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy dta set with the average of each variable for each activity and each subject.

##  Part 1
Our goal here is to merge the training and test data sets.  
After importing files set the local directory to the location of the files  

```{R}
        path = "directory where the files are located./getdata-projectfiles-UCI HAR Dataset/")  
directory3='UCI HAR Dataset'  
"
        setwd(path)  
        files3<-list.files(directory3, full.names=TRUE)  
        files3  
```
Check the directory using list.files().  
The code above prints the file names to the screen.  
Next, read in the files using read.table() for .txt files. Although, I was initially able to read the files using read.table(), I later had to save the features.txt file as a .csv file.  Both files were kept.  

The directory was then changed to be one layer down to reach the next set of files.  Some of these files were saved as .csv also but this was not needed as the text files were able to be read in.  All files were read in and labled using their ordering in the list.files() call.  The sizes of each of the files was checked inorder to ensure the correct combination of files.   

  
```{R read.table()}  
        activity_labels <-read.table(files3[1],as.is=TRUE,colClasses="character",blank.lines.skip=TRUE)    
        #features<-read.table(files3[2],as.is=TRUE,colClasses="character",blanklines.skip=TRUE)    
        features<-read.csv("UCI HAR Dataset/features.CSV",header=FALSE)  
```  
  
There are 6 activity labels coded both numerically and in character form.
    
```{R }
setwd("../getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")  
        directory1='train'  
        directory2='test'  
        files <- list.files(directory1, full.names=TRUE)    
        files  
```  
  
The files in the train file are:    
 1. "train/Inertial Signals"   
 2. "train/subject_train.csv"  
 3. "train/subject_train.txt"  
 4. "train/X_train.csv"        
 5. "train/X_train.txt"        
 6. "train/y_train.csv"         
 7. "train/y_train.txt"        
  
```{R testdirectory}
files2 <- list.files(directory2, full.names=TRUE)    
files2  
```  
The files in the test directory:  
 1. "test/Inertial Signals"  
 2. "test/subject_test.txt"  
 3. "test/X_test.csv"        
 4. "test/X_test.txt"        
 5. "test/y_test.csv"        
 6. "test/y_test.txt"        
  
The files were then read in and named.  
```{R read.table()}  
        subject_train<-read.table(files[3])  
        X_train<-read.table(files[5])  
        y_train<-read.table(files[7])  
        subject_test<-read.table(files2[2])  
        X_test<-read.table(files2[4])  
        y_test<-read.table(files2[6])  
```  

Combine X_train with X_test 7352 rows by 561 col with 2947 rows by 561 col   

```{R combine}    
        XX<-rbind(X_train,X_test)  # 10299obs by 561 variables  
# combine subject_train with subject_test 7352 by 1, 2947 by 1  
        ss<-rbind(subject_train,subject_test) # 10299obs by 1 variable  
# combine y_train with y_test 7352 by 1, 2947 by 1  
        yy<-rbind(y_train,y_test)  # 10299 obs by 1 variable  
# add features to XX along 561 as colnames  
#fxx<-rbind(features,xx) # don't use do colnames(xx) <- features  
```

The code below checks the features of the files to make sure the combinations were done smoothly.  
```{R check}
        head(features)  
        features[1:10,2]  
        colnames(XX) <- features[,2]  
        head(XX)  
        names(XX)  
```  
  
Add activity to yy along 6 factors split by factors, then merge activity   with yy using 1-6 activity code.  

```{R}  
head(yy)  
head(activity_labels)  
yy<-merge(yy,activity_labels,by.x="V1",by.y="V1")  
head(yy)  
str(yy)  
colnames(yy)<-c("actcode","activity")  
```  

Now we have XX , yy, and ss. Check the dimensions. Then combine the files.    
     
```{R dimensionscheck}          
        dim(XX)   # 10299 by 561    
        dim(yy)   # 10299 by 1    
        dim(ss)   # 10299 by 1    
        data <- cbind(XX,ss,yy)   # 10299obs by 564 variables    
        str(data)    
```        
      
Keep only measurements of mean and stdev amongst measurements.  
Col 562  from ss does not have column heading so add it.  
```{R names}  
names(data)    
unique(data[,562])   # ids 1- 30 rename subject id  
names(data)<-sub("V1",'subjectid',names(data))  # worked as expected  
```  
  
## Part 2.   
Extracts only the measurements on the mean and stdev for each measurement.   
Used search feature of notepad++ to find which variable names that had mean or std. Also used names(data) to split data.
   
```{R splitdata}
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
```
Certain columns did not keep their names during this procedure. Because they did not meat the strict definition of mean and std. I left them out but included the names above.

## Part 3.    
Uses descriptive activity names to name the activities in the data set
Columns 70, 73, 76, 79 should be dropped as variable name is not included, make a note if the meanFreq information is needed later(the names were recorded above incase they are needed to be included later).

Keeping 'actcode' and 'activity" since 'actcode' is numeric and 'activity' is character.

 1. "WALKING"             
 2. "WALKING_UPSTAIRS"    
 3. "WALKING_DOWNSTAIRS"  
 4. "SITTING"             
 5. "STANDING"            
 6. "LAYING"  
   
```{R refine}  
data3 <-cbind(data3[,1:69],data3[71:72],data3[74:75],data3[77:78],data3[80:89])
        # 10299 obs by 83 variables
names(data3)
```
These names are descriptive enough. They can not be confused.
  
## Part 4.    
Appropriately labels the data set with descriptive variable names.   

As there does not seem to be a purposeful reason for keeping symbols like parenthesis, commas, dashes in the names of variables the following procedures were done to remove them.  Additionally, names like fbodybody were viewed as typos and only fbody was kept.
  
```{R removesymbols}    
        names(data3)<-gsub("-|\\()|\\(|\\)","",names(data3))  
        names(data3)<-tolower(names(data3))  
        names(data3)<-gsub("\\,","with",names(data3))  
        names(data3)<-gsub("bodybody","body",names(data3))    
        names(data3)  
```    
    
Decision to keep tname and fname format as this has to do with Time Domain and Frequency Domain ideas in Fourier Analysis, the t and f have enough information.  

Put subjectid, activity, actcode in front of dataset
  
```{R ids_in_front}
data4<-cbind(data3[,83:85],data3[,1:82])
names(data4)
```  
Save File.  Data4 is my official data set after steps 1-4 of project.  
  
```{R save}
        save(data4,file= "./data4.RData")   # saved as an R object
```  
  
## Part 5.    
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.    

Clear environment , clear console. Restore the saved values to the user's   workspace.  
  
```{R LOADdata}  
        setwd("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")  
        load("data4.RData", .GlobalEnv)  
        names(data4)  
        measures<-data4[,4:85]     
```                

Use reshape2 package to melt data and then cast it.  The data in part 4   can be said to be in Wide form.   Melting will put the data in long form.
  
        *After melt Long form rows 844518  cols5.*       
        *After cast 35rows 85cols*      
  
```{R melt_and_cast}  
        library(reshape2)
        library(plyr)
data4melt <- melt(data4,id.vars=c("subjectid","actcode","activity"),
                  variable.name = "measurement_variables",
                  value.name = "measurement_value")
        str(data4melt)
        dim(data4melt)
data5<-dcast(data4melt, subjectid+actcode+activity~measurement_variables,fun.aggregate=mean)  
        dim(data5)
```  
  
Data5 is the "Tidy Data Set"  
The data is now in a mean summarized wide form. Save the file and use write.table() to create a text file.  
  
```{R save_as_Rdata_and_txt}  
        save(data5,file= "./data5.RData")     
        write.table(data5,file= "./data5.txt",row.names=FALSE)  
```  
  
