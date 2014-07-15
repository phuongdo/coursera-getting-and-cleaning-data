
#install.packages("reshape2")
library(reshape2)

#run_analysis.R
# you should download the data first.



#1. Merges the training and the test sets to create one data set.

message("loading test set...")

# read data test

data_test <- read.table("~/data/UCI HAR Dataset/test/X_test.txt", quote="\"")

message("loading train set...")

# read data train

data_train<-read.table("~/data/UCI HAR Dataset/train/X_train.txt", quote="\"")

# merging

total <- rbind(data_test, data_train)

#2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# read header
features <- read.table("~/data/UCI HAR Dataset/features.txt", quote="\"")
#It is up to you to make a decision and explain what you did to the data.
#Make it easy for people to give you marks by explaining your reasoning.

#Extracting...
message("Extracting...")
names(total)<-features[,2]
pos<-grep("(mean|std)\\(",features[,2])

total<-total[,pos]

#3.Uses descriptive activity names to name the activities in the data set
message("describle activity name...")

activies_test <- read.table("~/data/UCI HAR Dataset/test/y_test.txt", quote="\"")
names(activies_test)<-"activity"
persons_test <- read.table("~/data/UCI HAR Dataset/test/subject_test.txt", quote="\"")
names(persons_test)<-"person.ID"
data_test<-cbind(data_test,persons_test,activies_test)


data_train <- read.table("~/data/UCI HAR Dataset/train/X_train.txt", quote="\"")
activies_train <- read.table("~/data/UCI HAR Dataset/train/y_train.txt", quote="\"")
names(activies_train)<-"activity"
persons_train <- read.table("~/data/UCI HAR Dataset/train/subject_train.txt", quote="\"")
names(persons_train)<-"person.ID"


activies <- rbind(activies_test, activies_train)
persons<-rbind(persons_test,persons_train)


labels <- read.table("~/data/UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(labels)) {
  code <- as.numeric(labels[i, 1])
  name <- as.character(labels[i, 2])
  activies[activies$activity == code, ] <- name
}



#4.Appropriately labels the data set with descriptive variable names. 

all_data <- cbind(activies,persons, total)

#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataMelt<-melt(all_data,id=c("person.ID","activity"))

averages <- dcast(dataMelt, person.ID+ activity~variable,mean)

# write tiny dataset
message("write data...")
write.csv(averages, file='tidy_data.txt', row.names=FALSE)
