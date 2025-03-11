Explanation of the code:
Data Download and Unzipping: Checks if a data directory exists. If not, it creates one and then downloads the zip - file containing the project data. After that, it unzips the file.
Reading Data: Reads the training and test data, along with feature names and activity labels from the unzipped directory.
Merging Data: Combines the training and test sets for the feature data (x), activity labels (y), and subject information.
Extracting Mean and Standard Deviation: Uses grep to find the indices of features that contain "mean()" or "std()". Then, extracts only those columns from the merged feature data.
Using Descriptive Activity Names: Replaces the activity IDs in y_merged with their corresponding descriptive names from activity_labels.
Labeling the Data Set: Assigns appropriate names to the columns of subject_merged, y_merged, and x_merged. Then, combines all these data frames into one large data frame full_data.
Creating a Tidy Data Set: Uses the dplyr package to group the full_data by subject and activity and then calculates the mean of all other variables.
Writing the Tidy Data Set: Writes the resulting tidy data set to a text file named tidy_data.txt without row names.
