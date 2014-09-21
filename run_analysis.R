# Check if data.table package is installed 
if (!require( "data.table")) {
  install.packages( "data.table")
}

# Read train data files
x_train <- read.table( "./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table( "./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table( "./UCI HAR Dataset/train/subject_train.txt")

# Read test data files
x_test <- read.table( "./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table( "./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table( "./UCI HAR Dataset/test/subject_test.txt")

# Merge
x_merge <- rbind( x_train, x_test)
y_merge <- rbind( y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)

# Merge train and test datasets and return
merged_data <- list(x=x_merge, y=y_merge, subject=subject_merge)

# Load feature names
features <- read.table( "./UCI HAR Dataset/features.txt")[,2]
mean_std_features <- grepl( "mean|std", features)

# Extract mean and std features
merged_data$x <- merged_data$x[,mean_std_features]

# Add descriptive names
colnames(merged_data$y) <- "activity"
merged_data$y[merged_data$y == 1] = "WALKING"
merged_data$y[merged_data$y == 2] = "WALKING_UPSTAIRS"
merged_data$y[merged_data$y == 3] = "WALKING_DOWNSTAIRS"
merged_data$y[merged_data$y == 4] = "SITTING"
merged_data$y[merged_data$y == 5] = "STANDING"
merged_data$y[merged_data$y == 6] = "LAYING"

colnames(merged_data$subject) <- c("subject")

# Bind all data together
all_data <- cbind( merged_data$x, merged_data$y, merged_data$subject)
colnames(all_data) <- c(as.character(gsub("[[:punct:]]", "",features[mean_std_features])), "activity", "subject")
colnames(all_data) <- tolower(colnames(all_data))

# Create tiday data set
all_data$activity <- as.factor(all_data$activity)
all_data$subject <- as.factor(all_data$subject)

# Supress NA warnings
options(warn = -1)

# Compute mean
tidy_data <- aggregate( all_data, by=list( activity = all_data$activity, subject=all_data$subject), mean)

# Un-supress warnings
options(warn = 0)

# Remove the last two columns (mean of activity and subject has no meaning)
tidy_data[,ncol(tidy_data)]<- NULL
tidy_data[,ncol(tidy_data)]<- NULL

# Write tidy data file
write.table(tidy_data, "Tidy_UCI_HAR.txt", row.names=FALSE)