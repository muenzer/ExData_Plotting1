source('get_data.R')

#Custom function to filter input file by date and load into data.frame
data <- get_data()

png('plot2.png')
plot(data$DateTime, data$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()