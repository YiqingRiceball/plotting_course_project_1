## Read Data
## Set working directory
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
#Create a png file called plot1 that is 480-pixel wide and 480-pixel high
#in current working directory
png(filename = "/Users/defaultuser/Desktop/Exploratory Data Analysis/course project 1/graphics/plot1.png",
    width = 480, 
    height = 480)

# Set the font size of the plot
par(ps=14)

# Create a histogram using "time"  as the x axis and 
# "Global_active_power" as the y axis
hist(data$Global_active_power,
     col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()