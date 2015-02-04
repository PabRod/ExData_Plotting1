## ----- Load and clean the data -----

## ----- Set locale to english -----
# Required for using english names for week days
Sys.setlocale("LC_TIME", "English")

## ----- Load libraries -----
library(lubridate)
library(dplyr)

## ----- Load the data -----
filename <- "household_power_consumption.txt"
data <- read.table(filename, header = TRUE, sep = ";", dec = ".", na.strings = "?")

## ----- Slightly mutate the data -----
data <- mutate(data, Date = dmy(Date), Time = hms(Time)) # Read dates and times as dates and times instead of as factors
data <- mutate(data, DateTime = Date + Time) # Create a new column with full date time

## ----- Subset the data -----
data <- data[data$Date >= ymd("2007-02-01"), ]
data <- data[data$Date <= ymd("2007-02-02"), ]




## ----- Plot the data -----

## ----- Open the png device -----
filename <- "figure/plot4.png"
png(filename)

## ----- Set the 2 x 2 frame -----
par(mfrow=c(2,2))

## ----- 1st plot -----
x <- data$DateTime
y <- data$Global_active_power
plot(x, y, main = "Global Active Power", col = "Black", xlab = "", ylab = "Global Active Power (kilowatts)", pch = "")
lines(x, y)

## ----- 2nd plot -----
x <- data$DateTime
y <- data$Voltage
plot(x, y, main = "Global Active Power", col = "Black", xlab = "datetime", ylab = "Voltage", pch = "")
lines(x, y)

## ----- 3rd plot -----
x <- data$DateTime
y1 <- data$Sub_metering_1
y2 <- data$Sub_metering_2
y3 <- data$Sub_metering_3
plot(x, y1, xlab = "", ylab = "Energy sub metering", type = "n")
lines(x, y1, col = "black")
lines(x, y2, col = "red")
lines(x, y3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","red", "blue"), bty = "n")

## ----- 4th plot -----
x <- data$DateTime
y <- data$Global_reactive_power
plot(x, y, main = "", col = "Black", xlab = "datetime", ylab = "Global_reactive_power", pch = "")
lines(x, y)

## ----- Restore the default value -----
par(mfrow=c(1,1))

## ----- Close the device -----
dev.off()
