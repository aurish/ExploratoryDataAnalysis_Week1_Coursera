#Reading data from source

data<-read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F,dec = '.')
data_Set<-data[data$Date %in%c('1/2/2007','2/2/2007'),]
datetime<-strptime(paste(data_Set$Date,data_Set$Time,sep=' '),'%d/%m/%Y %H:%M:%S')

globalActivePower <- as.numeric(data_Set$Global_active_power)
voltage<-as.numeric(data_Set$Voltage)
reactivepower<-as.numeric(data_Set$Global_reactive_power)
png('plot4.png',width = 480,height = 480)
par(mfrow=c(2,2))

plot(datetime,globalActivePower,type='l', xlab = '',ylab = 'Global Active Power',cex=0.2)
plot(datetime,voltage,xlab='datetime',ylab='Voltage',type='l')
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, reactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
