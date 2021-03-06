rm(list=ls())
setwd("C:/Users/loueh/Desktop/exploratory data analysis")
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
names(data)
head(data)

#str(subSetData)
Sub_metering1<-as.numeric(subSetData$Sub_metering_1)
Sub_metering2<-as.numeric(subSetData$Sub_metering_2)
Sub_metering3<-as.numeric(subSetData$Sub_metering_3)

#Creates new column that combines date and time data 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime,Sub_metering1,type = "l", xlab="", ylab = "Energy sub metering")
     lines(datetime,Sub_metering2,type="l", col ="red")
     lines(datetime,Sub_metering3,type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

