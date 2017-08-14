hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
subsetdata <- subset(hpc, Date %in% c("1/2/2007","2/2/2007"))
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()