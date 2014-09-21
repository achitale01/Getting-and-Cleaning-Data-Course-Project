# Getting and Cleaning Data- Course Project CodeBook

## Data Sources
The data set for this project can be obtained at the following URL: 
[UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Prerequisites for the run_analysis.R script:
* the UCI HAR Dataset must be downloaded and extracted
* the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

Refer to the README.txt and features_info.txt files in the UCI HAR Dataset directory for details on the contents of the data set.

## run_analysis.R
The script does the following:
* Read the data sets, labels and subjects for training and testing
* Merge the two x\_, y\_ and subject data sets together for training and testing
* Identify and select only the columns that have mean or standard deviation data
* Add descriptive activity names
* Bind the x\_, y\_ and subjects into one single data set
* compute the mean values
* Write a Tidy\_UCI\_HAR.txt data file with the header and data

### Variables
* **x\_train, y\_train, subject\_train** are the raw training data sets
* **x\_test, y\_test, subject\_test** are the raw testing data sets
* **x\_merge** merges the x\_train and x\_test data
* **y\_merge** merges the y\_train and y\_test data
* **subject\_merge** merges the subject\_train and subject\_test data
* **merged\_data** is a list of the three merged data sets
* **features** is the raw feature names data
* **mean\_std\_features** identifies (TRUE/FALSE) the features that have mean or std (standard deviation) in their names
* **all\_data** takes all the merged lists and creates a single data frame
* **tidy\_data** is the data frame with the mean function applied to the all\_data data frame

### Output
**Tidy\_UCI\_HAR.txt** is the output data file created with write.table\(\) in the same directory as the run_analysis.R script