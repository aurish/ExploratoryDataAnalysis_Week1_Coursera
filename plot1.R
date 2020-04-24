#Reading data from source

data<-read.table('household_power_consumption.txt',sep = ';',header = T,stringsAsFactors = F,dec = '.')
data_Set<-data[data$Date %in%c('1/2/2007','2/2/2007'),]
GlobalActive<-as.numeric(data_Set$Global_active_power)
png('Plot1.png',width = 480,height = 480)
hist(GlobalActive,col = 'red',main = 'Global Active Power',xlab = 'Global Active Power(kilowatts)')
dev.off()
