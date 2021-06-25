#plot 3
library(tidyverse)
library(dplyr)
library(lubridate)
pwr <- read.csv("household_power_consumption.txt", sep= ";")
pwr <- na.omit(pwr)
pwrsub <- pwr
pwrsub$Date <- strptime(pwr$Date, "%d/%m/%Y")
pwrsub <- subset(pwrsub, (pwrsub$Date >= "2007-02-01" & pwrsub$Date <= "2007-02-02"))
pwrsub <- mutate(pwrsub, days = ymd_hms(paste(Date, Time)))
png("plot3.png",
    width  = 480,
    height = 480)
plot(as.numeric(pwrsub$Sub_metering_1) ~ pwrsub$days, type="l", xlab ="", ylab= "Energy sub metering")
lines(as.numeric(pwrsub$Sub_metering_2) ~ pwrsub$days, col= "red", type="l")
lines(as.numeric(pwrsub$Sub_metering_3) ~ pwrsub$days, col= "blue", type="l")
legend("topright",
       col = c("black",
               "red",
               "blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty = 1)

dev.off()

