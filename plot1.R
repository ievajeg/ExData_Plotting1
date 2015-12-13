
# Read data 
lines <- readLines("household_power_consumption.txt")
myHeaders <- unlist(strsplit(lines[1], "[;]"))
selectedLines1 <- grep("1/2/2007", substr(lines,1,8))
selectedLines2 <- grep("2/2/2007", substr(lines,1,8))
data <- read.table(text=lines[c(selectedLines1, selectedLines2)],header=FALSE,sep=";",col.names = myHeaders,na.strings = "?")

# Open the device machine using png() function in order to save the plot; 
# I use png() instead of dev.copy(png..), becasue this way you can reproduce
# the plot and there is no need to change the font size. Also, legends are displayed correctly and not cropped. 
png(file="plot1.png",width=504,height=504,res=72)
# Make plot1
# The font in the plots seems to be smaller than default, so use cex to reduce the font size
hist(data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
# close the device
dev.off()

