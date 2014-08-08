source("utils.R")

globalActivePowerPlot <- function(data) {
    plot(data$dateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
}

buildPngPlot2 <- function() {
    buildPngPlot(globalActivePowerPlot, "plot2.png")    
}
