## Reading the Power Consumption File
Power <- read.csv("household_power_consumption.txt",, header=T,
                  sep=";", stringsAsFactors=F, na.strings="?",
                  colClasses=c("character", "character", "numeric",
                               "numeric", "numeric", "numeric",
                               "numeric", "numeric", "numeric"))
## Formatting the dates
Power$timestamp = strptime(paste(Power$Date, Power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
## Subset Power consumption ranging from 01/02/2007 till 02/02/2007
Power = Power[Power$timestamp >= startDate & Power$timestamp <= endDate, ]
## Generating plot
png(filename="plot2.png", width=480, height=480, units = "px", bg = "transparent")
plot(Power$timestamp, Power$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()