
# load data into memory   
elconsump <- read.table("elconsump/household_power_consumption.txt", sep = ";", header = TRUE) 
elconsump$Date <- as.Date(elconsump$Date, format("%d/%m/%Y")) 

# format and choose appropriate dates 
inPeriod <- elconsump$Date >= "2007-02-01" & elconsump$Date <= "2007-02-02" 
elconsump <- elconsump[inPeriod, ]  
elconsump$DateTime <- paste(elconsump$Date, elconsump$Time) 
elconsump$DateTime <- as.POSIXct(elconsump$DateTime, format = "%Y-%m-%d %H:%M:%S") 

# change types of features required for plots 
elconsump$Global_active_power <- as.numeric(as.character(elconsump$Global_active_power)) 

# changes margin parameters of par library  
par(mar = c(4, 4, 1, 1)) 

# saves first plot to png device  
png("plot1.png", width = 480, height = 480)
with(elconsump, hist(Global_active_power, col = "red", main = "Global Active Power", n = 15, xlab = "Global Active Power (kilowatts)", ylab = "Frequency")) 
dev.off() 

