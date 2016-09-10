# Project Submission
# Code by: João Fernando Serrjordia Rocha de Mello
# date: 10-sebtember-2016

# full file descriptions:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

install.packages("readr")
library("readr")

######################
# 1) Downloading files
getwd()
dir()
setwd("/Users/juka42/Desktop/rwd")
temp <- tempfile()
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL,temp)
unzip(DestFile,exdir="./")
unlink(temp)

####################
## 2) reading labels
file<-"./UCI HAR Dataset/activity_labels.txt"
activity.labels<-read.fwf(file, c(1,18),col.names=c("y","activity_label"))
#checking results
#activity.labels

## 3) reading train and test files
file<-"./UCI HAR Dataset/train/subject_train.txt"
sub.train<-read.fwf(file,c(2),col.names="subject")
file<-"./UCI HAR Dataset/test/subject_test.txt"
sub.test<-read.fwf(file,c(2),col.names="subject")

#checking 
#head(sub.train)
#dim(sub.train); dim(sub.test)
#table(sub.train$subject); table(sub.test$subject)

#4) read column names
features.file<-"./UCI HAR Dataset/features.txt"
features<-read.table(file=features.file,sep=" ",header=FALSE)

#5) reading train file
#5.1) reading train file
file<-"./UCI HAR Dataset/train/X_train.txt"
X.train <- read_fwf(file=file,skip=0,fwf_widths(rep(16,561)))
colnames(X.train)<-features[,2]
#checking results
#dim(X.train)

# 5.2) keepping only means and standard deviations
X.train.means<-X.train[,grep("mean\\(\\)|std\\(\\)",features[,2])]
dim(X.train.means)
new.names<-tolower(colnames(X.train.means))
new.names<-gsub("\\(\\)-|\\.|-",".",new.names)
new.names<-gsub("\\(\\)","",new.names)
colnames(X.train.means)<-new.names

#6) reading test file
#6.1) reading test file
file<-"./UCI HAR Dataset/test/X_test.txt"
X.test <- read_fwf(file=file,skip=0,fwf_widths(rep(16,561)))
colnames(X.test)<-features[,2]
#checking results
#dim(X.test)

#6.2) keeping only means and stds
X.test.means<-X.test[,grep("mean\\(\\)|std\\(\\)",features[,2])]
colnames(X.test.means)<-new.names
#checking results
#dim(X.test.means)

#7) reading train and test activities
file<-"./UCI HAR Dataset/train/y_train.txt"
y.train<-read.fwf(file,c(15),col.names="y")
file<-"./UCI HAR Dataset/test/y_test.txt"
y.test<-read.fwf(file,c(15),col.names="y")

#checking results
#head(y.train); head(y.test)
#dim(y.train); dim(y.test)
#table(y.train); table(y.test)

#8) merging data
# 8.1) merging train data
y.labels.train<-data.frame(merge(y.train,activity.labels,by="y")[,2])
colnames(y.labels.train)<-"y.labels"
head(y.labels.train)
train.data<-cbind(sub.train,X.train.means,y.labels.train)
train.data$group<-rep("train",7352)

#8.2) merging test data
y.labels.test<-data.frame(merge(y.test,activity.labels,by="y")[,2])
colnames(y.labels.test)<-"y.labels"
test.data<-cbind(sub.test,X.test.means,y.labels.test)
test.data$group<-rep("test",2947)
#checking results
#dim(train.data);dim(test.data); class(train.data); class(test.data)
#sum(colnames(train.data)==colnames(test.data))

#9) mergig train and test
data<-rbind(train.data,test.data)
write.table(data,"./data.txt",row.name=FALSE)

#10) creating an independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
grp<-paste(data$subject,data$y.labels)

# 10.1 combining subject and activity
#table(data$subject,data$y.labels)
data.tmp<-cbind(grp,data)
data.tmp<-data.tmp[ , -which(names(data.tmp) %in% c("subject","y.labels","group"))]

# #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#10.2 summarise data by subject and activity
data.subject<-data.tmp %>% group_by(grp) %>% summarise_each(funs(mean))
#head(data.subject)

# 10.3 splitting back grp into subject and activity
subject<-sapply(strsplit(as.character(data.subject$grp), " "), "[[", 1)
activity<-sapply(strsplit(as.character(data.subject$grp), " "), "[[", 3)

# 10.4 creating tidy data (excluding redundant variables)
data.subject<-cbind(subject,activity,data.subject[ , -which(names(data.subject) %in% c("grp"))])
write.table(data.subject,"./data.subject.txt",row.name=FALSE)
#checking results
#head(data.subject)
#dim(data.subject)
