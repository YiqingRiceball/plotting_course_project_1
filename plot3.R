## Read Data
# Set working directory
setwd("./Desktop/Exploratory Data Analysis")
# Read in data
f_data<-read.table("household_power_consumption.txt",
                   header=TRUE,sep=";",
                   colClasses=c("character","character",rep("numeric",7)),
                   na.strings="?")
# Extract observation that are made during 2007-2-1 and 2007-2-2
data<-subset(f_data,Date=="1/2/2007"|Date=="2/2/2007")
# Extract time data from the "Date" column and "Time" column
# and store the time information in a list called "time" 
time<-strptime(paste(data$Date,data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

##Add and Save Plot
#Create a png file called plot3 that is 480-pixel wide and 480-pixel high
#in current working directory
png(filename = "/Users/defaultuser/Desktop/Exploratory Data Analysis/course project 1/graphics/plot3.png",
    width = 480, 
    height = 480)

# Set the font size of the plot
par(ps=14)
# Build an empty plot passing the data from "time" and "Sub_metering_1", 
# because "Sub_metering_1" has the largest value among "Sub_metering_1",
# "Sub_metering_2" and "Sub_metering_3".
plot(time,data$Sub_metering_1,xlab=" ",  ylab="Energy sub metering",type="n")
# Add the line representing "Sub_metering_1"
lines(time,data$Sub_metering_1,col="black")
# Add the line representing "Sub_metering_2"
lines(time,data$Sub_metering_2,col="red")
# Add the line representing "Sub_metering_3"
lines(time,data$Sub_metering_3,col="blue")
# Specify the content of the lengend box
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1)

dev.off()