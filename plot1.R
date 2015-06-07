

#setwd("~/personal/coursera/ExploratoryDataAnalysis/project1")
hpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";",skip=0,nrows=2)
clnames = names(hpc)
hpc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",  header = TRUE, sep = ";",skip=66636,nrows=2880)
names(hpc) <- clnames
#hpc <- cbind(paste(hpc$Date,hpc$Time), hpc)
#names(hpc)[1] <- "DateTime"
library(lubridate)
dates <- ymd(sampleTimes)
hpc$Time <- hms(hpc$Time)
hpc$Date <- dmy(hpc$Date)
hist(as.numeric(hpc$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red", ylim = c(0,1200))
dev.copy(png, file = "plot1.png")
dev.off()
