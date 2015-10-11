# LOAD DATA FROM working directory
myData <- read.table("./household_power_consumption.txt", header = TRUE, sep =";", na.strings = "?")

# verify tipe of data for the columns of the data frame
sapply(myData, typeof)

# verify columns
myData$Time[1]
typeof(myData$Time[1])

# CONVERT DATE TYPE TO DATE CLASS
myData$Date <- as.Date(myData$Date, "%d/%m/%Y")
typeof(myData$Date[1])

# select period of interest
Date1 <- as.Date("2007-02-01")
Date2 <- as.Date("2007-02-02")
selectPeriod <- myData[myData$Date >= Date1 & myData$Date <= Date2,]
  
# PLOT HIST
#hist(selectPeriod$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# SAVE PNG
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
hist(selectPeriod$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

