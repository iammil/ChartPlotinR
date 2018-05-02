#### DECISION TREE ####

## predict survival rate (survived or not survived)

## load data
df <- read.csv("titanic full data.csv")

## review data set
require(dplyr)
glimpse(df)

## any missing value?
any(is.na(df))
cleandf <- na.omit(df)

## split data
require(caTools)
set.seed(500)
sample <- sample.split(cleandf$Survived, SplitRatio = 0.70)
train <- subset(cleandf, sample == TRUE)
test <- subset(cleandf, sample == FALSE)

## train
## minbucket = smaller number mean the model will be more complicated (many nods/ branches)
require(rpart)
myTree <- rpart(Survived ~., data=train, method = "class", minbucket = 10)

## visualize tree
require(rpart.plot)
prp(myTree)

## predict train accuracy
p1 <- predict(myTree, train, type = "class")
paste("Train accuracy =", round(1 - mean(p1 != train$Survived),2))

## test
p2 <- predict(myTree, test, type = "class")
paste("Test accuracy =", round(1 - mean(p2 != test$Survived),2))

## compare in-sample vs. out-of-sample (accuracy/ error)

###########################################################
###########################################################

#### RANDOM FOREST ####

# train
require(randomForest)
set.seed(500)
myRF <- randomForest(Survived ~., data=train, importance = TRUE)
myRF

# test
predictRFtest <- predict(myRF, test)
table(test$Survived, predictRFtest)

###########################################################
###########################################################

# decision tree vs. random forest 
# who is better? 