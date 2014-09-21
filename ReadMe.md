# Getting and Cleaning Data- Course Project

## Introduction
This repository contains my project submissions for the Coursera: Getting and Cleaning Data course project.

## Course Project Information
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Raw data
The raw data is provided as multiple files for training and test data. The data set included
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

## Script and Tidy data
I've created an R script called run_analysis.R. Prerequisites for this script:
* the UCI HAR Dataset must be downloaded and extracted
* the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

The script merges the training and test data sets, retains only the mean and standard deviation for each measurement, adds appropriate labels and then creates a second data tidy set with the mean of each variable from the merged data set.

The CodeBook.md explains the script and the resulting data and variables. 