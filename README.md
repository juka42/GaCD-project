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


#codebook
The features selected for the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. For details see complete description.

The variables are signals stored from the accelerometer of a Samsung Galaxy S2, and 
these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The data has 40 observations and 68 columns. Each observation is a unique combination of subject and activity. And the variables are the average of the originaly measured means and standard deviations of each combination of subject and activity.

The complete list of variables is found bellow

"subject"                   
"activity"                  
"tbodyacc.mean.x"          
"tbodyacc.mean.y"           
"tbodyacc.mean.z"           
"tbodyacc.std.x"           
"tbodyacc.std.y"            
"tbodyacc.std.z"            
"tgravityacc.mean.x"       
"tgravityacc.mean.y"        
"tgravityacc.mean.z"        
"tgravityacc.std.x"        
"tgravityacc.std.y"         
"tgravityacc.std.z"         
"tbodyaccjerk.mean.x"      
"tbodyaccjerk.mean.y"       
"tbodyaccjerk.mean.z"       
"tbodyaccjerk.std.x"       
 "tbodyaccjerk.std.y"        
"tbodyaccjerk.std.z"        
"tbodygyro.mean.x"         
 "tbodygyro.mean.y"          
"tbodygyro.mean.z"          
"tbodygyro.std.x"          
"tbodygyro.std.y"           
"tbodygyro.std.z"           
"tbodygyrojerk.mean.x"     
"tbodygyrojerk.mean.y"      
"tbodygyrojerk.mean.z"      
"tbodygyrojerk.std.x"      
"tbodygyrojerk.std.y"       
"tbodygyrojerk.std.z"       
"tbodyaccmag.mean"         
"tbodyaccmag.std"           
"tgravityaccmag.mean"       
"tgravityaccmag.std"       
"tbodyaccjerkmag.mean"      
"tbodyaccjerkmag.std"       
"tbodygyromag.mean"        
"tbodygyromag.std"          
"tbodygyrojerkmag.mean"     
"tbodygyrojerkmag.std"     
"fbodyacc.mean.x"           
"fbodyacc.mean.y"           
"fbodyacc.mean.z"          
"fbodyacc.std.x"            
"fbodyacc.std.y"            
"fbodyacc.std.z"           
"fbodyaccjerk.mean.x"  
"fbodyaccjerk.mean.y"       
"fbodyaccjerk.mean.z"      
"fbodyaccjerk.std.x"        
"fbodyaccjerk.std.y"        
"fbodyaccjerk.std.z"       
"fbodygyro.mean.x"          
"fbodygyro.mean.y"          
"fbodygyro.mean.z"         
"fbodygyro.std.x"           
"fbodygyro.std.y"          
"fbodygyro.std.z"          
"fbodyaccmag.mean"          
"fbodyaccmag.std"          
"fbodybodyaccjerkmag.mean" 
"fbodybodyaccjerkmag.std"   
"fbodybodygyromag.mean"    
"fbodybodygyromag.std"     
"fbodybodygyrojerkmag.mean" 
"fbodybodygyrojerkmag.std" 
