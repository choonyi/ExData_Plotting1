library(dplyr)
library(lubridate)

##read data 
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

##convert the Date and Time variables to Date/Time classes in R
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- as.POSIXct(paste0(data$Date,
                               " ",
                               data$Time, format = "%Y-%m-%d %H:%M:%S"))

##We will only be using data from the dates 2007-02-01 and 2007-02-02.
data <- data %>%
        filter(Date>=as.Date("2007-02-01") &
                       Date <= as.Date("2007-02-02"))

##plot4 goes here
# 1. Open png file
png("plot4.png")

# 2. Create the plot
par(mfrow = c(2,2))

plot(x = data$Time,
     y = data$Global_active_power,
     ylab = "Global Active Power",
     xlab="",
     type = "l")

plot(x = data$Time,
     y = data$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     type = "l")

plot(x = data$Time,
     y = data$Sub_metering_1,
     ylab = "Energy sub metering",
     xlab="",
     type = "l")

lines(x = data$Time,
      y = data$Sub_metering_2,
      col = "red")

lines(x = data$Time,
      y = data$Sub_metering_3,
      col = "blue")

legend(x = "topright",
       col = c("black",
               "red",
               "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       bty = "n",
       cex = 1,
       y.intersp = 0.8)


plot(x = data$Time,
     y = data$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab="datetime",
     type = "l")

# 3. Close the file
dev.off()

