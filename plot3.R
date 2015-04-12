#Pull 2 days data  
tmp1<-subset((read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")),
             as.Date(Date,format='%d/%m/%Y')>='2007-02-01' & as.Date(Date,format='%d/%m/%Y')<='2007-02-02')

#Create the Date-Time variable from Date and Time, rest are pulled as numeric so NO change required
tmp1$DateTime<-strptime(paste(tmp1$Date,tmp1$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", width=480, height=480)  #initializing png file

#Create a blank plot and initialize the line plot with x and y labels
with(tmp1,plot(DateTime,Sub_metering_1,type='n',ylab='Energy sub metering',xlab=''))

#Next 4 lines of code add the 3 series in the plot along with the legends
with(tmp1,points(DateTime,Sub_metering_1,type='l'))

with(tmp1,points(DateTime,Sub_metering_2,type='l',col="red"))

with(tmp1,points(DateTime,Sub_metering_3,type='l',col="blue"))

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","blue","red"),lty=c(1,1,1))

dev.off()