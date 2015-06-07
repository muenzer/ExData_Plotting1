source('get_data.R')

#Custom function to filter input file by date and load into data.frame
data <- get_data()

png('plot1.png')
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()