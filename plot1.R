### Exploratory Data Analysis - Project 1 - Plot 1 ###
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
dat$Date <- dmy(dat$Date)

# Extract the required dataset
dat <- dat[dat$Date %in% dmy(c("01-02-2007","02-02-2007")),]

# Create the required date/time formats
dat$timestamp <- with(dat, paste(Date, Time), format="%d-%m-%Y %H:%M:%S")
dat$Global_active_power <- as.numeric(dat$Global_active_power)

#Plot data tp png - using base system
png("plot1.png", width = 480, height = 480)
hist((dat$Global_active_power) , xlab = "Global Active Power (kilowatts)",col = "red", main = "Global Active Power")
dev.off()

# Save the workspace session
#save.image(".Rdata")

# Clear the workspace
# rm(list=ls())