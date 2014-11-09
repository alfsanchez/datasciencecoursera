# Read in the necessary data

temp <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
temp1 <- temp[which(temp$Date=="1/2/2007"|temp$Date=="2/2/2007"),]
datetime <- as.POSIXlt(paste(temp1$Date, temp1$Time), format="%d/%m/%Y %H:%M:%S")
maindata <- cbind(datetime,temp1)

# Create the plot

png(filename="plot1.png",width=480,height=480,units="px",bg="white")

hist(maindata$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()