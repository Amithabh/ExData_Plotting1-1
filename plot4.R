power_dat <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "NA")

power_dat$Global_active_power <- as.numeric(as.character(power_dat$Global_active_power))

power_dat$DateTime <- strptime(paste(power_dat$Date, power_dat$Time), "%d/%m/%Y %H:%M:%S")

power_sub <- subset(power_dat, DateTime > as.POSIXct('2007-02-01') & DateTime <= as.POSIXct('2007-02-03'))

attach(power_sub) 

par(mfrow = c(2, 2), mar=c(4,5,2,1)) 

with(power_sub,{
    
    plot(power_sub$DateTime, Global_active_power, xlab="", ylab = "Global Active Power(kilowatts)", type = "l")
    
    plot(power_sub$DateTime, Voltage, xlab="date-time", ylab = "Voltage", type = "l")
    
    plot(power_sub$DateTime, Sub_metering_1, xlab="", ylab = "Energy sub metering", type = "l", col="black")
    
    lines(power_sub$DateTime, Sub_metering_2, xlab="", ylab = "Energy sub metering", type = "l", col="red")
    
    lines(power_sub$DateTime, Sub_metering_3, xlab="", ylab = "Energy sub metering", type = "l", col="blue")
    
    legend( x="topright", 
            
            legend=c("Sub_metering_1              ","Sub_metering_2              ","Sub_metering_3              " ),
            
            col=c("black","red","blue"), lwd=2, lty=c(1,1,1), 
            
            pch=c(NA,NA,NA), bty = "n", cex = 0.9 )
    
    plot(power_sub$DateTime, Global_reactive_power, xlab="date-time", ylab = "Global Reactive Power", type = "l")})

dev.copy(png, file = "plot4.png", width = 480, height = 480, units = "px")

dev.off()


