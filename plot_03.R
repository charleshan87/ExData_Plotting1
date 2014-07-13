
plot_03 <- function() {
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data_1 <- subset(data, data$Date == "1/2/2007")
data_2 <- subset(data, data$Date == "2/2/2007")
data_3 <- rbind(data_1, data_2)
d_1 <- data_3[,1]
d_1x <- as.Date(d_1, format="%d/%m/%Y")
d_2 <- data_3[,2]
d_3 <- paste(d_1x,d_2, sep = " ")
datetime <- strptime(d_3, format="%Y-%m-%d %H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(data_3[,7]))
Sub_metering_2 <- as.numeric(as.character(data_3[,8]))

png('plot_03.png', width = 480, height = 480)

plot(datetime, Sub_metering_1, type="l", xlab="",
ylab="Energy sub metering")

lines(datetime, Sub_metering_2, col = "red")
lines(datetime, data_3$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", 
"Sub_metering_2", "Sub_metering_3"),
lty=c(1,1,1), col=c("black","red","blue"))

dev.off()
}

