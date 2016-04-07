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

##Plot 2

plot(data$Global_active_power~data$DateTime, type ="l",
     ylab="Global Active Power (kilowatts)", xlab="")

##Save to PNG
dev.copy(png, file = "plot2.png", height=480, width=480)
dev.off()