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

# adjust information for plot
labelsPlot <- c('Thu', 'Fry', 'Sat')
w <- which(selectPeriod$Date == Date2)
last <- nrow(selectPeriod)

# PLOT AND SAVE
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot(selectPeriod$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE)
axis(side = 2, at=c(0, 2, 4, 6))
axis(side = 1, labelsPlot, at=c(0, w[1], last ))
box()
dev.off()
