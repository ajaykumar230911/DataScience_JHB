hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subsetdata <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Datetime <- as.POSIXct(datetime)
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
with(subsetdata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()