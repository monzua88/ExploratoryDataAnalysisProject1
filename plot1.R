############
###Plot 1###
############
energy <- read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?",nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="", quote='\"') #Read the file
subset_energy_dates= subset(energy, Date %in% c("1/2/2007","2/2/2007")) #Subset the two first days of february
hist(subset_energy_dates$Global_active_power, main="Global Active Power", xlab="Global Active Power [kilowatts]", ylab="Frequency", col="Red") #Plot an histogram with lables of axis, title and color 
dev.copy(png, file="plot1.png", height=480, width=480) #export the plot
dev.off() #turn off the device