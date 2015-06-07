source('get_data.R')

#Custom function to filter input file by date and load into data.frame
data <- get_data()

png('plot3.png')
text <- c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
color <- c('black', 'red', 'blue')

plot(data$DateTime, data$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")
points(data$DateTime, data$Sub_metering_2, type="l", col='red')
points(data$DateTime, data$Sub_metering_3, type="l", col='blue')
legend('topright', legend = text, col = color, lty = 1)
dev.off()