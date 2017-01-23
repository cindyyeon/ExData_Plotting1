# Peer-graded Assignment: Course Project 1
# Loading the data from the dates 2007-02-01 and 2007-02-02.
power<- read.table("household_power_consumption.txt", 
                   sep=";", stringsAsFactors = FALSE, header=TRUE)
power<- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power[,c(3:8)]<-sapply(power[,c(3:8)], as.numeric)
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="Orange")
dev.off()
