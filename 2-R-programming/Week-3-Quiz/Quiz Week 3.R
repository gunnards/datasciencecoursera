library(datasets)
data(iris)


# Q1 There will be an object called 'iris' in your workspace. In this dataset, 
# what is the mean of 'Sepal.Length' for the species virginica? 
# (Please only enter the numeric result and nothing else.)

tapply(iris$Sepal.Length, iris$Species, mean)

# Question 2
# Continuing with the 'iris' dataset from the previous Question, what R code 
# returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 
# 'Petal.Length', and 'Petal.Width'?

apply(iris[,1:4], 2, mean)

# Question 3
# How can one calculate the average miles per gallon (mpg) by number of cylinders 
# in the car (cyl)?

data(mtcars)
mtcars

tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)


# Question 4
# Continuing with the 'mtcars' dataset from the previous Question, what is the 
# absolute difference between the average horsepower of 4-cylinder cars and the 
# average horsepower of 8-cylinder cars?

cyl4 <- tapply(mtcars$hp, mtcars$cyl, mean)["4"]
cyl8 <- tapply(mtcars$hp, mtcars$cyl, mean)["8"]
abs(cyl4 - cyl8)
