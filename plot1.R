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
filename <- "figure/plot1.png"
png(filename)

## ----- Make the plot -----
y <- data$Global_active_power
hist(y, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")


## ----- Close the device -----
dev.off()
