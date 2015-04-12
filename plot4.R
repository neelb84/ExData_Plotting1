#Pull 2 days data  
tmp1<-subset((read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")),
             as.Date(Date,format='%d/%m/%Y')>='2007-02-01' & as.Date(Date,format='%d/%m/%Y')<='2007-02-02')

#Create the Date-Time variable from Date and Time, rest are pulled as numeric so NO change required
tmp1$DateTime<-strptime(paste(tmp1$Date,tmp1$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width=480, height=480) #initializing png file

par(mfrow = c(2, 2))    #2 rows and 2 columns of plots, default margins

#Create line plot for row 1 and column 1
with(tmp1,plot(DateTime,Global_active_power,type='l',ylab='Global Active Power',xlab=''))

#Create line plot for row 1 and column 2
with(tmp1,plot(DateTime,Voltage,type='l',ylab='Voltage',xlab='datetime'))

#Create line plot for row 2 and column 1
with(tmp1,plot(DateTime,Sub_metering_1,type='n',ylab='Energy sub metering',xlab=''))

with(tmp1,points(DateTime,Sub_metering_1,type='l'))

with(tmp1,points(DateTime,Sub_metering_2,type='l',col="red"))

with(tmp1,points(DateTime,Sub_metering_3,type='l',col="b lue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),
       lty=c(1,1,1),bty="n")

#Create line plot for row 2 and column 2
with(tmp1,plot(DateTime,Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime'))

dev.off()