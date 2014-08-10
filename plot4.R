###Note: please verfify the workding directory includes the file of household_power_consumption.txt
###Otherwise you can 
###either copy the file to the working directory
###or set the work directorty to the path where the input file resides.

## step 1, read input file, and set the target population
data1<-read.table("household_power_consumption.txt", sep=";" ,colClasses = "character")
data1<-data1[(data1[,1] == "1/2/2007" | data1[,1] == "2/2/2007"),]


## step 2, reformat date, time, global active power
v_colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data1) <-v_colnames

data1$Date <-as.Date(data1$Date, "%d/%m/%Y")
data1$Global_active_power <-as.numeric(data1$Global_active_power)

data1$Time<-paste(data1$Date, data1$Time)
data1$Time<-strptime(data1$Time, "%Y-%m-%d %H:%M:%S")

data1$Sub_metering_1 <-as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 <-as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 <-as.numeric(data1$Sub_metering_3)

data1$Voltage <-as.numeric(data1$Voltage)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

##step 3,  plot
par(mfrow = c(2, 2))
##chart topleft

plot(data1$Time, data1$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatt)")

### chart bottomleft
plot(data1$Time, data1$Voltage, type="l", xlab="datetime", ylab = "voltage")

##chart topright

plot(data1$Time, data1$Sub_metering_1,type="l", xlab="", ylab = "Global Active Power (kilowatt)")
lines(data1$Time, data1$Sub_metering_2, type="l", col="red")
lines(data1$Time, data1$Sub_metering_3, type="l", col="blue")
##set legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lwd=c(1,1,1), lty=c(1,1,1),text.font = 2, col=c("black", "red", "blue"), cex=0.64)



## chart bottom right
plot(data1$Time, data1$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

## print out to device
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()
