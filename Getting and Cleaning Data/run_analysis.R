
## Set column names for the main data

features <- read.table("features.txt", header=FALSE)
colnames <- features[,1]

## Set up the training sample
xtrain <- read.table("X_train.txt", header=FALSE, col.names=colnames)
ytrain <- read.table("y_train.txt", header=FALSE, col.names=c("Activity"))
subjtrain <- read.table("subject_train.txt", header=FALSE, col.names=c("SubjectNum"))

## Set up the test sample
xtest <- read.table("X_test.txt", header=FALSE, col.names=colnames)
ytest <- read.table("Y_test.txt", header=FALSE, col.names=c("Activity"))
subjtest <- read.table("subject_test.txt", header=FALSE, col.names=c("SubjectNum"))

## Prepare to combine data

library(plyr)
xdata_all <- rbind(xtrain,xtest)

	#determine vars to limit the dataset to
	meanvars <- subset(features, grepl("mean()",features[,2],fixed=TRUE))
	stdvars <- subset(features, grepl("std()",features[,2],fixed=TRUE))
	targetvars <- arrange(rbind(meanvars,stdvars),V1)
	targetvars <- mutate(targetvars,newV1=paste("X",V1,sep=""))
	varvector <- targetvars[,3]

xdata <- xdata_all[varvector]

ydata <- rbind(ytrain,ytest)
subjdata <- rbind(subjtrain,subjtest)

## Combine datasets to make the main file

finaldata <- cbind(subjdata,ydata,xdata)

## Recode the activity field
finaldata$Activity[finaldata$Activity==1] <- "WALKING"
finaldata$Activity[finaldata$Activity==2] <- "WALKING UPSTAIRS"
finaldata$Activity[finaldata$Activity==3] <- "WALKING DOWNSTAIRS"
finaldata$Activity[finaldata$Activity==4] <- "SITTING"
finaldata$Activity[finaldata$Activity==5] <- "STANDING"
finaldata$Activity[finaldata$Activity==6] <- "LAYING"

## Get and apply descriptive variable names created in the codebook
newvars <- read.table("codebook.txt", header=FALSE)
newvars <- newvars[,3]
colnames(finaldata) <- newvars
write.table(finaldata, "finaldata.txt", sep="\t", row.name=FALSE)


## Create the final dataset for submission
library(reshape2)
subvars <- newvars[c(-1,-2)]
datamelt <- melt(finaldata,id=c("SubjectNum","Activity"),measure.vars=subvars)
summarydata <- dcast(datamelt, SubjectNum + Activity ~ variable, mean)

## Output data for submission
write.table(summarydata, "summarydata.txt", sep="\t", row.name=FALSE)
