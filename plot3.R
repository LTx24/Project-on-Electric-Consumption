data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 3: Line Plot of Energy Sub Metering
png("plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

