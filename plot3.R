# Read in the necessary data

temp <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
temp1 <- temp[which(temp$Date=="1/2/2007"|temp$Date=="2/2/2007"),]
datetime <- as.POSIXlt(paste(temp1$Date, temp1$Time), format="%d/%m/%Y %H:%M:%S")
maindata <- cbind(datetime,temp1)

# Create the plot

plot(maindata$datetime,maindata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(maindata$datetime,maindata$Sub_metering_1)
lines(maindata$datetime,maindata$Sub_metering_2,col="Red")
lines(maindata$datetime,maindata$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save plot as a png file

dev.copy(png,file="plot3.png",width=480,height=480,units="px",bg="white")
dev.off()