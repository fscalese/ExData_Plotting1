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
#plot1
png(filename="plot1.png")
hist(newData$Global_active_power, col="red",
        main="Global Active Power",
        xlab="Global Active Power (kilowatts)")
dev.off()

