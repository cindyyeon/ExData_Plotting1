# Peer-graded Assignment: Course Project 1
# Loading the data from the dates 2007-02-01 and 2007-02-02.
power<- read.table("household_power_consumption.txt", 
                   sep=";", stringsAsFactors = FALSE, header=TRUE)
power<- subset(power, Date %in% c("1/2/2007", "2/2/2007"))

Sys.setlocale(category="LC_ALL", locale="english")
power[,c(3:8)]<-sapply(power[,c(3:8)], as.numeric)
power$datetime <- strptime(paste(power$Date, power$Time, sep=" "), 
                           "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# 1st Plot
with(power, plot(datetime, Global_active_power, 
                 xlab="", 
                 ylab="Global Active Power",
                 type="l"))
# 2nd Plot
with(power, plot(datetime, Voltage, type="l"))
# 3rd Plot
with(power, plot(datetime, Sub_metering_1, type="l", 
                 ylab="Energy sub metering"))
with(power, lines(datetime, Sub_metering_2, col="red"))
with(power, lines(datetime, Sub_metering_3, col="blue"))  
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th Plot
with(power, plot(datetime, Global_reactive_power, type="l"))
dev.off()
