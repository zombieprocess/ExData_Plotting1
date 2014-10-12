
# Code to plot a histigram of Global Active Power in kilowatts.
# This is the same code for screen and exporting to a PNG.

# Notes:
# Depending on the size of your window, you may or might not see the '1200' on 
# the frequency scale. Resize to a larger window if displaying to screen.

xname <- "Global Active Power (kilowatts)"
histname <- "Global Active Power"

# Reset view to default
par(mfrow=c(1,1), mar = c(5,4,4,2))

hist(data$Global_active_power,breaks=12,col="red",main = histname, xlab = xname)
