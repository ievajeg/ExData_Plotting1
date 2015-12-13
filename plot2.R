# Read data 
lines <- readLines("household_power_consumption.txt")
myHeaders <- unlist(strsplit(lines[1], "[;]"))
selectedLines1 <- grep("1/2/2007", substr(lines,1,8))
selectedLines2 <- grep("2/2/2007", substr(lines,1,8))
data <- read.table(text=lines[c(selectedLines1, selectedLines2)],header=FALSE,sep=";",col.names = myHeaders,na.strings = "?")

# Use date-time conversion functions to represent Date and time.
data$DateTime = as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))


# Make plot2. When using POSIXct format for Date and time, the tick labels on the x 
# axis will be displayed as abbreviated Weekday names. 
png(file="plot2.png",width=504,height=504,res=72)
plot(data$DateTime, data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
