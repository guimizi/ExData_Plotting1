source("utils.R")

buildSubMeteringPlot <- function(data, legendBorder=T) {
    plot(data$dateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
    lines(data$dateTime, data$Sub_metering_2, col="red")
    lines(data$dateTime, data$Sub_metering_3, col="blue")   
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red","blue"), lwd=1, lty=c(1,1,1), 
       pch=c(NA,NA,NA),  bty = if(legendBorder) "o" else "n")

}

buildPngPlot3 <- function() {
    buildPngPlot(buildSubMeteringPlot, "plot3.png")    
}
