# source code working directory
setwd(dirname(sys.frame(1)$ofile))

data <- read.table('Electric_power_consumption.txt', header=TRUE, sep=';')

#gets Feb 1 and 2, 2007 data
data$DateTime <- paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
feb_data <- data[data$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & data$DateTime < strptime("2007-02-03", "%Y-%m-%d"), ]

# create figure with 2 by 2 subplots
par(mfrow = c(2, 2))

# 1st subplot
plot(feb_data$DateTime, as.numeric(as.character(feb_data$Global_active_power)), type='l', ylab='Global Active Power (Kilowatts)', xlab='')
# 2nd subplot
plot(feb_data$DateTime, as.numeric(as.character(feb_data$Voltage)), type='l', ylab='Voltage', xlab='datetime')
# 3rd subplot
plot(feb_data$DateTime, as.numeric(as.character(feb_data$Sub_metering_1)), type='l', ylab='Energy sub metering', xlab='')
lines(feb_data$DateTime, as.numeric(as.character(feb_data$Sub_metering_2)), col='red')
lines(feb_data$DateTime, as.numeric(as.character(feb_data$Sub_metering_3)), col='blue')
legend('topright', c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1, 1, 1), col=c('black', 'red', 'blue'))
# 4th subplot
plot(feb_data$DateTime, as.numeric(as.character(feb_data$Global_reactive_power)), type='l', ylab='Global_reactive_power', xlab='datetime')

# saves plot to plot4.png
dev.copy(png,'plot4.png')
dev.off()