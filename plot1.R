data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data4 <- subset(data, Date == "2007-02-01")
data5 <- subset(data, Date == "2007-02-02")
smdata <- rbind(data4, data5)
gap <- as.numeric(smdata$Global_active_power)
hist(gap, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "Red", 
     ylim = c(0, 1200))
dev.copy(png, file= "plot1.png", width=480, height=480)
dev.off()