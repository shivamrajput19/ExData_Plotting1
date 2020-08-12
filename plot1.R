data_given <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
data_given$Date <- as.Date(data_given$Date, format = "%d/%m/%Y")
data_given <- subset(data_given, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
hist(data_given$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.copy(png, file = "plot1.png", height = 480, width = 480)