##Get dataset
fulldata <- read.csv("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
fulldata$Date <- as.Date(fulldata$Date, format = "%d/%m/%Y")

##Subset dataset
data <- subset(fulldata, Date >= "2007-02-01" & Date <= "2007-02-02")

##Plot 1
hist(data$Global_active_power, col="red", xlab = "Global Active Power (Kilowatts)", main ="Global Active Power")

##Save to PNG
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()