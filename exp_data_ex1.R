## Packages
library(datasets)
library(dplyr)

## Reading in data set and setting up 
mydata <- read.table("C:/Users/Priyanka/Desktop/Coursera/household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F,na.strings = "?")
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$DateTime <- paste(mydata$Date,mydata$Time, sep = " ")
subdata<- mydata[mydata$Date == "2007-02-01",]
subdata2<- mydata[mydata$Date == "2007-02-01",]
fdata <- rbind(subdata,subdata2)
fdata$DateTime <- strptime(fdata$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Plot 1
png("plot1.png", width=480, height=480)
plot1 <- hist(x = subdata$Global_active_power,freq = T, col = "red", border = "black", xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", main = "Global Active Power")
dev.off()

## Plot 2 
png("plot2.png", width=480, height=480)
Plot2 <- plot(x = fdata$DateTime, y = fdata$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()

## Plot 3 
png("plot3.png", width=480, height=480)
plot3 <- with (fdata, plot(x = fdata$DateTime, y = fdata$Sub_metering_1,col = "black", type = "l",ylab = "Energy sub metering"))
plot3 <- with(fdata,points(DateTime,Sub_metering_2, col = "red" ,type = "l" ))
plot3 <- with(fdata,points(DateTime,Sub_metering_3, col = "blue", type = "l" ))
plot3 <- legend("topright", lty = c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

## Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(fdata, {
  plot(DateTime, Global_active_power, type = "l",ylab = "Global Active Power",xlab = "")
  plot(DateTime, Voltage, type = "l",ylab = "Voltage", xlab = "datetime")
  plot(DateTime, Global_reactive_power, type = "l",ylab = "Global_reactive_power", xlab = "datetime")
})
dev.off()