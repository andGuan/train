Explanation of the code:
Data Download and Unzipping: Checks if a data directory exists. If not, it creates one and then downloads the zip - file containing the project data. After that, it unzips the file.

Reading Data: Reads the training and test data, along with feature names and activity labels from the unzipped directory.

Merging Data: Combines the training and test sets for the feature data (x), activity labels (y), and subject information.

Extracting Mean and Standard Deviation: Uses grep to find the indices of features that contain "mean()" or "std()". Then, extracts only those columns from the merged feature data.

Using Descriptive Activity Names: Replaces the activity IDs in y_merged with their corresponding descriptive names from activity_labels.

Labeling the Data Set: Assigns appropriate names to the columns of subject_merged, y_merged, and x_merged. Then, combines all these data frames into one large data frame full_data.

Creating a Tidy Data Set: Uses the dplyr package to group the full_data by subject and activity and then calculates the mean of all other variables.

Writing the Tidy Data Set: Writes the resulting tidy data set to a text file named tidy_data.txt without row names.


# Code Book for Samsung Data Analysis

## Variables

### 1. `subject`
- **Description**: An identifier for the subject who participated in the experiment. There are 30 subjects in total, numbered from 1 to 30.
- **Unit**: None

### 2. `activity`
- **Description**: The type of activity the subject was performing during the measurement. The activities are:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`
- **Unit**: None

### Other Variables
The remaining variables are the average values of the measurements related to the mean and standard deviation for each activity and each subject. The names of these variables are based on the original feature names in the Samsung data set, with some cleaning and standardization. For example, `tBodyAcc-mean()-X` represents the average of the mean acceleration in the X - axis of the body.

## Data Transformations

1. **Merging**: The training and test data sets were merged into one data set.
2. **Extraction**: Only the measurements related to the mean and standard deviation were extracted.
3. **Labeling**: The activity labels were replaced with descriptive names, and the variable names were made more descriptive.
4. **Averaging**: The average of each variable was calculated for each activity and each subject to create the final tidy data set.
