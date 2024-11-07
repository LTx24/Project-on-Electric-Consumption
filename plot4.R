data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", nrows = 2075259)
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Plot 4: Multiple Base Plots in One Frame
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 4a
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 4b
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 4c
plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4d
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

