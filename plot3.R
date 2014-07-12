plot3 <- function(){
    #read data from file 
    epc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?")
    
    #change Date variable to date type
    epc$Date <- as.Date(epc$Date , "%d/%m/%Y")
    
    #extract data from 2007-02-01 to 2007-02-02
    dayepc <- epc[(epc$Date >= as.Date("2007-02-01") & epc$Date <= as.Date("2007-02-02")),]
    
    #combine Date & Time variables
    dayepc$DateTime <- strptime(paste(dayepc$Date, dayepc$Time), "%Y-%m-%d %H:%M")
    
    #create plot & write to '.png' file
    png(filename="./plot3.png", width=480, height=480, units="px")
    
    yrange<-range(c(dayepc$Sub_metering_1,dayepc$Sub_metering_2,dayepc$Sub_metering_3))
    
    plot(dayepc$DateTime, dayepc$Sub_metering_1, type="l", col=1, ylab = "", xlab = "", ylim=yrange)
    par(new=T)
    plot(dayepc$Sub_metering_2, type="l", axes=F, col=2, ylab = "", xlab = "", ylim=yrange)
    par(new=T)
    plot(dayepc$Sub_metering_3, type="l", axes=F, col=4, ylab = "Energy sub metering", xlab = "", ylim=yrange)
    par(new=F)
    par(font=1)
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch="__", col=c(1,2,4)) 
    
    dev.off()  

}