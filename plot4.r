# load the data
data <- read.table(file="household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
subset<-data$Date=="1/2/2007" | data$Date == "2/2/2007"
newData<-data[subset,]
x <- paste(newData$Date, newData$Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

#plot4
png(filename="plot4.png")
par(mfrow=c(2,2))

plot(newData$DateTime,newData$Global_active_power,type="l",
     ylab="Global Active Power",
     xlab="")

plot(newData$DateTime,newData$Voltage,type="l",
     ylab="Voltage",
     xlab="datetime")

plot(newData$DateTime,newData$Sub_metering_1,type="l",
     ylab="Energy sub metering",
     xlab="")
lines(newData$DateTime,newData$Sub_metering_2, 
      col="red")
lines(newData$DateTime,newData$Sub_metering_3, 
      col="blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"),
       bty="n",cex=0.6,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(newData$DateTime,newData$Global_reactive_power,type="l",
     ylab="Global_reactive_power",
     xlab="datetime")

dev.off()


