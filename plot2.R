# Line plot the Global Active Power in kilowatts over the time period 
# midnight 2007-02-01 to 11:59pm 2007-02-02.

yname <- "Global Active Power (kilowatts)"

# Reset view to default
par(mfrow=c(1,1), mar = c(5,4,4,2))

with(data,plot(Date_Time,Global_active_power,type="l",xlab="",ylab = yname))