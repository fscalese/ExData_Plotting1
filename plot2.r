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

#plot2
png(filename="plot2.png")
plot(newData$DateTime,newData$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
