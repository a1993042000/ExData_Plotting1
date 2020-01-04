data <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data[data=='?'] <- NA
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data <- data[data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
data[,3:9] <- sapply(data[,3:9], as.numeric)

png("plot2.png")
with(data, plot(Global_active_power,
                type='l', xaxt='n', xlab='', ylab='Global Active Power (kilowatts)'))
tat <- c(which(data$Time=='00:00:00'), nrow(data))
tla <- c('Thu', 'Fri', 'Sat')
axis(1, at=tat, labels=tla)
dev.off()
