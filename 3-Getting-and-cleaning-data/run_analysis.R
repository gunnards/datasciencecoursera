if (!require("reshape")){
        install.packages("reshape", dependencies=TRUE)
}

library("reshape")

# Read datasets
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt", sep = "")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt", sep = "")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "")

features  <- read.table("UCI HAR Dataset/features.txt", sep="")
features  <- as.vector(t(features[,2]))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", sep="")

# Merge train & test sets + add column names
X_comb <- rbind(X_train, X_test)
colnames(X_comb) <- features

Y_comb <- rbind(Y_train, Y_test)
colnames(Y_comb) <- "Activity"
Y_comb$Activity <- factor(Y_comb$Activity, levels = activities$V1, labels = activities$V2)
        
subject_comb <- rbind(subject_train, subject_test)
colnames(subject_comb) <- "Subject"

# Subset X_comb with only mean and std features
X_sub <- X_comb[, grepl("mean\\(\\)|std\\(\\)", names(X_comb))]

# Combine all
allData <- cbind(subject_comb, Y_comb, X_sub)

# Create tidy data
tidy <- aggregate(allData[,3:68], by= list(Subject=allData$Subject, Activity=allData$Activity), FUN = mean)
write.table(tidy, "tidy.txt")
