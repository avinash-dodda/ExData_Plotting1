#load data

data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".",na.strings="?",colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

#subset by dates
sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot 1

png("plot1.png", width=480, height=480)


hist(sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
