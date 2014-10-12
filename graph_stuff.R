setwd("~/sandbox/exdata-007/project1/ExData_Plotting1")
#data <- NULL

# Summary:
# Helper code to get and tidy the data, and create plot 1 through 4.

# Functions:
# getdata()      - Pulls the data down and tries to unzip the file. (broken, please use manual method)
# readdata()     - Function to read and tidy the data. Assumes data is in ~<getwd()>/data.
# print2screen() - Initializes Quartz to see any plots on the screen device.
# printall2png() - Assuming you have the data loaded using readdata(), it prints all plots to files.
# plot1()        - Plot #1
# plot2()        - Plot #2
# plot3()        - Plot #3
# plot4()        - Plot #4


# Attempt to download the data and unzip it.
#
# Note: This currently isn't very reliable.(BROKEN) Ran out of time to fix this,
#       I highly recommend downloading and unziping the data file to ~<getwd()>/data
get_data <- function() {
  if (!file.exists("data")) {
    dir.create("data")
  }
  
  # If the file is not downloaded, grab it, and unzip it
  if(!file.exists("./data/household_power_consumption.txt")) {
    tempFile <-tempfile()
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileUrl, destfile = tempFile, method = "curl")
    dateDownloaded <- date()
    unz(tempFile,"./data/household_power_consumption.txt") ## usage? Broken here <-------
    unlink(tempFile)
    #list.files("./data")
  }

}

# Function to read and tidy the data.
read_data <- function() {
  
  # Read in the raw data, all of it, which will take some time. NA strings are "?"
  data <<- read.table("./data/household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE,na.strings="?")
  
  # Tidy the date/time, converting strings to POSIXtime, renaming a column, and dropping unused column "Date".
  data$Time <<- strptime(paste(as.character(data$Date),as.character(data$Time)),"%d/%m/%Y %X")
  data <<- subset(data,select= -Date)
  colnames(data)[1] <<- "Date_Time"
  
  # Select only the times between midnight 2007-02-01 and 11:59pm 2007-02-02
  data <<- subset(data, data$Date_Time >= as.POSIXlt("2007-02-01") & data$Date_Time < as.POSIXlt("2007-02-03"))
}

# Get Quartz running, if on a Mac
print2screen <- function(screen = 1) {
  quartz(title = "Graph Stuff")
  dev.set(screen)
}

# Print all the plots to PNG files! 
printall2png <- function(data) {
  
  # Print plot1 to file.
  png(filename = "./plot1.png")
  plot1(data)
  dev.off()
  
  # Print plot2 to file.
  png(filename = "./plot2.png")
  plot2(data)
  dev.off()
  
  # Print plot3 to file.
  png(filename = "./plot3.png")
  plot3(data)
  dev.off()
  
  # Print plot4 to file.
  png(filename = "./plot4.png")
  plot4(data)
  dev.off()
}

plot1 <- function(data) {
  source("./plot1.R")
}

plot2 <- function(data) {
  source("./plot2.R")
}

plot3 <- function(data) {
  source("./plot3.R")
}

plot4 <- function(data) {
  source("./plot4.R")
}