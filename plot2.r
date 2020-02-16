#Tocheee
#Data Visualization Project 1
#Read in the data
install.packages("sqldf")
library(sqldf)
library(lubridate)

#Set working directory
# setwd("~/R/Coursera/datavizprojecta/ExData_Plotting1")

data <- read.csv.sql(file="household_power_consumption.csv",header=TRUE,sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";")

#Change date/time column to datetime class
datetime <-  paste(data$Date,data$Time)
data$Date <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")

png('plot2.png')
png2 <- plot(x=data$Date,y=data$Global_active_power,col="black", ylab = "Global Active Power (kilowatts)", type='l')
dev.off()
