# Reading data from source

data<-read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F,dec = '.')
data_Set<-data[data$Date %in%c('1/2/2007','2/2/2007'),]
datetime<-strptime(paste(data_Set$Date,data_Set$Time,sep=' '),'%d/%m/%Y %H:%M:%S')
globalActivePower <- as.numeric(data_Set$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
