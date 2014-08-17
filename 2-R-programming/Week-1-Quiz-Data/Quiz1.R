setwd("~/Documents/Github/datasciencecoursera/2-R-programming/Week-1-Quiz-Data")

data <- read.csv('hw1_data.csv')

#Question 11
#In the dataset provided for this Quiz, what are the column names of the dataset?
colnames(data)

# Question 12
# Extract the first 2 rows of the data frame and print them to the console. What does the output look like?
data[1:2,]

# Question 13
# How many observations (i.e. rows) are in this data frame?
noObservations <- nrow(data)
noObservations

# Question 14
# Extract the last 2 rows of the data frame and print them to the console. What does the output look like?
data[(noObservations-1):noObservations,]

tail(data,2) ##The `tail()' function is an easy way to extract the last few elements of an R object.

# Question 15
# What is the value of Ozone in the 47th row?
data[47,'Ozone']

# Question 16
# How many missing values are in the Ozone column of this data frame?
missing <- is.na(data[,'Ozone'])
table(missing)

# Question 17
# What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
mean(data[,'Ozone'][!missing])

# Question 18
# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
complett <- complete.cases(data[,c('Ozone', 'Solar.R', 'Temp')])
dataSub <- data[complett,]
dataSub <- dataSub[dataSub[,'Temp'] > 90,]
dataSub <- dataSub[dataSub[,'Ozone'] > 31,]
mean(dataSub[,'Solar.R'])

# Question 19
# What is the mean of "Temp" when "Month" is equal to 6?
june <- data[data[,'Month'] == 6,]
mean(june[,'Temp'])

# Question 20
# What was the maximum ozone value in the month of May (i.e. Month = 5)?
may <- data[data[,'Month'] == 5,]
may <- may[!is.na(may[,'Ozone']),]
summary(may$Ozone)
