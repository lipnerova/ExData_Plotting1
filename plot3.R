## Plot 3

# The data (household_power_consumption.txt) have to be in working directory!

library(lubridate)

#To get idea how the data look like:
prelimi<-read.table("household_power_consumption.txt", nrows=10, sep=";", header=T)

#To read just needed data (from 1st and 2nd of February 2007):
a<-read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";")
names(a)<-names(prelimi)
a$daytime<-dmy_hms(paste(a$Date, a$Time))

#3rd plot shows running of three Sub meterings in target days with proper legend:
png("plot3.png")

plot(Sub_metering_1~daytime, data=a, type="l", ylab="Energy sub metering", xlab=" ")
lines(Sub_metering_2~daytime, data=a, col="red")
lines(Sub_metering_3~daytime, data=a, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

dev.off()