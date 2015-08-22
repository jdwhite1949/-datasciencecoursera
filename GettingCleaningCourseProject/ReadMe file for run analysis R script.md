## ReadMe: run\_analysis.R ##
### Source of Original Data ###
The "run\_analysis.R" script creates a method of calculating the average of each of the variables from the data set that can be found at the following URL: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data set is part of the data collected for the "Human Activity Recognition Using Smartphones Dataset" collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory. For more information see the UCI machine Learning Repository located at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For each record in the original dataset it is provided: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

This description is from the original README.txt file supplied with original data set.

#### The files containing the original observations were: <br/>
[1] activity\_labels.txt: Links the class labels with their activity name<br/>
[2] train/X\_train.txt: Training data set<br/>
[3] train/y\_train.txt: Training labels associated with training data<br/>
[4] test/X\_test.txt: Test data set<br/>
[5] test/y\_test.txt: Test labels associated with test data<br/>
[6] features.txt: file used to get variable names for final results

### Subset of data used for this analysis ###
The subset of data returned by the "run_analysis.R" script had 81 variables with 180 observations (rows). At the end of this document is a list of the variables, their class/type, and some sample values for each variable (column) 

### Process of the "run_analysis. R" script ###
The following is the step by step process initiated by the "run_analysis" script:

[1] required data files from UCI HAR Dataset are loaded into variables: X\_train, X\_test, y\_train, y\_test, features, and activity\_labels (all of these data sets are in text files)<br/>
[2] columns in training and test data sets are assigned appropriate variable names<br/>
[3] load the dplyr library<br/>
[4] do inner joins on activity labels and y train and test data to replace numbers with labels for each of the data set rows<br/>
[5] add column names to subject and activity data sets<br/>
[6] combine the various data sets into a single data sets (creates a tidy data set<br/>
[7] select only those columns that are related to subject, activity, mean, and standard deviation (std) creating a subset<br/>
[8] summarize the subset of data into column means and standard deviations (remove na)<br/>
[9] write final tidy data set to text file<br/>
[10] remove all variables from environment (clean up)

###Summary of the variables within the final data set###

[1] "var_name | var_type | min | avg | median | max"                                           
 [2] "--- | --- | --- | --- | --- | ---"                                                        
 [3] "subject | integer |  1.000000 | 15.500000 | 15.500000 | 30.000000"                        
 [4] "activity | factor | NA | NA | NA | NA"                                                    
 [5] "tBodyAcc.mean...X | numeric |  0.221598 |  0.274303 |  0.276965 |  0.301461"              
 [6] "tBodyAcc.mean...Y | numeric | -0.040514 | -0.017876 | -0.017262 | -0.001308"              
 [7] "tBodyAcc.mean...Z | numeric | -0.152514 | -0.109164 | -0.108191 | -0.075378"              
 [8] "tBodyAcc.std...X | numeric | -0.996069 | -0.557690 | -0.752562 |  0.626917"               
 [9] "tBodyAcc.std...Y | numeric | -0.990241 | -0.460463 | -0.508965 |  0.616937"               
[10] "tBodyAcc.std...Z | numeric | -0.987659 | -0.575560 | -0.651757 |  0.609018"               
[11] "tGravityAcc.mean...X | numeric | -0.680043 |  0.697478 |  0.920839 |  0.974509"           
[12] "tGravityAcc.mean...Y | numeric | -0.479895 | -0.016213 | -0.127822 |  0.956594"           
[13] "tGravityAcc.mean...Z | numeric | -0.495089 |  0.074128 |  0.023841 |  0.957873"           
[14] "tGravityAcc.std...X | numeric | -0.996764 | -0.963753 | -0.969466 | -0.829555"            
[15] "tGravityAcc.std...Y | numeric | -0.994248 | -0.952430 | -0.959033 | -0.643578"            
[16] "tGravityAcc.std...Z | numeric | -0.990957 | -0.936401 | -0.945002 | -0.610161"            
[17] "tBodyAccJerk.mean...X | numeric |  0.042688 |  0.079474 |  0.076400 |  0.130193"          
[18] "tBodyAccJerk.mean...Y | numeric | -0.038687 |  0.007565 |  0.009470 |  0.056819"          
[19] "tBodyAccJerk.mean...Z | numeric | -0.067458 | -0.004953 | -0.003861 |  0.038053"          
[20] "tBodyAccJerk.std...X | numeric | -0.994605 | -0.594947 | -0.810365 |  0.544273"           
[21] "tBodyAccJerk.std...Y | numeric | -0.989514 | -0.565415 | -0.775640 |  0.355307"           
[22] "tBodyAccJerk.std...Z | numeric | -0.993288 | -0.735958 | -0.883657 |  0.031016"           
[23] "tBodyGyro.mean...X | numeric | -0.205775 | -0.032437 | -0.028705 |  0.192704"             
[24] "tBodyGyro.mean...Y | numeric | -0.204205 | -0.074260 | -0.073182 |  0.027471"             
[25] "tBodyGyro.mean...Z | numeric | -0.072455 |  0.087445 |  0.085121 |  0.179102"             
[26] "tBodyGyro.std...X | numeric | -0.994277 | -0.691640 | -0.788992 |  0.267657"              
[27] "tBodyGyro.std...Y | numeric | -0.994210 | -0.653302 | -0.801684 |  0.476519"              
[28] "tBodyGyro.std...Z | numeric | -0.985538 | -0.616435 | -0.801001 |  0.564876"              
[29] "tBodyGyroJerk.mean...X | numeric | -0.157213 | -0.096057 | -0.098683 | -0.022092"         
[30] "tBodyGyroJerk.mean...Y | numeric | -0.076809 | -0.042693 | -0.041118 | -0.013202"         
[31] "tBodyGyroJerk.mean...Z | numeric | -0.092500 | -0.054802 | -0.053430 | -0.006941"         
[32] "tBodyGyroJerk.std...X | numeric | -0.996543 | -0.703633 | -0.839649 |  0.179149"          
[33] "tBodyGyroJerk.std...Y | numeric | -0.997082 | -0.763552 | -0.894178 |  0.295946"          
[34] "tBodyGyroJerk.std...Z | numeric | -0.995381 | -0.709559 | -0.860964 |  0.193206"          
[35] "tBodyAccMag.mean.. | numeric | -0.986493 | -0.497290 | -0.482884 |  0.644604"             
[36] "tBodyAccMag.std.. | numeric | -0.986465 | -0.543909 | -0.607428 |  0.428406"              
[37] "tGravityAccMag.mean.. | numeric | -0.986493 | -0.497290 | -0.482884 |  0.644604"          
[38] "tGravityAccMag.std.. | numeric | -0.986465 | -0.543909 | -0.607428 |  0.428406"           
[39] "tBodyAccJerkMag.mean.. | numeric | -0.992815 | -0.607930 | -0.816779 |  0.434490"         
[40] "tBodyAccJerkMag.std.. | numeric | -0.994647 | -0.584176 | -0.801379 |  0.450612"          
[41] "tBodyGyroMag.mean.. | numeric | -0.980741 | -0.565163 | -0.655080 |  0.418005"            
[42] "tBodyGyroMag.std.. | numeric | -0.981373 | -0.630395 | -0.742044 |  0.299976"             
[43] "tBodyGyroJerkMag.mean.. | numeric | -0.997323 | -0.736369 | -0.864795 |  0.087582"        
[44] "tBodyGyroJerkMag.std.. | numeric | -0.997666 | -0.755015 | -0.880927 |  0.250173"         
[45] "fBodyAcc.mean...X | numeric | -0.995250 | -0.575800 | -0.769093 |  0.537012"              
[46] "fBodyAcc.mean...Y | numeric | -0.989034 | -0.488733 | -0.594984 |  0.524188"              
[47] "fBodyAcc.mean...Z | numeric | -0.989474 | -0.629739 | -0.723602 |  0.280736"              
[48] "fBodyAcc.std...X | numeric | -0.996605 | -0.552201 | -0.746999 |  0.658507"               
[49] "fBodyAcc.std...Y | numeric | -0.990680 | -0.481479 | -0.513377 |  0.560191"               
[50] "fBodyAcc.std...Z | numeric | -0.987225 | -0.582361 | -0.644149 |  0.687124"               
[51] "fBodyAcc.meanFreq...X | numeric | -0.635913 | -0.232266 | -0.257307 |  0.159124"          
[52] "fBodyAcc.meanFreq...Y | numeric | -0.379518 |  0.011529 |  0.007855 |  0.466528"          
[53] "fBodyAcc.meanFreq...Z | numeric | -0.520115 |  0.043717 |  0.065824 |  0.402533"          
[54] "fBodyAccJerk.mean...X | numeric | -0.994631 | -0.613928 | -0.812641 |  0.474317"          
[55] "fBodyAccJerk.mean...Y | numeric | -0.989399 | -0.588163 | -0.781656 |  0.276717"          
[56] "fBodyAccJerk.mean...Z | numeric | -0.992018 | -0.714358 | -0.870664 |  0.157776"          
[57] "fBodyAccJerk.std...X | numeric | -0.995074 | -0.612103 | -0.825392 |  0.476804"           
[58] "fBodyAccJerk.std...Y | numeric | -0.990468 | -0.570731 | -0.785152 |  0.349771"           
[59] "fBodyAccJerk.std...Z | numeric | -0.993108 | -0.756489 | -0.895121 | -0.006236"           
[60] "fBodyAccJerk.meanFreq...X | numeric | -0.576044 | -0.069102 | -0.060912 |  0.331449"      
[61] "fBodyAccJerk.meanFreq...Y | numeric | -0.601971 | -0.228102 | -0.232093 |  0.195677"      
[62] "fBodyAccJerk.meanFreq...Z | numeric | -0.627555 | -0.137602 | -0.091870 |  0.230108"      
[63] "fBodyGyro.mean...X | numeric | -0.993123 | -0.636740 | -0.729961 |  0.474962"             
[64] "fBodyGyro.mean...Y | numeric | -0.994025 | -0.676687 | -0.814097 |  0.328817"             
[65] "fBodyGyro.mean...Z | numeric | -0.985958 | -0.604391 | -0.790931 |  0.492414"             
[66] "fBodyGyro.std...X | numeric | -0.994652 | -0.711036 | -0.808599 |  0.196613"              
[67] "fBodyGyro.std...Y | numeric | -0.994353 | -0.645433 | -0.796378 |  0.646234"              
[68] "fBodyGyro.std...Z | numeric | -0.986725 | -0.657747 | -0.822400 |  0.522454"              
[69] "fBodyGyro.meanFreq...X | numeric | -0.395770 | -0.104551 | -0.115527 |  0.249209"         
[70] "fBodyGyro.meanFreq...Y | numeric | -0.666815 | -0.167407 | -0.157945 |  0.273141"         
[71] "fBodyGyro.meanFreq...Z | numeric | -0.507491 | -0.057181 | -0.050811 |  0.377074"         
[72] "fBodyAccMag.mean.. | numeric | -0.986801 | -0.536517 | -0.670271 |  0.586638"             
[73] "fBodyAccMag.std.. | numeric | -0.987648 | -0.620963 | -0.651263 |  0.178685"              
[74] "fBodyAccMag.meanFreq.. | numeric | -0.312338 |  0.076128 |  0.081318 |  0.435847"         
[75] "fBodyBodyAccJerkMag.mean.. | numeric | -0.993998 | -0.575617 | -0.794048 |  0.538405"     
[76] "fBodyBodyAccJerkMag.std.. | numeric | -0.994367 | -0.599161 | -0.812619 |  0.316346"      
[77] "fBodyBodyAccJerkMag.meanFreq.. | numeric | -0.125210 |  0.162546 |  0.171983 |  0.488088" 
[78] "fBodyBodyGyroMag.mean.. | numeric | -0.986535 | -0.667099 | -0.765709 |  0.203980"        
[79] "fBodyBodyGyroMag.std.. | numeric | -0.981469 | -0.672322 | -0.772728 |  0.236660"         
[80] "fBodyBodyGyroMag.meanFreq.. | numeric | -0.456639 | -0.036032 | -0.053522 |  0.409522"    
[81] "fBodyBodyGyroJerkMag.mean.. | numeric | -0.997617 | -0.756385 | -0.877897 |  0.146619"    
[82] "fBodyBodyGyroJerkMag.std.. | numeric | -0.997585 | -0.771517 | -0.894068 |  0.287835"     
[83] "fBodyBodyGyroJerkMag.meanFreq.. | numeric | -0.182924 |  0.125922 |  0.111561 |  0.426302"

 

