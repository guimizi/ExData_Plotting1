source("utils.R")

reactivePowerHist <- function(data) {
    hist(data$Global_active_power, xlab="Global acitve power (kilowatts)", col="red", main="Global Active Power")
}

#Function to generate plot1.png
buildPngPlot1 <- function() {
    buildPngPlot(reactivePowerHist, "plot1.png")    
}
