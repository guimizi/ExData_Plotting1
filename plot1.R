source("utils.R")

reactivePowerHist <- function(data) {
    hist(data$Global_active_power, xlab="Global acitve power (kilowatts)", col="red", main="Global Active Power")
}

buildPngPlot1 <- function() {
    buildPngPlot(reactivePowerHist, "plot1.png")    
}
