## read in text file
hpc <- read.table('./household_power_consumption.txt', header=T, sep =";", na.strings = "?")

## covert dates
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subset data on specified dates
hpc <- hpc[which(hpc$Date == "2007-02-02" | hpc$Date == "2007-02-01"),]

## convert date/time variables
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

## create plot 3 
plot(hpc$DateTime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c('black', 'red', 'blue'), cex=0.8)

## create PNG file of plot 3
dev.copy(png, file="plot3.png", width=628, height=529)
dev.off() 
