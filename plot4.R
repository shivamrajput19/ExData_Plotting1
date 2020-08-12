## Loading the data set in R

data_given <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

## Taking the subset of data and converting Date in date format

data_given$Date <- as.Date(data_given$Date, format = "%d/%m/%Y")
data_given <- subset(data_given, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plotting the line diagram

par(mfcol = c(2,2), mar = c(3,3,1,1))

## The first one

plot(data_given$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power(kilowatts)", axes = FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')

## The second one

plot(1:nrow(data_given), as.numeric(data_given$Sub_metering_1), main="", 
     ylab="Energy sub metering", xlab="",type="l", col="black", axes=FALSE)
points(as.numeric(data_given$Sub_metering_2), col="red", type="l",
       axes=FALSE, ylim=c(0,40), xlab="", ylab="")
points(as.numeric(data_given$Sub_metering_3), col="blue", type="l",
       axes=FALSE,ylim=c(0,40),xlab="",ylab="")
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))
legend("topright", legend=c("sub-metering1","sub-metering2","sub-metering3"),
       col=c("black","red","blue"), lty=c(1,1,1), lwd=2, cex = 0.75)
box(lty = 1, col = 'black')

## The third one

plot(data_given$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage", axes = FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(234,238,242,246))
box(lty = 1, col = 'black')

## The forth one

plot(data_given$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", axes = FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5))
box(lty = 1, col = 'black')

## Saving the file

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()