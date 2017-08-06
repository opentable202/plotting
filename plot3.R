big_data <- read.table("./household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       stringsAsFactors=FALSE, 
                       dec=".")
data <- big_data[big_data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)
plot(datetime, 
     Sub_metering_1, 
     type="l",
     ylab = "Energy Submetering")
lines(datetime, 
      Sub_metering_2,
      type= "l",
      col="red")
lines(datetime, 
      Sub_metering_3,
      type= "l",
      col="blue")
legend("topright", 
       pch = "-", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.5)
dev.copy(png, file= "plot3.png", width=480, height=480)
dev.off()