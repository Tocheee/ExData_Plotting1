#Tocheee
#Data Visualization Project 1
#install.packages("sqldf")
library(sqldf)
library(lubridate)
data <- read.csv.sql(file="household_power_consumption.txt",header=TRUE,sql='select * from file where Date = "1/2/2007" or Date = "2/2/2007"', sep=";")

#Change date/time column to datetime class
datetime <-  paste(data$Date,data$Time)
data$Date <- strptime(datetime,format="%d/%m/%Y %H:%M:%S")

png('plot3.png')
{plot(col="black", x=data$Date, y=data$Sub_metering_1, ylab = "Energy sub metering", xlab="", type='l')
lines(x=data$Date,y=data$Sub_metering_2, col='red')
lines(x=data$Date,y=data$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),merge=TRUE, col=c("black","red","blue"),lty=1)
  }
dev.off()
