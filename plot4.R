############
###Plot 4###
############
energy <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="", quote='\"') #Read the file
subset_energy_dates= subset(energy, Date %in% c("1/2/2007","2/2/2007")) #Subset the two first days of february
subset_energy_dates$Date = as.Date(subset_energy_dates$Date, format="%d/%m/%Y") #change the format of the date
subset_energy_time = paste(as.Date(subset_energy_dates$Date), subset_energy_dates$Time) #Paste together date and time
subset_energy_dates$DateTime = as.POSIXct(subset_energy_time) #New column in the data subset with time and date
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subset_energy_dates, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power", xlab="") 
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480) #export the plot
dev.off() #turn off the device