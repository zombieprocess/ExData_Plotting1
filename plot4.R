# Combination plot, which summarizes a number of views of the sample data.

# Various labels
plot1_yname <- "Global Active Power"
plot2_yname <- "Voltage"
plot3_yname <- "Energy sub metering"
dateTime <- "datetime"

# Customized layout
par(mfrow=c(2,2), mar = c(5,4,2,1))

with(data, {
  plot(Date_Time,Global_active_power,type="l",xlab="",ylab = plot1_yname)
  plot(Date_Time,Voltage,xlab=dateTime,type="l")
{
    plot(Date_Time,Sub_metering_1,type="l",col = "black",xlab="",ylab = ylabel)
    lines(Date_Time,Sub_metering_2,col = "red",xlab="")
    lines(Date_Time,Sub_metering_3,col = "blue",xlab="")
    legend("topright", lwd=c(1,1), col = c("black","red","blue"), bty = "n",
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  }  
plot(Date_Time,Global_reactive_power,type="l",xlab=dateTime,col="black")
})