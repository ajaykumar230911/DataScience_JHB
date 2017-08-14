hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subsetdata <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subsetdata$Date), subsetdata$Time)
subsetdata$Datetime <- as.POSIXct(datetime)
##dev.copy(png, file="plot2.png", height=480, width=480)
## Plot 2
png("plot2.png", width=480, height=480)
with(subsetdata, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})
dev.off()