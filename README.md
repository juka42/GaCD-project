# GaCD-project

GaCD just stands for Getting and Cleaning data.
This project is my submission for the John Hopkin's Getting and Cleaning Data final project, from Coursera.
The objective is to gather and organize the data collected in the "Human Activity Recognition Using Smartphones Data Set " research, building a tidy data set, ready for analisys.

- It gets data from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- wich full description is avaliable in http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
As the data are split in more than one file, the code is divided in 10 steps:

1) Downloading files
2) reading labels
3) reading train and test files
4) read column names
5) reading train files
6) reading test file
7) reading train and test activities
8) merging all train data and all test data
9) merging train and test data
10) creating an independent data set with the average of each variable for each activity and each subject.
