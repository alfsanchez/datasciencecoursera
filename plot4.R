# Read in the necessary data

temp <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
temp1 <- temp[which(temp$Date=="1/2/2007"|temp$Date=="2/2/2007"),]
datetime <- as.POSIXlt(paste(temp1$Date, temp1$Time), format="%d/%m/%Y %H:%M:%S")
maindata <- cbind(datetime,temp1)

# Create the plot

png(filename="plot4.png",width=480,height=480,units="px",bg="white")

par(mfrow=c(2,2))

plot(maindata$datetime,maindata$Global_active_power,type="n",xlab="",ylab="Global Active Power")
lines(maindata$datetime,maindata$Global_active_power)

plot(maindata$datetime,maindata$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(maindata$datetime,maindata$Voltage)

plot(maindata$datetime,maindata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(maindata$datetime,maindata$Sub_metering_1)
lines(maindata$datetime,maindata$Sub_metering_2,col="Red")
lines(maindata$datetime,maindata$Sub_metering_3,col="Blue")
legend("topright",lty=c(1,1,1),lwd=c(1,1,1),col=c("Black","Red","Blue"),bty="n",x.intersp=0,y.intersp=1,legend=c(" Sub_metering_1"," Sub_metering_2"," Sub_metering_3"))

plot(maindata$datetime,maindata$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(maindata$datetime,maindata$Global_reactive_power)

dev.off()