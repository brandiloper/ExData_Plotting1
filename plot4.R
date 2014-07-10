## read in text file
hpc <- read.table('./household_power_consumption.txt', header=T, sep =";", na.strings = "?")

## covert dates
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subset data on specified dates
hpc <- hpc[which(hpc$Date == "2007-02-02" | hpc$Date == "2007-02-01"),]

## convert date/time variables
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

## create plot 4
par(mfrow = c(2, 2))
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), cex=0.8, bty="n")

plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


## create PNG file for plot 4 
dev.copy(png, file="plot4.png", width=628, height=529)
dev.off() 
