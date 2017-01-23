# Peer-graded Assignment: Course Project 1
# Loading the data from the dates 2007-02-01 and 2007-02-02.
power<- read.table("household_power_consumption.txt", 
                   sep=";", stringsAsFactors = FALSE, header=TRUE)
power<- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

Sys.setlocale(category="LC_ALL", locale="english")
power[,c(3:8)]<-sapply(power[,c(3:8)], as.numeric)
power$datetime <- strptime(paste(power$Date, power$Time, sep=" "), 
                           "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
with(power, plot(datetime, Global_active_power, 
                 xlab="", 
                 ylab="Global Active Power (kilowatts)",
                 type="l"))
dev.off()
