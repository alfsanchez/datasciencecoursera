This CODEBOOK is divided into three parts. The first provides the variables and the corresponding descriptions. The second describes the datasets used. The thirs briefly discusses the steps taken to arrive at the tidy dataset.


VARIABLES:

The variables below are the final ones seen in the dataset. The numbers on the first column show the order by which the variable appears in the original "X" data file. The first two variables both have the number 0 in the first column since those were not part of the "X" data file, but rather, of the "Y" and "Subject" data file.
The second column shows the field names as they appear in the features.txt file provided. The third column provides the recoded variables that reflect a more descriptive name for each field. The nomenclature follows the following convention: << whether time or frequency domain >>_<< gravitational or body motion sensory component >>_<< statistic measured >>_<< axis label, if applicable >>.

The subject number ranges from 1-30 denoting the assigned ID to each of the volunteers.

The Activity variable follows the succeeding recoding as stated in the activity_labels.txt file.

As stated also in the documentation of the raw data files, all the other variables are normalized measures ranging from -1.00 to 1.00.

BElow is the complete list of variables retained:

	0	Subject_number			SubjectNum
	0	Activity			Activity
	1	tBodyAcc-mean()-X		time_bodyacc_mean_X
	2	tBodyAcc-mean()-Y		time_bodyacc_mean_Y
	3	tBodyAcc-mean()-Z		time_bodyacc_mean_Z
	4	tBodyAcc-std()-X		time_bodyacc_std_X
	5	tBodyAcc-std()-Y		time_bodyacc_std_Y
	6	tBodyAcc-std()-Z		time_bodyacc_std_Z
	41	tGravityAcc-mean()-X		time_gravityacc_mean_X
	42	tGravityAcc-mean()-Y		time_gravityacc_mean_Y
	43	tGravityAcc-mean()-Z		time_gravityacc_mean_Z
	44	tGravityAcc-std()-X		time_gravityacc_std_X
	45	tGravityAcc-std()-Y		time_gravityacc_std_Y
	46	tGravityAcc-std()-Z		time_gravityacc_std_Z
	81	tBodyAccJerk-mean()-X		time_bodyaccjerk_mean_X
	82	tBodyAccJerk-mean()-Y		time_bodyaccjerk_mean_Y
	83	tBodyAccJerk-mean()-Z		time_bodyaccjerk_mean_Z
	84	tBodyAccJerk-std()-X		time_bodyaccjerk_std_X
	85	tBodyAccJerk-std()-Y		time_bodyaccjerk_std_Y
	86	tBodyAccJerk-std()-Z		time_bodyaccjerk_std_Z
	121	tBodyGyro-mean()-X		time_bodygyro_mean_X
	122	tBodyGyro-mean()-Y		time_bodygyro_mean_Y
	123	tBodyGyro-mean()-Z		time_bodygyro_mean_Z
	124	tBodyGyro-std()-X		time_bodygyro_std_X
	125	tBodyGyro-std()-Y		time_bodygyro_std_Y
	126	tBodyGyro-std()-Z		time_bodygyro_std_Z
	161	tBodyGyroJerk-mean()-X		time_bodygyrojerk_mean_X
	162	tBodyGyroJerk-mean()-Y		time_bodygyrojerk_mean_Y
	163	tBodyGyroJerk-mean()-Z		time_bodygyrojerk_mean_Z
	164	tBodyGyroJerk-std()-X		time_bodygyrojerk_std_X
	165	tBodyGyroJerk-std()-Y		time_bodygyrojerk_std_Y
	166	tBodyGyroJerk-std()-Z		time_bodygyrojerk_std_Z
	201	tBodyAccMag-mean()		time_bodyaccmag_mean
	202	tBodyAccMag-std()		time_bodyaccmag_std
	214	tGravityAccMag-mean()		time_gravityaccmag_mean
	215	tGravityAccMag-std()		time_gravityaccmag_std
	227	tBodyAccJerkMag-mean()		time_bodyaccjerkmag_mean
	228	tBodyAccJerkMag-std()		time_bodyaccjerkmag_std
	240	tBodyGyroMag-mean()		time_bodygyromag_mean
	241	tBodyGyroMag-std()		time_bodygyromag_std
	253	tBodyGyroJerkMag-mean()		time_bodygyrojerkmag_mean
	254	tBodyGyroJerkMag-std()		time_bodygyrojerkmag_std
	266	fBodyAcc-mean()-X		freq_bodyacc_mean_X
	267	fBodyAcc-mean()-Y		freq_bodyacc_mean_Y
	268	fBodyAcc-mean()-Z		freq_bodyacc_mean_Z
	269	fBodyAcc-std()-X		freq_bodyacc_std_X
	270	fBodyAcc-std()-Y		freq_bodyacc_std_Y
	271	fBodyAcc-std()-Z		freq_bodyacc_std_Z
	345	fBodyAccJerk-mean()-X		freq_bodyaccjerk_mean_X
	346	fBodyAccJerk-mean()-Y		freq_bodyaccjerk_mean_Y
	347	fBodyAccJerk-mean()-Z		freq_bodyaccjerk_mean_Z
	348	fBodyAccJerk-std()-X		freq_bodyaccjerk_std_X
	349	fBodyAccJerk-std()-Y		freq_bodyaccjerk_std_Y
	350	fBodyAccJerk-std()-Z		freq_bodyaccjerk_std_Z
	424	fBodyGyro-mean()-X		freq_bodygyro_mean_X
	425	fBodyGyro-mean()-Y		freq_bodygyro_mean_Y
	426	fBodyGyro-mean()-Z		freq_bodygyro_mean_Z
	427	fBodyGyro-std()-X		freq_bodygyro_std_X
	428	fBodyGyro-std()-Y		freq_bodygyro_std_Y
	429	fBodyGyro-std()-Z		freq_bodygyro_std_Z
	503	fBodyAccMag-mean()		freq_bodyaccmag_mean
	504	fBodyAccMag-std()		freq_bodyaccmag_std
	516	fBodyBodyAccJerkMag-mean()	freq_bodyaccjerkmag_mean
	517	fBodyBodyAccJerkMag-std()	freq_bodyaccjerkmag_std
	529	fBodyBodyGyroMag-mean()		freq_bodygyromag_mean
	530	fBodyBodyGyroMag-std()		freq_bodygyromag_std
	542	fBodyBodyGyroJerkMag-mean()	freq_bodygyrojerkmag_mean
	543	fBodyBodyGyroJerkMag-std()	freq_bodygyrojerkmag_std



DATASETS:

The datasets used were as follows:
	
	X train		-> contains the normalized measurements for the training sample
	Y train		-> activities list for the training sample
	Subject train	-> list of subject numbers for the training sample
	X test		-> contains the normalized measurements for the test sample
	Y test		-> activities list for the test sample
	Subject test	-> list of subject numbers for the test sample



KEY CLEANING STEPS:

	1. Merged the training and test samples for each of the available datafiles.
	2. Limited the measures to mean and standard deviation statistics as instructed in the course project.
	3. Merged the subject and activity information with the metrics data frame.
	4. Recoded the activities to assign the corresponding labels for easier interpretation.
	5. Used the variable listing above to update the field names with the more descriptive titles.
	6. Aggregated the dataset by Subject Number and Activity to create the final necessary datafile named summarydata.txt.

REMARK: Comments are also available in the code for easy reference.