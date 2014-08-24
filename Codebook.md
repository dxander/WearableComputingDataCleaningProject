---
title: "Codebook"
author: "Don Alexander Eckford"
date: "Saturday, August 23, 2014"
output: html_document
---

## Part 1
The data consists of the variable *subjectid*
Participants age 18-49 performed up to 6 activities wearing the smartphone.  
Measurements were made using the embedded accelerometer and gyroscope. The train and test data sets have been combined to form a wide form data set.  Variables not related to the mean or standard deviation of a measurement were removed from the original data set.   

## Part 2
The data consist of 6 grouping variables by *actcode* and *activity*  
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

actcode is numeric
activity is character

## Part 3  
The following measurements were recorded for the participants.  
There are two broad types of measurements in the data.  

tvariablename and fvariablename.  The t stands for time domain. The f for frequency domain. These are terms related to Fourier Analysis.

acc in the variable name refers to the accelerometer measurement.
gyro in the variable name refers to the gyroscope measurement.

The x, y, and z labels refer to the x, y, and z axis of measurement.

The bodyacc measurements are body acceleration measurements in gravitational units.

The bodygyro measurements are angular velocity in radian/sec.

For all measurement variables we are interested in the means of the means and the means of the standard deviations across subjects and activities.

The acceleration signal was then separated into body and gravity acceleration 
signals (tBodyAcc-XYZ and tGravityAcc-XYZ).

The body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
  
---------------------------------------------------------------------------  
  
  
Position | Variable Name |      | typical values or Range    
-------- | ------------  | ---- | ------------------------  
 1       | "subjectid"   | factors| int 1-30      
 2       |"actcode"      | factors| int  1-6       
 3 |"activity"|factors |chr "WALKING" "STANDING" "LAYING" "SITTING" "WALKING_UPSTAIRS"  
 4      |"tbodyaccmeanx"|mean value |num  0.266 0.273 0.273 0.274 0.279  
 5  |"tbodyaccmeany"|mean value |num  -0.0183 -0.0191 -0.0179 -0.0148 -0.0155  
 6      |"tbodyaccmeanz"|mean value |num  -0.108 -0.116 -0.106 -0.108 -0.106   
 7      |"tbodyaccstdx" |mean value | num  -0.546 -0.606 -0.623 -0.605 -0.508  
 8      |"tbodyaccstdy" |mean value |num  -0.368 -0.429 -0.48 -0.51 -0.403  
 9      |"tbodyaccstdz" |mean value | num  -0.503 -0.589 -0.654 -0.709 -0.646  
10      |"tgravityaccmeanx"| mean value| num  0.745 0.661 0.708 0.707 0.698  
    
Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
11      |"tgravityaccmeany"|mean value| num  -0.0826 -0.1472 -0.0261 0.1126 0.112  
12      |"tgravityaccmeanz"|mean value| num  0.0723 0.1349 0.0481 0.1641 0.0922              
13      |"tgravityaccstdx" |mean value|  num  -0.96 -0.963 -0.966 -0.963 -0.965             
14      |"tgravityaccstdy" |mean value| num  -0.951 -0.96 -0.945 -0.941 -0.94             
15      |"tgravityaccstdz" |mean value|num  -0.926 -0.945 -0.927 -0.941 -0.942            
16      |"tbodyaccjerkmeanx"|mean value|num  0.0771 0.0785 0.0702 0.0789 0.0841           
17      |"tbodyaccjerkmeany"|mean value| num  0.01659 0.00709 0.01447 0.00351 0.00177  
18      |"tbodyaccjerkmeanz"|mean value|num  -0.009108 0.000756 -0.000527 -0.007374 -0.002954  
19      |"tbodyaccjerkstdx" |mean value|num  -0.525 -0.558 -0.635 -0.632 -0.576      
20      |"tbodyaccjerkstdy" |mean value|num  -0.47 -0.492 -0.557 -0.584 -0.507   

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
21      |"tbodyaccjerkstdz" |mean value|num  -0.717 -0.742 -0.796 -0.843 -0.785
22      |"tbodygyromeanx"|mean value|num  -0.0209 -0.0517 -0.0248 -0.0289 -0.0295
23      |"tbodygyromeany"|mean value|num  -0.0881 -0.0568 -0.0744 -0.0787 -0.0774 
24      |"tbodygyromeanz"| mean value| num  0.0863 0.0873 0.0867 0.0957 0.0866
25      |"tbodygyrostdx" | mean value|num  -0.687 -0.711 -0.699 -0.701 -0.71
26      |"tbodygyrostdy" | mean value|num  -0.451 -0.723 -0.763 -0.798 -0.706
27      |"tbodygyrostdz" | mean value| num  -0.597 -0.635 -0.709 -0.726 -0.607
28      |"tbodygyrojerkmeanx"| mean value|num  -0.0971 -0.0876 -0.0992 -0.1079 -0.1035
29      |"tbodygyrojerkmeany"|mean value|num  -0.0417 -0.0434 -0.0402 -0.04 -0.0491
30      |"tbodygyrojerkmeanz"|mean value|num  -0.0471 -0.0558 -0.0521 -0.0578 -0.0506

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
31|"tbodygyrojerkstdx" |mean value|num  -0.638 -0.672 -0.689 -0.724 -0.663
32|"tbodygyrojerkstdy" | mean value|num  -0.634 -0.784 -0.843 -0.903 -0.774
33|"tbodygyrojerkstdz" | mean value|num  -0.665 -0.675 -0.743 -0.748 -0.565
34|"tbodyaccmagmean"   | mean value|num  -0.454 -0.535 -0.563 -0.562 -0.461
35|"tbodyaccmagstd"    | mean value| num  -0.497 -0.553 -0.591 -0.607 -0.522
36|"tgravityaccmagmean"| mean value| num  -0.454 -0.535 -0.563 -0.562 -0.461
37      |"tgravityaccmagstd" | mean value|num  -0.497 -0.553 -0.591 -0.607 -0.522
38      |"tbodyaccjerkmagmean"|mean value|num  -0.545 -0.588 -0.65 -0.656 -0.589 
39      |"tbodyaccjerkmagstd" |mean value|num  -0.516 -0.512 -0.608 -0.647 -0.589 
40      |"tbodygyromagmean"   |mean value|num  -0.475 -0.615 -0.643 -0.656 -0.603

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
41      |"tbodygyromagstd"   | mean value |num  -0.5 -0.681 -0.674 -0.707 -0.664 
42      |"tbodygyrojerkmagmean"|mean value|num  -0.64 -0.747 -0.784 -0.819 -0.707
43      |"tbodygyrojerkmagstd" |mean value|num  -0.652 -0.74 -0.804 -0.844 -0.734.
44      |"fbodyaccmeanx"       |mean value|num  -0.532 -0.574 -0.626 -0.629 -0.551
45      |"fbodyaccmeany"       |mean value|num  -0.406 -0.433 -0.502 -0.526 -0.44
46      |"fbodyaccmeanz"       |mean value|num  -0.596 -0.63 -0.7 -0.755 -0.696
47      |"fbodyaccstdx"        |mean value|num  -0.553 -0.62 -0.624 -0.598 -0.493
48      |"fbodyaccstdy"        |mean value|  num  -0.39 -0.465 -0.503 -0.535 -0.422
49      |"fbodyaccstdz"        |mean value| num  -0.499 -0.601 -0.657 -0.709 -0.649
50      |"fb|odyaccmeanfreqx"   |mean value| num  -0.181 -0.107 -0.193 -0.185 -0.226

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
51      |"fbodyaccmeanfreqy"   |mean value| num  0.0576 0.1057 0.0389 0.0848 0.0749
52      |"fbodyaccmeanfreqz"|mean value|num 0.05837 0.08721 0.00447 -0.01641 .00627
53      |"fbodyaccjerkmeanx"   |mean value|num  -0.547 -0.562 -0.646 -0.652 -0.605
54      |"fbodyaccjerkmeany"   |mean value| num  -0.507 -0.509 -0.583 -0.602 -0.551
55      |"fbodyaccjerkmeanz"   |mean value|num  -0.695 -0.716 -0.78 -0.825 -0.769
56      |"fbodyaccjerkstdx"    |mean value|num  -0.544 -0.595 -0.658 -0.645 -0.584
57      |"fbodyaccjerkstdy"    |mean value| num  -0.466 -0.509 -0.56 -0.594 -0.492
58      |"fbodyaccjerkstdz"    |mean value|num  -0.738 -0.767 -0.811 -0.861 -0.799
59      |"fbodyaccjerkmeanfreqx"|mean value|num  -0.048801 0.0868 -0.047694 -0.000544 -0.102921

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
60      |"fbodyaccjerkmeanfreqy"| mean value|num  -0.215 -0.14 -0.237 -0.181 -0.274
61      |"fbodyaccjerkmeanfreqz"|mean value|num  -0.0964 -0.0943 -0.1937 -0.1106 -0.1637
62      |"fbodygyromeanx"       |mean value|num  -0.623 -0.639 -0.642 -0.642 -0.632
63      |"fbodygyromeany"       |mean value|num  -0.505 -0.722 -0.775 -0.832 -0.717
64      |"fbodygyromeanz"       |mean value|num  -0.554 -0.602 -0.671 -0.689 -0.537
65      |"fbodygyrostdx"        | mean value|num  -0.708 -0.735 -0.719 -0.722 -0.736
66      |"fbodygyrostdy"        |mean value|num  -0.43 -0.727 -0.759 -0.783 -0.702
67                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |"fbodygyrostdz"        |mean value|num  -0.65 -0.683 -0.751 -0.767 -0.669
68      |"fbodygyromeanfreqx"|mean value|num  -0.03203 -0.00577 -0.10257 -0.11852 -0.03816
69      |"fbodygyromeanfreqy"|mean value|num  -0.0902 -0.0702 -0.1677 -0.3753 -0.0721

Position | Variable Name |      | typical values or Range    
-----    | -----         | ---- |  ---------
70      |"fbodygyromeanfreqz"|mean value|num  -0.018 0.0514 -0.0322 0.0242 0.0744
71      |"fbodyaccmagmean"|mean value|num  -0.478 -0.515 -0.579 -0.602 -0.529
72      |"fbodyaccmagstd"|mean value|num  -0.59 -0.647 -0.663 -0.673 -0.594
73      |"fbodyaccjerkmagmean"|mean value|num  -0.499 -0.51 -0.605 -0.635 -0.573
74      |"fbodyaccjerkmagstd"| mean value| num  -0.542 -0.519 -0.616 -0.667 -0.613
75      |"fbodygyromagmean"     | mean value|num  -0.535 -0.7 -0.717 -0.746 -0.677
76      |"fbodygyromagstd"|mean value|num  -0.567 -0.725 -0.704 -0.733 -0.716
77      |"fbodygyrojerkmagmean" |mean value| num  -0.646 -0.752 -0.81 -0.839 -0.749
78      |"fbodygyrojerkmagstd"  |mean value| num  -0.686 -0.744 -0.81 -0.863 -0.736
79      |"angletbodyaccmeanwithgravity" |mean value|num  0.03761 0.00987 0.01409 0.00803 -0.00911
80      |"angletbodyaccjerkmeanwithgravitymean"|mean value |num  0.00902 0.01404 0.01345 -0.01114 -0.01522

Position | Variable Name |      | typical values or Range      
-----    | -----         | ---- |  ---------  
81      |"angletbodygyromeanwithgravitymean"|mean value |num  -0.01345 0.07459 0.0359 0.02708 -0.00953
82      | "angletbodygyrojerkmeanwithgravitymean"|mean value|num  -0.00163 -0.03729 -0.01921 0.01178 -0.0234
83      |"anglexwithgravitymean"|mean value|num  -0.536 -0.434 -0.503 -0.577 -0.598
84      |"angleywithgravitymean"|mean value|num  0.1228 0.1723 0.0756 -0.0324 -0.0379
85      |"anglezwithgravitymean"|mean value|num  -0.0391 -0.0789 -0.0175 -0.0955 -0.0441 
 -------|-----------------------|----------|---------------------------------- 