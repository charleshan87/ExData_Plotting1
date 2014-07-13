
plot_04 <- function() {
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

data_1 <- subset(data, data$Date == "1/2/2007")
data_2 <- subset(data, data$Date == "2/2/2007")
data_3 <- rbind(data_1, data_2)
d_1 <- data_3[,1]
d_1x <- as.Date(d_1, format="%d/%m/%Y")
d_2 <- data_3[,2]
d_3 <- paste(d_1x,d_2, sep = " ")
datetime <- strptime(d_3, format="%Y-%m-%d %H:%M:%S")
data_4 <- data.frame(datetime, data_3)
plot_col_2 <- as.numeric(as.character(data_4[,4]))
plot_cols_2 <- data.frame(data_4$datetime, plot_col_2)
Voltage <- as.numeric(as.character(data_4[,6]))
plot_volt <- data.frame(data_4$datetime, Voltage)
Sub_metering_1 <- as.numeric(as.character(data_3[,7]))
Sub_metering_2 <- as.numeric(as.character(data_3[,8]))
Global_reactive_power <- as.numeric(as.character(data_4[,5]))
plot_pow <- data.frame(data_4$datetime, Global_reactive_power)

png('plot_04.png', width = 480, height = 480)
par(mfrow=c(2,2))

plot(plot_cols_2, type="l", ylab="Global Active Power", xlab="")

plot(plot_volt, type="l", xlab="datetime")

plot(datetime, Sub_metering_1, type="l", xlab="",
ylab="Energy sub metering")

lines(datetime, Sub_metering_2, col = "red")
lines(datetime, data_3$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", 
"Sub_metering_2", "Sub_metering_3"), cex = 0.95,
lty=c(1,1,1), col=c("black","red","blue"), bty="n")

plot(plot_pow, type="l", xlab="datetime")

dev.off()
}

