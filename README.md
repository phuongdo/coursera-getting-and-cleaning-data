Getting and Cleaning Data - Coursera Homework
=================================


*  run_analysis.R works following step.
*  Merges the training and the test sets to create one data set.
*  Extracts only the measurements on the mean and standard deviation for each measurement.
*  Uses descriptive activity names to name the activities in the data set
*  Appropriately labels the data set with descriptive activity names.
*  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## Dependencies

* Requries reshape2 package.


## Notes

*  Only vaiables containing mean() & std() are used(not meanFreq() or something like theses).

Constructed using the following:

```R
> version
platform       Windown
arch           x86_64
os             Windown 7 x64
R version      3.1.0 x64

```

##  Running

*  Structure
```bash
~/current_directory/
------| ~/current_directory/run_analysis.R
------| ~/current_directory/data/
```

*  Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
  and unzip to the folder ~/current_directory/data/

```bash
$ Rscript run_analysis.R
```

Output:  tidy_data.txt

