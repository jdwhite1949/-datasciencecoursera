# Code for running each of the methods used for this assignment
# load the parallel processing libraries and create clusters to use for processing
library(parallel); library(doParallel); 
cluster <- makeCluster(detectCores()-1)
registerDoParallel(cluster)

# load libraries
require(caret)

# execute method 1: rpart
set.seed(1)
cvCtrl <- trainControl(method = "repeatedcv", number = 10, repeats=3, allowParallel = TRUE)
modFit_rpart <- train(classe~., data = training, method="rpart", 
                       tuneLength=30, trControl=cvCtrl)

# execute method 2: treebag
set.seed(1)
modFit_treebag <- train(classe~., data=training, method="treebag", trControl=cvCtrl)

# execute method 3: gbm (gradient boost)
set.seed(1)
modFit_gbm <- train(classe~., method="gbm", data = training, verbose=FALSE, trControl=cvCtrl)

# execute method 4: random forest (classification trees) 
set.seed(1)
modFit_rf <- train(classe~., data=training, method="rf", trControl=cvCtrl)

# execute method 5: C50 algorithm
set.seed(1)
modFit_C502 <- train(classe~., data = training, method = "C5.0", 
                     trControl = cvCtrl, verbose = FALSE)







