# Line plot of Energy sub metering of all 3 sub metering measurements over
# the time period of the sample data. midnight 2007-02-01 and 11:59pm 2007-02-02

ylabel <- "Energy sub metering"

# Reset view to default
par(mfrow=c(1,1), mar = c(5,4,4,2))

with(data, {
  plot(Date_Time,Sub_metering_1,type="l",col = "black",xlab="",ylab = ylabel)
  lines(Date_Time,Sub_metering_2,col = "red",xlab="")
  lines(Date_Time,Sub_metering_3,col = "blue",xlab="")
  legend("topright", lwd=c(2,2), col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})