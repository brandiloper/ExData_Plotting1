## read in text file
hpc <- read.table('./household_power_consumption.txt', header=T, sep =";", na.strings = "?")

## covert dates
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

## subset data on specified dates
hpc <- hpc[which(hpc$Date == "2007-02-02" | hpc$Date == "2007-02-01"),]

## convert date/time variables
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")

## create plot 1
hist(hpc$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

## create PNG file of plot 1
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
