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

png("plot4.png", width = 480, height = 480)

## create a png with 4 plots and change the margins

par(mfcol=c(2,2))

par(mar=c(4,4,2,2))

## Plot the graph for Global Active Power with no points

plot(subset$new,subset$Global_active_power,type="n",axes=FALSE,xlab="",ylab="Global Active Power (kilowatts)")

## Enter an x-axis with labels Thu Fri Sat

SEQ <- c(min(subset$new),median(subset$new), max(subset$new))

axis.POSIXct(SEQ, at=SEQ, side=1, lab=c("Thu","Fri","Sat"))

## Enter a y-axis

axis(2)

## Plot the line for Global Active Power vs time

lines(subset$new,subset$Global_active_power, type="l")

## Plot the line graph for submeterings with no points

plot(subset$new,subset$Global_active_power,type="n",xlab="",ylab="Energy sub metering",ylim=range(subset$Sub_metering_1),axes=FALSE)


## Enter an x-axis with labels Thu Fri Sat

SEQ <- c(min(subset$new),median(subset$new), max(subset$new))

axis.POSIXct(SEQ, at=SEQ, side=1, lab=c("Thu","Fri","Sat"))

## Enter a y-axis

axis(2)

## Graph submetering 1
lines(subset$new,subset$Sub_metering_1, type="l",lty=1)

# Graph submetering 2 with red line
lines(subset$new,subset$Sub_metering_2, type="l",lty=1,col="red")

# Graph submetering 3 with blue line
lines(subset$new,subset$Sub_metering_3, type="l",lty=1,col="blue")

# Create a legend in the top-right corner with borders
names<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
colours<-c("black","red","blue")
legend("topright",names,col = colours,lty=1,bty="n")


## Plot the graph for Voltage vs datetime with no points

plot(subset$new,subset$Voltage,type="n",axes=FALSE,xlab="datetime",ylab="Voltage")


## Enter an x-axis with labels Thu Fri Sat

SEQ <- c(min(subset$new),median(subset$new), max(subset$new))

axis.POSIXct(SEQ, at=SEQ, side=1, lab=c("Thu","Fri","Sat"))

## Enter a y-axis

axis(2)

## Plot the graph of Voltage vs time

lines(subset$new,subset$Voltage, type="l")

##Plot the graph for Global Reactive Power vs datetime with no points

plot(subset$new,subset$Global_reactive_power,type="n",axes=FALSE,xlab="datetime",ylab="Global_reactive_power")


## Enter an x-axis with labels Thu Fri Sat

SEQ <- c(min(subset$new),median(subset$new), max(subset$new))

axis.POSIXct(SEQ, at=SEQ, side=1, lab=c("Thu","Fri","Sat"))

## Enter a y-axis

axis(2)

## Plot the line of Global Reactive Power vs time

lines(subset$new,subset$Global_reactive_power, type="l")

dev.off()
