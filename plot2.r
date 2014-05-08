library(datasets)

## upload the data in R 

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

## read the date column as date

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

## concatenate the time column with the date column

data$new<-paste(data$Date,data$Time,sep=" ")

## read the new column as time

data$new<-as.POSIXct(data$new, format="%Y-%m-%d %H:%M:%S")

## subset the data for the dates 2007-02-01 and 2007-02-02

subset<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]


##open a png to save the plot

png("plot2.png", width = 480, height = 480)

## Plot the line graph without points

plot(subset$new,subset$Global_active_power,type="n",xaxt = "n",xlab="",ylab="Global Active Power (kilowatts)")

## Enter an x-axis with labels Thu Fri Sat

SEQ <- c(min(subset$new),median(subset$new), max(subset$new))

axis.POSIXct(SEQ, at=SEQ, side=1, lab=c("Thu","Fri","Sat"))

## Enter a y-axis

axis(2)

## Graph the Global active power vs time

lines(subset$new,subset$Global_active_power, type="l")

dev.off()
