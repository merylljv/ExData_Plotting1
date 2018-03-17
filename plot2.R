# source code working directory
setwd(dirname(sys.frame(1)$ofile))

data <- read.table('Electric_power_consumption.txt', header=TRUE, sep=';')

#gets Feb 1 and 2, 2007 data
data$DateTime <- paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
feb_data <- data[data$DateTime >= strptime("2007-02-01", "%Y-%m-%d") & data$DateTime < strptime("2007-02-03", "%Y-%m-%d"), ]

# line plot
plot(feb_data$DateTime, as.numeric(as.character(feb_data$Global_active_power)), type='l', ylab='Global Active Power (Kilowatts)', xlab='')

# saves plot to plot2.png
dev.copy(png,'plot2.png')
dev.off()