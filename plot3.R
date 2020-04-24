# Reading data from source

data<-read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F,dec = '.')
data_Set<-data[data$Date %in%c('1/2/2007','2/2/2007'),]
datetime<-strptime(paste(data_Set$Date,data_Set$Time,sep=' '),'%d/%m/%Y %H:%M:%S')
globalActivePower <- as.numeric(data_Set$Global_active_power)

submetering1<-as.numeric(data_Set$Sub_metering_1)
submetering2<-as.numeric(data_Set$Sub_metering_2)
submetering3<-as.numeric(data_Set$Sub_metering_3)
png('plot3.png',width=480,height = 480)

plot(datetime,submetering1,ylab = 'Energy sub metering',xlab = '',type = 'l')
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
