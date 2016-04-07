##Get dataset
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
fulldata$Date <- as.Date(fulldata$Date, format = "%d/%m/%Y")

##Subset dataset
data <- subset(fulldata, Date >= "2007-02-01" & Date <= "2007-02-02")

##Manipulate datetime
Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English") #my computer is in Chinese, so change it to english

datetime <- paste(as.Date(data$Date), data$Time)
data$DateTime <- as.POSIXct(datetime)

##plot 4
par(mfrow=c(2,2), mar=c(4,4,2,2), oma=c(0,0,0,0))
plot(data$Global_active_power~data$DateTime, type ="l",
     ylab="Global Active Power", xlab="")
plot(data$Voltage~data$DateTime, type ="l",
     ylab="Voltage", xlab="datetime")
plot(data$Sub_metering_1~data$DateTime, type="l", ylab="Energy sub metering")
lines(data$Sub_metering_2~data$DateTime, type="l", col="red")
lines(data$Sub_metering_3~data$DateTime, type="l", col="blue")

legend("topright", col=c("black","red","blue"),lty=1, lwd=2,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data$Global_reactive_power~data$DateTime, type ="l",
     ylab="Global_reactive_power", xlab="datetime")

##Save to PNG
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()