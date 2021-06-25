#plot2.R
library(tidyverse)
library(dplyr)
library(lubridate)
pwr <- read.csv("household_power_consumption.txt", sep= ";")
pwr <- na.omit(pwr)
pwrsub <- pwr
pwrsub$Date <- strptime(pwr$Date, "%d/%m/%Y")
pwrsub <- subset(pwrsub, (pwrsub$Date >= "2007-02-01" & pwrsub$Date <= "2007-02-02"))
pwrsub <- mutate(pwrsub, days = ymd_hms(paste(Date, Time)))
png("plot2.png",
    width  = 480,
    height = 480)

plot(as.numeric(pwrsub$Global_active_power) ~ pwrsub$days, type= "l",xlab="", ylab=" Global Active Power (kilowatts)")
dev.off()
