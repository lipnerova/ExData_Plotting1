## Plot 1

# The data (household_power_consumption.txt) have to be in working directory!

library(lubridate)

#To get idea how the data look like:
prelimi<-read.table("household_power_consumption.txt", nrows=10, sep=";", header=T)

#To read just needed data (from 1st and 2nd of February 2007):
a<-read.table(pipe("findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt"), sep=";")
names(a)<-names(prelimi)
a$daytime<-dmy_hms(paste(a$Date, a$Time))


#1st plot is a histogram of Global active power:
png("plot1.png")

hist(a$Global_active_power, main="Global Active Power", xlab="Global active power (kilowatts)", 
     col="red", lab=c(5, 7, 7))

dev.off() 