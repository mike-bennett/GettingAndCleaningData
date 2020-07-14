library(tidyverse)
options(digits = 7)

## Read in X test, train data and bind rows
train_x <- read_delim("Data/train/X_train.txt", delim = " ", col_names = FALSE)
test_x <- read_delim("Data/test/X_test.txt", delim = " ", col_names = FALSE)
x_data <- rbind(train_x, test_x)


## Read in Y test, train data and bind rows
train_y <- read_delim("Data/train/Y_train.txt", delim = " ", col_names = FALSE)
test_y <- read_delim("Data/test/Y_test.txt", delim = " ", col_names = FALSE)
y_data <- rbind(train_y, test_y)
names(y_data) <- "Y"

## Read in test and train subject data, bind rows
test_subjects <- read_delim("Data/test/subject_test.txt", delim = " ", col_names = FALSE)
train_subjects <- read_delim("Data/train/subject_train.txt", delim = " ", col_names = FALSE)
subjects <- rbind(train_subjects, test_subjects)

## Read in features and activity data
features <- read_delim("Data/features.txt", delim = " ", col_names = FALSE)
features_keep <- features$X2[grepl("mean\\(\\)|std", features$X2)] ## Keeping mean, std features

activity <- read_delim("Data/activity_labels.txt", delim = " ", col_names = FALSE)


## Bind subject with x and y data
data <- cbind(subjects, x_data, y_data)

# Merge with activity data
data <- merge(data, activity, by.x = "Y", by.y = "X1")

# Rename columns and select only relevant columns
names(data) <- c("activityID", "subjectID", features$X2, "activity")
data <- data[c("subjectID", "activityID", "activity", features_keep)]

# Make column names more readable
names(data) <- names(data) %>% 
    str_replace_all("-|\\(\\)", "") %>% 
    str_replace("mean", "Mean") %>% 
    str_replace("std", "Std") %>% 
    str_replace("^t", "time") %>% 
    str_replace("^f", "freq")

# Convert character vectors (not activity) to numeric
final_data <- data %>% 
    mutate_at(4:69, as.numeric, digits = 10)

## Calculate mean of each variable for every combination of activity and subject
data_summary <- as_tibble(final_data) %>% 
    group_by(activity, subjectID) %>% 
    summarize_at(vars(timeBodyAccMeanX:freqBodyBodyGyroJerkMagMean), mean)

## Write data_summary to file
write.table(data_summary, "data_summary.txt", row.names = FALSE)
