power_dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "NA")

power_dat$Global_active_power <- as.numeric(as.character(power_dat$Global_active_power))

power_dat$DateTime <- strptime(paste(power_dat$Date, power_dat$Time), "%d/%m/%Y %H:%M:%S")

power_sub <- subset(power_dat, DateTime > as.POSIXct('2007-02-01') & DateTime <= as.POSIXct('2007-02-03'))

hist(power_sub$Global_active_power, xlab = "Global Active Power(kilowatts)", col = "red", main="")

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

dev.off()