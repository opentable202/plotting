big_data <- read.table("./household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       stringsAsFactors=FALSE, 
                       dec=".")
data <- big_data[big_data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(data$Global_active_power)
plot(datetime, 
     gap, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.copy(png, file= "plot2.png", width=480, height=480)
dev.off()