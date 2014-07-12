plot1 <- function(){
    #read data from file 
    epc <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt", 
                      header = TRUE, sep = ";", na.strings = "?")
    
    #change Date variable to date type
    epc$Date <- as.Date(epc$Date , "%d/%m/%Y")
    
    #extract data from 2007-02-01 to 2007-02-02
    dayepc <- epc[(epc$Date >= as.Date("2007-02-01") & epc$Date <= as.Date("2007-02-02")),]
    
    #create plot & write to '.png' file
    png(filename="./plot1.png", width=480, height=480, units="px")
    
    hist(dayepc$Global_active_power, freq=TRUE, col= "red", ylab="Frequency", 
         xlab="Global Active Power (kilowatts)", main="Global Active Power")
    
    dev.off()
    
}
