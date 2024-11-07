data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", nrows = 2075259)
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")





# Plot 1: Histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")







