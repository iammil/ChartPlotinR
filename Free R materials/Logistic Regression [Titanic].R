#### LOGISTIC REGRESSION ####

## we will predict a Rock or Mine based on sonar signal

## load data
df <- read.csv("Free R materials/titanic full data.csv")

## review data set
require(dplyr)
glimpse(df)


## check missing value
any(is.na(df))
cleandf <- na.omit(df)

cleandf[cleandf$Survived != "", ] ##delete blank value

## split data
require(caTools)
titanic.sample <- sample.split(cleandf$Survived, SplitRatio = 0.80)
titanic.train <- subset(cleandf, titanic.sample == TRUE)
titanic.test <- subset(cleandf, titanic.sample == FALSE)

## train
logistic.model <- glm(Survived ~., data = titanic.train, family = binomial(link = "logit"))
logistic.model # see the confusion matrix, compute accuracy
predict.train <- predict(logistic.model, titanic.train, type = "response")

# predict (TRUE = MINE) (FALSE = ROCK) see confusion matrix
table(titanic.train$Survived, predict.train > 0.5) 

## test

predict.test <- predict(logistic.model, titanic.test, type = "response")
table(titanic.test$Survived, predict.test > 0.5)


## last step compare in-sample vs. out-of-sample (accuracy or error)
