data <- read.table("household_power_consumption.txt", header=T, sep=';', stringsAsFactors=F)
data[data=='?'] <- NA
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data <- data[data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
data[,3:9] <- sapply(data[,3:9], as.numeric)

png("plot1.png")
with(data, hist(Global_active_power, col='orangered3', main='Global Active Power',
                xlab='Global Active Power (kilowatts)'))
dev.off()