## read in text file
hpc <- read.table('./household_power_consumption.txt', header=T, sep =";", na.strings = "?")

## covert dates
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subset data on specified dates
hpc <- hpc[which(hpc$Date == "2007-02-02" | hpc$Date == "2007-02-01"),]

## convert date/time variables
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

## create plot 2 
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## create PNG file of plot 2
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
