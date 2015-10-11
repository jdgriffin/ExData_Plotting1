### Exploratory Data Analysis - Project 1 - Plot 4 ###
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

dat$dateformat <- dmy(dat$Date)

# Extract the required dataset
dat <- dat[dat$dateformat %in% dmy(c("01-02-2007","02-02-2007")),]

# Create the required date/time formats
dat$timestamp <- dmy_hms(paste(dat$Date, dat$Time))
dat$weekday <- wday(dat$dateformat, label = TRUE)

#Plot data tp png - using base system
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))

with(dat,{
  #first plot
  plot(dat$timestamp,dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="",type ="n" )
  lines(dat$timestamp,dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="")
  
  #second plot
  plot(dat$timestamp,dat$Voltage , ylab = "Voltage", xlab="",type ="n")
  lines(dat$timestamp,dat$Voltage)
  
  #third plot
  plot(timestamp,Sub_metering_1, ylab = "Energy sub metering", xlab="", type="n" )
  lines(dat$timestamp,dat$Sub_metering_1)
  
  points(dat$timestamp,dat$Sub_metering_2, type="n" )
  lines(dat$timestamp,dat$Sub_metering_2, col = "red")
  
  points(dat$timestamp,dat$Sub_metering_3, type="n" )
  lines(dat$timestamp,dat$Sub_metering_3, col="blue")
  
  legend("topright",pch="--", col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #fourth plot
  dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)/500
  plot(dat$timestamp,dat$Global_reactive_power, ylab="Global_reactive _power",  xlab="datetime",type ="n" )
  lines(dat$timestamp,dat$Global_reactive_power )
})

dev.off()

# Save the workspace session
#save.image(".Rdata")

# Clear the workspace
# rm(list=ls())

