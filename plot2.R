############
###Plot 2###
############
energy <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="", quote='\"') #Read the file
subset_energy_dates= subset(energy, Date %in% c("1/2/2007","2/2/2007")) #Subset the two first days of february
subset_energy_dates$Date = as.Date(subset_energy_dates$Date, format="%d/%m/%Y") #change the format of the date
subset_energy_time = paste(as.Date(subset_energy_dates$Date), subset_energy_dates$Time) #Paste together date and time
subset_energy_dates$DateTime = as.POSIXct(subset_energy_time) #New column in the data subset with time and date
with(subset_energy_dates, {plot(Global_active_power~DateTime, type="l",ylab="Global Active Power (kilowatts)", xlab="")}) #Plot the graph ith lables of axis, title and color
dev.copy(png, file="plot2.png", height=480, width=480) #export the plot
dev.off() #turn off the device