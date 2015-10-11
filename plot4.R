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



# PLOT AND SAVE 4 figures arranged in 2 rows and 2 columns
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
attach(mtcars)
par(mfrow=c(2,2))
plot(selectPeriod$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", axes = FALSE)
axis(side = 2, at=c(0, 2, 4, 6))
axis(side = 1, labelsPlot, at=c(0, w[1], last ))
box()

plot(selectPeriod$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", axes = FALSE)
axis(side = 2, at=c(234, 238, 242, 246))
axis(side = 1, labelsPlot, at=c(0, w[1], last ))
box()

plotcol <- c("black", "red", "blue")
plot(selectPeriod$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", axes = FALSE)
lines(selectPeriod$Sub_metering_2, col = plotcol[2])
lines(selectPeriod$Sub_metering_3, col = plotcol[3])
axis(side = 2, at=c(0, 10, 20, 30))
axis(side = 1, labelsPlot, at=c(0, w[1], last ))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), col = plotcol, lwd = 1, bty = "n")
box()

plot(selectPeriod$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", axes = FALSE)
axis(side = 2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
axis(side = 1, labelsPlot, at=c(0, w[1], last ))
box()

dev.off()
