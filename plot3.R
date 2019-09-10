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

##plot3 goes here
# 1. Open png file
png("plot3.png")

# 2. Create the plot
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
                  "Sub_metering_3"))

# 3. Close the file
dev.off()
