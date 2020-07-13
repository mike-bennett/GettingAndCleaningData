options(digits = 7)

## Read in X test, train data and bind rows
train_x <- read.csv("Data/train/X_train.txt", sep = " ", header = FALSE)
test_x <- read.csv("Data/test/X_test.txt", sep = " ", header = FALSE)
x_data <- rbind(train_x, test_x)

## Read in Y test, train data and bind rows
train_y <- read.csv("Data/train/Y_train.txt", sep = " ", header = FALSE)
test_y <- read.csv("Data/test/Y_test.txt", sep = " ", header = FALSE)
y_data <- rbind(train_y, test_y)
names(y_data) <- "Y"

## Read in test and train subject data, bind rows
test_subjects <- read.csv("Data/test/subject_test.txt", sep = " ", header = FALSE)
train_subjects <- read.csv("Data/train/subject_train.txt", sep = " ", header = FALSE)
subjects <- rbind(train_subjects, test_subjects)

## Read in features and activity data
features <- read.csv("Data/features.txt", sep = " ", header = FALSE)
features_keep <- features$V2[grepl("mean\\(\\)|std", features$V2)] ## Keeping mean, std features

activity <- read.csv("Data/activity_labels.txt", sep = " ", header = FALSE)


## Bind subject with x and y data
data <- cbind(subjects, x_data, y_data)

# Merge with activity data
data <- merge(data, activity, by.x = "Y", by.y = "V1")

# Rename columns and select only relevant columns
names(data) <- c("activityID", "subjectID", features$V2, "activity")
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
data_summary <- final_data %>% 
    group_by(activity, subjectID) %>% 
    summarize_at(vars(timeBodyAccMeanX:freqBodyBodyGyroJerkMagMean), mean)

