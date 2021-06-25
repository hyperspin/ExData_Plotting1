#plot1
pwr <- read.csv("household_power_consumption.txt", sep= ";")
pwr <- na.omit(pwr)
pwrsub <- pwr
pwrsub$Date <- strptime(pwr$Date, "%d/%m/%Y")
pwrsub <- subset(pwrsub, (pwrsub$Date >= "2007-02-01" & pwrsub$Date <= "2007-02-02"))
#global_active_power <- as.numeric(pwrsub$Global_active_power)
png("plot1.png",
    width  = 480,
    height = 480)
hist(as.numeric(pwrsub$Global_active_power), col="red", xlab =" Global Active Power (Kilowatts)", main="Global Active Power")
#dev.copy(png, file="plot1.png",width=480, height= 480,units= "px")
dev.off()
