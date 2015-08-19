## Code Book: run\_analysis.R ##

See ReadMe file for description of the step by step process for the file

**List of variables and purpose:<br/>**
(in order of use within the script)

**xTrain:** (data frame) contains data set loaded from X\_train.txt file

**xTest:** (data frame) contains data set load from X\_test.txt

**var_names:** (data frame) contains 561 variable names from features.txt file

**list_var_names:** (character) contains list of variable names for xTrain and xTest variables/columns

**act_labels:** (data frame) contains activity labels from activity\_labels.txt
 
**yTest:** (data frame) contains activities related to xTest data set (from file yTest.txt

**yTrain:** (data frame) contains activities related to xTrain data set (from file yTrain.txt)

**yTest2:** (daa frame) combined columns from yTest and act\_labels variables

**yTrain2:** (data frame) combined columns from yTest and act\_labels variables

**sub_test:** (data frame) contains data from subject\_test.txt file (identifies subjects by number)

**sub_train:** (data frame) contains data from subject\_train.txt file (identifies subjects by number)

**all_xTrain:** (data frame) combined train data containing all data from sub\_train, yTrain2, and xTrain data sets (data added as columns)

**all_xTest:** (data frame) combined test data containing all data from sub\_test, yTest2, and xTest data sets (data added as columns)

**complete\_data\_set:** (data frame) combined data (by rows) of all\_xTrain and all\_xTest

**sub_data_set:** (data frame) a subset of complete\_data\_set containing only those columns/variables related to subject, activity, mean, and standard deviation

**tidy_data_set:** (data frame) the final set of data of calculated means and standard deviations grouped by subject and activity


