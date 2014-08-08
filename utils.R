library(data.table)

downloadFile <- function(url, fileName, workDir="./temp") {
    checkDir(workDir)
    filePath <- paste(workDir,fileName, sep="/")
    if(!file.exists(filePath)){
        download.file(url, filePath, mode="wb")
    }
    filePath
}

checkDir <- function(directory) {
    if(!file.exists(directory)) {
        dir.create(directory);
    }
}

unzipFile <- function(filePath,toDir="./temp") {
    unzip(filePath, exdir=toDir)
    dir(path=toDir,pattern="*.txt", full.names=T)[1]
}

loadData <- function(fileName="") {
    all <- fread(fileName, na.strings="?", colClasses=list(character=1:9),verbose=T)
    data <- all[ which(all$Date %in% c("1/2/2007","2/2/2007")), ]
    data
}

init <- function() {
    Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
}

getData <- function() {
    init()
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    fileName <- "house_hold_power_consumption.zip"
    filePath <- downloadFile(url, fileName);
    unzippedFilePath <- unzipFile(filePath)
    addDateTimeColumn(setColumnClasses(loadData(unzippedFilePath)))
}

setColumnClasses <- function(data) {
    data <- data[, Global_active_power:=as.numeric(Global_active_power)]
    data <- data[, Global_reactive_power:=as.numeric(Global_reactive_power)]
    data <- data[, Voltage:=as.numeric(Voltage)]
    data <- data[, Global_intensity:=as.numeric(Global_intensity)]
    data <- data[, Sub_metering_1:=as.numeric(Sub_metering_1)]
    data <- data[, Sub_metering_2:=as.numeric(Sub_metering_2)]
    data <- data[, Sub_metering_3:=as.numeric(Sub_metering_3)]
    data
}

addDateTimeColumn <- function(data) {
    dateTime <- strptime( paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data$dateTime <- as.POSIXct(dateTime)
    data
}

buildPngPlot <- function(plotFun, destFile, destDir="./plots") {
    checkDir(destDir)
    filePath <- paste(destDir,destFile, sep="/")
    png(filename=filePath, width= 480, height= 480, units="px", bg = "transparent")
    do.call(plotFun,list(getData()))
    dev.off()
}


