rm(list=ls())
setwd("C:/Users/loueh/Desktop/exploratory data analysis")
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
names(data)

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
Sub_metering1<-as.numeric(subSetData$Sub_metering_1)
Sub_metering2<-as.numeric(subSetData$Sub_metering_2)
Sub_metering3<-as.numeric(subSetData$Sub_metering_3)
voltage<-as.numeric(subSetData$Voltage)
GlobalReactivePower<-as.numeric(subSetData$Global_reactive_power)

#Creates new column that combines date and time data 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plotting
png("plot4.png",width = 480,height=480)

#set empty frame
par(mfrow=c(2,2))

#first plot
plot(datetime,globalActivePower, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")

#second plot
plot(datetime,voltage, type = "l", xlab="", ylab = "Voltage")

#third plot
plot(datetime,Sub_metering1,type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime,Sub_metering2,type="l", col ="red")
lines(datetime,Sub_metering3,type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#fourth plot
plot(datetime,GlobalReactivePower,type="l", xlab="",ylab = "Global Reactive Power")

#closing
dev.off()
