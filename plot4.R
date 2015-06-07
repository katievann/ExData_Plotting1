
#setwd("~/personal/coursera/ExploratoryDataAnalysis/project1")
hpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";",skip=0,nrows=2)
clnames = names(hpc)
hpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";",skip=66636,nrows=2880)
names(hpc) <- clnames
#hpc <- cbind(paste(hpc$Date,hpc$Time), hpc)
#names(hpc)[1] <- "DateTime"
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
DateTime <- paste(hpc$Date, " ", hpc$Time)
DateTime <- strptime(DateTime, format = "%Y-%m-%d %H:%M:%S")


par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(DateTime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(DateTime, hpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")


plot(DateTime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(DateTime, hpc$Sub_metering_2, col = "red")
lines(DateTime, hpc$Sub_metering_3, type = "l", col = "blue")
legend("topright",pch = NA, lwd=1, col = c("black","red", "blue"),  cex=.6, pt.cex = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(DateTime, hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")


dev.copy(png, file = "plot4.png")
dev.off()
