# Read data 
lines <- readLines("household_power_consumption.txt")
myHeaders <- unlist(strsplit(lines[1], "[;]"))
selectedLines1 <- grep("1/2/2007", substr(lines,1,8))
selectedLines2 <- grep("2/2/2007", substr(lines,1,8))
data <- read.table(text=lines[c(selectedLines1, selectedLines2)],header=FALSE,sep=";",col.names = myHeaders,na.strings = "?")

# Use date-time conversion functions to represent Date and time.
data$DateTime = as.POSIXct(strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S"))

# Make plot3
png(file="plot3.png",width=504,height=504,res=72)
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black","red","blue"))
dev.off()