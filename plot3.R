data <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data[data=='?'] <- NA
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data <- data[data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
data[,3:9] <- sapply(data[,3:9], as.numeric)

png("plot3.png")
plot(data$Sub_metering_1, type='l', xaxt='n', xlab='', ylab='Energy sub metering')
lines(data$Sub_metering_2, col='red')
lines(data$Sub_metering_3, col='blue')
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c('black', 'red', 'blue'), lty=c(1,1))
tat <- c(which(data$Time=='00:00:00'), nrow(data))
tla <- c('Thu', 'Fri', 'Sat')
axis(1, at=tat, labels=tla)
dev.off()