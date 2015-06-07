filter <- function(filename.in, filename.out, dates) {
  ## Open a connection separately to hold the cursor position
  file.in <- file(filename.in, 'rt')
  file.out <- file(filename.out, 'wt')
  
  ## Write header
  line <- readLines(file.in, n=1)
  writeLines(line, file.out)
  
  ## Use a loop to read in the rest of the lines
  line <- readLines(file.in, n=1)
  while (length(line)) {
    date <- as.Date(substring(line, 1,10), "%d/%m/%Y")
    
    if (date %in% dates) {
      writeLines(line, file.out)
    } 
    line<- readLines(file.in, n=1)
  }
  close(file.in)
  close(file.out)
}

get_data <- function(filename.in = 'household_power_consumption.txt', filename.out = 'hpc_filtered.txt', dates = c("2007-02-01","2007-02-02")) {
  if(!file.exists(filename.out)) {
    filter(filename.in, filename.out, dates)
  }
  
  data <- read.table(filename.out, header = TRUE, sep = ";", na.strings = "?")
  data$DateTime <- strptime(with(data, paste(Date, Time)), format = "%d/%m/%Y %H:%M:%S")
  
  data
}