#load data

data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset by dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# edit date and time
sub$DateTime <- as.POSIXct(strptime(paste(sub$Date, sub$Time),"%d/%m/%Y %H:%M:%S"))


# Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(x = sub$DateTime
     , y = sub$Global_active_power
     , type="l", xlab="", ylab="Global Active Power")

plot(x = sub$DateTime
     , y = sub$Voltage
     , type="l", xlab="datetime", ylab="Voltage")

plot(sub$DateTime, sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub$DateTime, sub$Sub_metering_2,col="red")
lines(sub$DateTime, sub$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "), lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(sub$DateTime, sub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
