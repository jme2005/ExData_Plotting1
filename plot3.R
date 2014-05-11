#requires that the file "house_hold_power_consumption.txt" is in your working directory
### Can be skiped if you have already read-in and processed the data with plot1.R 
pwrConTotal<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
pwrCon<-pwrConTotal[pwrConTotal$Date=="1/2/2007"|pwrConTotal$Date=="2/2/2007",]
pwrCon$Global_active_power<-as.numeric(as.character(pwrCon$Global_active_power))

### Start here if you have processed the data frame "pwrCon" from plot1.R 
pwrCon$Date<-as.Date(pwrCon$Date,format="%d/%m/%Y")
pwrCon$DateTime<-strptime(paste(pwrCon$Date,pwrCon$Time),format="%Y-%m-%d %H:%M:%S")
### Start here if you have processed the data frame "pwrCon" with the script plot2.R
pwrCon$Sub_metering_1<-as.numeric(as.character(pwrCon$Sub_metering_1))
pwrCon$Sub_metering_2<-as.numeric(as.character(pwrCon$Sub_metering_2))
pwrCon$Sub_metering_3<-as.numeric(as.character(pwrCon$Sub_metering_3))


png(filename="plot3.png",width=480,height=480)
with(pwrCon, {
        plot(DateTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering")
        lines(DateTime,Sub_metering_2,type="l",col="red")
        lines(DateTime,Sub_metering_3,type="l",col="blue")
})
legend("topright",lty=1,col=c("black","red","blue"),legend=names(pwrCon[7:9]))
dev.off()