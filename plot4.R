big_data <- read.table("./household_power_consumption.txt", 
                       header=TRUE, 
                       sep=";", 
                       stringsAsFactors=FALSE, 
                       dec=".")
data <- big_data[big_data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
voltage <- as.numeric(data$Voltage)
gap <- as.numeric(data$Global_active_power)
grp <- as.numeric(data$Global_reactive_power)
Sub_metering_1 <- as.numeric(data$Sub_metering_1)
Sub_metering_2 <- as.numeric(data$Sub_metering_2)
Sub_metering_3 <- as.numeric(data$Sub_metering_3)

par(mar = c(2, 4, 1, 1))
par(mfrow = c(2,2))

#top_left
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data4 <- subset(data, Date == "2007-02-01")
data5 <- subset(data, Date == "2007-02-02")
smdata <- rbind(data4, data5)
plot(datetime, 
     gap, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

#top_right
plot(datetime, 
     voltage, 
     type="l",
     ylab = "Voltage",
     xlab = "datetime")

#bottom_left
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

#bottom_right
plot(datetime, 
     grp, 
     type="l",
     ylab = "Global_reactive_power",
     xlab = "datetime")

dev.copy(png, file= "plot4.png", width=480, height=480)
dev.off()