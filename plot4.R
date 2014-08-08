source("plot1.R")
source("plot2.R")
source("plot3.R")

buildVoltagePlot <- function(data) {
    plot(data$dateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
}

buildGlobalReactivePowerPlot <- function(data) {
    plot(data$dateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    
}

buildCombinedPlot <- function(data) {
    par(mfrow=c(2,2))
    globalActivePowerPlot(data)
    buildVoltagePlot(data)
    buildSubMeteringPlot(data, F)
    buildGlobalReactivePowerPlot(data)
}

run <- function() {
    buildCombinedPlot(getData())
}

buildPngPlot4 <- function() {
    buildPngPlot(buildCombinedPlot, "plot4.png")    
}
