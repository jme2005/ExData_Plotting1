#requires that the file "house_hold_power_consumption.txt" is in your working directory
pwrConTotal<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
pwrCon<-pwrConTotal[pwrConTotal$Date=="1/2/2007"|pwrConTotal$Date=="2/2/2007",]
pwrCon$Global_active_power<-as.numeric(as.character(pwrCon$Global_active_power))


png(filename="plot1.png",width=480,height=480,bg="transparent")
hist(pwrCon$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()

