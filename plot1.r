
library(datasets)

## upload the data in R 

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## read the date column as date

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

## read the time column as time

data$Time<-strptime(data$Time,"%H:%M:%S")

## subset the data for the dates 2007-02-01 and 2007-02-02

subset<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]


##open a png to save the histogram

png("plot1.png", width = 480, height = 480)

## Plot the histogram

hist(subset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")


dev.off()
