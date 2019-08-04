#load data

data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset by dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# edit date and time
sub$DateTime <- as.POSIXct(strptime(paste(sub$Date, sub$Time),"%d/%m/%Y %H:%M:%S"))


# Plot 2
png("plot2.png", width=480, height=480)
plot(x = sub$DateTime
     , y = sub$Global_active_power
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
