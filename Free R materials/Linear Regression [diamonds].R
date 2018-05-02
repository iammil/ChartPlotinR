#### LINEAR REGRESSION ####

# load data
require(ggplot2)
data(diamonds)

# review data set
require(dplyr)
glimpse(diamonds)

# split data
set.seed(101)
sample <- sample.split(diamonds$price, SplitRatio = 0.70)
train <- subset(diamonds, sample == TRUE)
test <- subset(diamonds, sample == FALSE)

# training
lm.model <- lm(price ~ . , data = train)
summary(lm.model)

# in-sample-error (RMSE)
rmse1 <- sqrt(mean(lm.model$residuals^2))

# out-of-sample error
p <- predict(lm.model, test)
rmse2 <- sqrt(mean((p-test$price)^2))

# compare in-sample vs. out-of-sample error
print(c(rmse1, rmse2))

## NOTE ##
## RMSE is the absolute measure that we use to estimate error (performance) of the train & test models. Ideally, in-sample vs. out-of-sample errors should be comparable 