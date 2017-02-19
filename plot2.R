rm(list=ls())
setwd("C:/Users/loueh/Desktop/exploratory data analysis")
dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
names(data)
head(data)
#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)


#Creates new column that combines date and time data 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
