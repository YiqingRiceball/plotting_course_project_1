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
#Create a png file called plot4 that is 480-pixel wide and 480-pixel high
#in current working directory
png(filename = "/Users/defaultuser/Desktop/Exploratory Data Analysis/course project 1/graphics/plot4.png",
    width = 480, 
    height = 480)

# Creat a 2-row and 2-column plot
par(mfrow=c(2,2))

# Add the graphic on top left

# Create a plot using "time" column as the x axis and 
# "Global_active_power" as the y axis
plot(time,data$Global_active_power,
     xlab=" ", 
     ylab="Global Active Power (kilowatts)",
     type="l")


# Add the graphic on top right

# Create a plot using "time" as the x axis and 
# "Voltage" as the y axis
plot(time,data$Voltage,
     xlab="datetime", 
     ylab="Voltage",
     type="l")


# Add the graphic on bottom left

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
# Specify the content of the lengend box. 
# Set the width of the legend box to "0" using box.lwd and adjust the size of 
# the box using "cex"
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lwd=1,
       box.lwd=0,
       cex=0.6)

# Add the graphic on bottom right

# Create a plot using "time" as the x axis and 
# "Global_reactive_power" as the y axis
plot(time,data$Global_reactive_power,
     xlab="datetime", 
     ylab="Global_reactive_power",
     type="l")

dev.off()
