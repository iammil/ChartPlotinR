#### RANDOM FOREST ####

## we will predict a Rock or Mine based on sonar signal

## load data
require(mlbench)
data("Sonar")

## review data set
require(dplyr)
glimpse(Sonar)

## check missing value
any(is.na(Sonar))

## split data
require(caTools)
sample <- sample.split(Sonar$Class, SplitRatio = 0.70)
train <- subset(Sonar, sample == TRUE)
test <- subset(Sonar, sample == FALSE)

## train
require(randomForest)
forest.model <- randomForest(Class ~., data = train,
                             importance = TRUE, ntree = 200)
forest.model # see the confusion matrix, compute accuracy

## test
predict.test <- predict(forest.model, test)
table(test$Class, predict.test) # see confusion matrix

## last step compare in-sample vs. out-of-sample (accuracy or error)

## see what is the most important variable to predict Rock/Mine
imp.scores <- importance(forest.model, type = 2)
order(imp.scores)
