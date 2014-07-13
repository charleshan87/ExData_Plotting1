
plot_01 <- function() {

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data_1 <- subset(data, data$Date == "1/2/2007")
data_2 <- subset(data, data$Date == "2/2/2007")
data_3 <- rbind(data_1, data_2)

plot_col <- as.numeric(as.character(data_3[,3]))

png('plot_01.png', width = 480, height = 480)
hist(plot_col, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

}
