# Read in the necessary data

temp <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
temp1 <- temp[which(temp$Date=="1/2/2007"|temp$Date=="2/2/2007"),]
datetime <- as.POSIXlt(paste(temp1$Date, temp1$Time), format="%d/%m/%Y %H:%M:%S")
maindata <- cbind(datetime,temp1)

# Create the plot

png(filename="plot2.png",width=480,height=480,units="px",bg="white")

plot(maindata$datetime,maindata$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(maindata$datetime,maindata$Global_active_power)

dev.off()