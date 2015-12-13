
# load data into memory   
elconsump <- read.table("elconsump/household_power_consumption.txt", sep = ";", header = TRUE) 
elconsump$Date <- as.Date(elconsump$Date, format("%d/%m/%Y")) 

# format and choose appropriate dates 
inPeriod <- elconsump$Date >= "2007-02-01" & elconsump$Date <= "2007-02-02" 
elconsump <- elconsump[inPeriod, ]  
elconsump$DateTime <- paste(elconsump$Date, elconsump$Time) 
elconsump$DateTime <- as.POSIXct(elconsump$DateTime, format = "%Y-%m-%d %H:%M:%S") 

# saves third plot to png file  
png("plot3.png", width = 480, height = 480)
elconsump$Sub_metering_1 <- as.numeric(as.character(elconsump$Sub_metering_1)) 
elconsump$Sub_metering_2 <- as.numeric(as.character(elconsump$Sub_metering_2)) 
elconsump$Sub_metering_3 <- as.numeric(as.character(elconsump$Sub_metering_3)) 
par(mar = c(4, 4, 1, 1)) 
with(elconsump, plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering"))  
with(elconsump, lines(DateTime, Sub_metering_2, col = "red", type = "l")) 
with(elconsump, lines(DateTime, Sub_metering_3, col = "blue", type = "l"))  
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch =  NULL, lty = 1)   
dev.off()  
