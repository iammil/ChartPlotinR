#### K-MEANS (unsupervised learning) ####
## we use k-means to find meaningful clusters in our dataset ##

## install.packages("ISLR")
require(ISLR)

## load data
data(iris)
head(iris)

## visualize data
library(ggplot2)
ggplot(iris, 
       aes(Petal.Length, Petal.Width)) + 
    geom_point(aes(color = Species), 
               size = 5, 
               alpha = 0.4) + 
    theme_bw()

## fit K-MEANS with our data

set.seed(101)
irisCluster <- kmeans(iris[,1:4], centers = 3, nstart = 20)
print(irisCluster)

## visualize k-means
library(cluster)
clusplot(iris, irisCluster$cluster, color = TRUE, shade = TRUE)

## compare clusters with the answers (iris$Species)
## see confusion matrix
table(iris$Species, irisCluster$cluster)

## is our model accurate? it seems our k-means model slightly confuse virginica and setosa