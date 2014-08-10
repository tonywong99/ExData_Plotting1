###Note: please verfify the workding directory includes the file of household_power_consumption.txt
###Otherwise you can 
###either copy the file to the working directory
###or set the work directorty to the path where the input file resides.


data1<-read.table("household_power_consumption.txt", sep=";" ,colClasses = "character")
data1<-data1[(data1[,1] == "1/2/2007" | data1[,1] == "2/2/2007"),]


v_colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(data1) <-v_colnames

data1$Date <-as.Date(data1$Date, "%d/%m/%Y")
data1$Global_active_power <-as.numeric(data1$Global_active_power)


par(mfrow = c(1, 1))
title <- "Global Active Power"
hist(data1$Global_active_power, main = title, xlab = "Global Active Power (kilowatt)",col="red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()



