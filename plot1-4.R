library(readr)
power <- read_csv2("~/Desktop/household_power_consumption.txt")
power <- power[ 66638:69518, ]
active=power$Global_active_power
active=as.numeric(active)
par(mfrow=c(1,1))#plot1
hist(active, main="Global Acrive Power", xlab="Global Acrive Power(kilowatts)", col="red")
dev.copy(png, file="plot1.png")
dev.off()
date=power$Date#plot2
time=power$Time
time=as.character(time)
z=paste(date,time)
z=strptime(z,format="%d/%m/%Y %H:%M:%S")
plot(z, active,type = "l",xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()
plot(z, power$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
lines(z, power$Sub_metering_2,type= "l", col="red")#plot3
lines(z, power$Sub_metering_3,type= "l", col="blue")
legend("topright",cex=0.6, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))
dev.copy(png, file="plot3.png")
dev.off()
par(mfrow=c(2,2),mar=c(4,4,2,1))#plot4
plot(z, active,type = "l",xlab = "", ylab = "Global Active Power")
plot(z, power$Voltage,type = "l",xlab = "datetime", ylab = "Voltage")
plot(z, power$Sub_metering_1,type = "l",xlab = "", ylab = "Energy sub metering")
lines(z, power$Sub_metering_2,type= "l", col="red")
lines(z, power$Sub_metering_3,type= "l", col="blue")
legend("topright",cex=0.3 , c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c(1,1,1))
plot(z, power$Global_reactive_power,type = "l",xlab = "datetime", ylab = "Global_reactive_power", ylim=c(0.0,0.5))
dev.copy(png, file="plot4.png")
dev.off()

