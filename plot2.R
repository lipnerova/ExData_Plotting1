## Plot 2

# The data (household_power_consumption.txt) have to be in working directory!

library(lubridate)

#To get idea how the data look like:
prelimi<-read.table("household_power_consumption.txt", nrows=10, sep=";", header=T)

#To read just needed data (from 1st and 2nd of February 2007):
a<-read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";")
names(a)<-names(prelimi)
a$daytime<-dmy_hms(paste(a$Date, a$Time))

#2nd plot shows running of Global active power through target days:
png("plot2.png")

plot(Global_active_power~daytime, data=a, type="l", ylab="Global active power (kilowatts)",
     xlab=" ")

dev.off() 