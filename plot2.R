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
filename <- "figure/plot2.png"
png(filename)

## ----- Make the plot -----
x <- data$DateTime
y <- data$Global_active_power
plot(x, y, main = "Global Active Power", col = "Black", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n")
lines(x, y)

## ----- Close the device -----
dev.off()
