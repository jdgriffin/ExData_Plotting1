### Exploratory Data Analysis - Project 1 - Plot 3 ###
### 7 October 2015 ###

# This is to set the working directory
projectWD <- "~/Coursera/Data Science/4. Exploratory Data Analysis/Projects/Project 1"
setwd(projectWD)
getwd() 

# Load the previous workspace session
load(Project.Rdata)

# Check the previous workspace
ls()

# load required libraries
library(lubridate)
library(datasets)

# Read in the data
dat <- read.csv("./household_power_consumption.txt", header = TRUE, sep=";")

# Change the formats to enable comparison
dat$dateformat <- dmy(dat$Date)

# Extract the required dataset
dat <- dat[dat$dateformat %in% dmy(c("01-02-2007","02-02-2007")),]

# Create the required date/time formats
dat$timestamp <- dmy_hms(paste(dat$Date, dat$Time))
dat$weekday <- wday(dat$dateformat, label = TRUE)

#Plot data tp png - using base system
png("plot3.png", width = 480, height = 480)

dat$Sub_metering_1 <-as.numeric(dat$Sub_metering_1)
range1 <- range(dat$Sub_metering_1, na.rm = TRUE)
print(range1)

with(dat, plot(timestamp,Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n"))
lines(dat$timestamp,dat$Sub_metering_1)

dat$Sub_metering_2 <-as.numeric(dat$Sub_metering_2)
range2 <- range(dat$Sub_metering_2, na.rm = TRUE)
print(range2)

with (dat, points(timestamp,Sub_metering_2, type="n" ))
lines(dat$timestamp,dat$Sub_metering_2, col = "red")

range3 <- range(dat$Sub_metering_3, na.rm = TRUE)
print(range3)

points(dat$timestamp,dat$Sub_metering_3, type="n" )
lines(dat$timestamp,dat$Sub_metering_3, col="blue")

legend("topright",pch="--", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

# Save the workspace session
#save.image(".Rdata")

# Clear the workspace
# rm(list=ls())