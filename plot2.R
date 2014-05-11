#requires that the file "house_hold_power_consumption.txt" is in your working directory
### Can be skiped if you have already read-in and processed the data with plot1.R 
pwrConTotal<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
pwrCon<-pwrConTotal[pwrConTotal$Date=="1/2/2007"|pwrConTotal$Date=="2/2/2007",]
pwrCon$Global_active_power<-as.numeric(as.character(pwrCon$Global_active_power))

### Start here if you have the processed data frame "pwrCon" from plot2.R 
pwrCon$Date<-as.Date(pwrCon$Date,format="%d/%m/%Y")
pwrCon$DateTime<-strptime(paste(pwrCon$Date,pwrCon$Time),format="%Y-%m-%d %H:%M:%S")

### Plot and save the file as png
png(filename="plot2.png",width=480,height=480,bg="transparent")
plot(pwrCon$DateTime,pwrCon$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()

