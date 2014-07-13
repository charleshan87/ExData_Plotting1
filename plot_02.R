
plot_02 <- function() {
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

png('plot_02.png', width = 480, height = 480)
plot(plot_cols_2, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
}