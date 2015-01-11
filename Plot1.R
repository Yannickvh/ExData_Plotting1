## Reading the Power Consumption File
Power <- read.csv("household_power_consumption.txt",, header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))
## Formatting the dates
Power$Date = as.Date(Power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
## Subset Power consumption ranging from 01/02/2007 till 02/02/2007
Power = Power[Power$Date >= startDate & Power$Date <= endDate, ]
## Generating plot
png(filename="plot1.png", width=480, height=480)
hist(Power$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()