#install.packages('caTools')
#install.packages('class')
require(caTools)
require(class)

## load data IRIS
data(iris)

## normalize data using scale() function
scale.data <- scale(iris[1:4])
final.data <- cbind(scale.data, iris[5])

## split data
sample <- sample.split(final.data$Species, SplitRatio = 0.70)
train <- subset(final.data, sample == TRUE)
test <- subset(final.data, sample == FALSE)

## train
set.seed(101)
fit.model <- knn(train[1:4], test[1:4], train$Species, k = 3)
mean(test$Species != fit.model)

# optimize K by writing for-loop
error <- NULL

for(i in 1:10){
    set.seed(101)
    predict.species <- knn(train[1:4], test[1:4], train$Species, k = i)
    error[i] <- mean(test$Species != predict.species)
}

# plot error (1:10)
error
plot(error, type = "l")