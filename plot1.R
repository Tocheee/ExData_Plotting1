#Tocheee
#Data Visualization Project 1

#Read in the data
library(sqldf)
#install.packages("lubridate")
library(lubridate)
data <- read.csv.sql(file="household_power_consumption.txt",header=TRUE,sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";")

#Change date/time column to datetime class

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$Time <- hms(data$Time)
class(data$Date)
class(data$Time)

png('plot1.png')
png1 <- hist(x = data$Global_active_power, col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()