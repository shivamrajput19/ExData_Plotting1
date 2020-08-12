## Loading the data set in R

data_given <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

## Taking the subset of data and converting Date in date format

data_given$Date <- as.Date(data_given$Date, format = "%d/%m/%Y")
data_given <- subset(data_given, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plotting the line diagramme

plot(data_given$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power(kilowatts)", axes = FALSE)
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2,at=c(0,2,4,6))
box(lty = 1, col = 'black')

## Saving the file

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()