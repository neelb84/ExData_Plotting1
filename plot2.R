#Pull 2 days data  
tmp1<-subset((read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")),
             as.Date(Date,format='%d/%m/%Y')>='2007-02-01' & as.Date(Date,format='%d/%m/%Y')<='2007-02-02')

#Create the Date-Time variable from Date and Time, rest are pulled as numeric so NO change required
tmp1$DateTime<-strptime(paste(tmp1$Date,tmp1$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width=480, height=480) #initializing png file

#Create line plot
with(tmp1,plot(DateTime,Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab=''))

dev.off()