# code to download ML assignment data files
# set train and test files URL
trainFileURL <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
testFileURL <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
# download files
download.file(trainFileURL, destfile = "pm1-training.csv")
download.file(testFileURL, destfile = "pm1-testing.csv")





