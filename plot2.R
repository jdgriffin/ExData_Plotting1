### Exploratory Data Analysis - Project 1 - Plot 2 ###
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

#dat$Global_active_power <-as.double(dat$Global_active_power)

#Plot data tp png - using base system
png("plot2.png", width = 480, height = 480)
plot(dat$timestamp,dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="",type ="n" )
lines(dat$timestamp,dat$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()



# Save the workspace session
#save.image(".Rdata")

# Clear the workspace
# rm(list=ls())

