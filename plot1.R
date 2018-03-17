# source code working directory
setwd(dirname(sys.frame(1)$ofile))

data <- read.table('Electric_power_consumption.txt', header=TRUE, sep=';')

#gets Feb 1 and 2, 2007 data
data$DateTime <- paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
feb_data <- data[data$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & data$DateTime < strptime("2007-02-03", "%Y-%m-%d"), ]

# histogram plot
hist(as.numeric(as.character(feb_data$Global_active_power)), col='red', main='Global Active Power', ylab='Frequency', xlab='Global Active Power (kilowatts)')

# saves plot to plot1.png
dev.copy(png,'plot1.png')
dev.off()