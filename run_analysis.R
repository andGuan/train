x_train <- read.table("~/test/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/test/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("~/test/UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("~/test/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/test/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("~/test/UCI HAR Dataset/test/subject_test.txt")

features <- read.table("~/test/UCI HAR Dataset/features.txt")
activity_labels <- read.table("~/test/UCI HAR Dataset/activity_labels.txt")

x_merged <- rbind(x_train, x_test)
y_merged <- rbind(y_train, y_test)
subject_merged <- rbind(subject_train, subject_test)

mean_std_indices <- grep("-(mean|std)\\(\\)", features[, 2])
x_merged <- x_merged[, mean_std_indices]
names(x_merged) <- features[mean_std_indices, 2]

y_merged[, 1] <- activity_labels[y_merged[, 1], 2]
names(y_merged) <- "activity"

names(subject_merged) <- "subject"
full_data <- cbind(subject_merged, y_merged, x_merged)

library(dplyr)
tidy_data <- full_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)