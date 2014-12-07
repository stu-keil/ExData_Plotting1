##Construct plot3.png
localpath<-"./CourseProject1/"
filename <- "household_power_consumption.txt"
filepath<- paste(localpath,filename,sep="")
data <- read.table(filepath,header=TRUE,sep=";",na.strings="?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

day1 <- subset(data,data$Date == ("2007-02-01"))
day2 <- subset(data,data$Date == ("2007-02-02"))
household.energy <- rbind(day1,day2)
paste(household.energy$Date,household.energy$Time,sep=" ")
household.energy$Time <- strptime(paste(household.energy$Date,household.energy$Time,sep=" "),format = "%Y-%m-%d %H:%M:%S")
for(i in 3:9) {
  household.energy[,i] <- as.numeric(household.energy[,i])
}


png(filename="./CourseProject1/plot3.png", width = 480, height = 480)
with(household.energy,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=" "))
with(household.energy,points(Time,Sub_metering_2,type="l",col="red"))
with(household.energy,points(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty = 1,legend = names(household.energy)[c(7:9)],col = c("black","red","blue"))
dev.off()

