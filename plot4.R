plot4 <- function() {
  hps <- read.csv("~/R/workspace/household_power_consumption.txt", sep=";")
  hgap <- hps[hps$Date == "1/2/2007" | hps$Date == "2/2/2007", ]
  hgap[,"Global_active_power"] <- as.numeric(as.character(hgap[,"Global_active_power"]))
  hgap[,"Global_reactive_power"] <- as.numeric(as.character(hgap[,"Global_reactive_power"]))
  hgap[,"Voltage"] <- as.numeric(as.character(hgap[,"Voltage"]))
  hgap[,"Sub_metering_1"] <- as.numeric(as.character(hgap[,"Sub_metering_1"]))
  hgap[,"Sub_metering_2"] <- as.numeric(as.character(hgap[,"Sub_metering_2"]))
  hgap[,"Sub_metering_3"] <- as.numeric(as.character(hgap[,"Sub_metering_3"]))
  hgap[,"Date"] <- as.POSIXct(strptime(as.character(paste(hgap[,"Date"], " ", hgap[,"Time"])), "%d/%m/%Y %H:%M:%S"))
  png("plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2, 2))
  
  with(hgap, plot(Date, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "" ))
  with(hgap, plot(Date, Voltage, type = "l", ylab = "Voltage", xlab = "datetime" ))
  
  with(hgap, plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "" ))
  with(hgap, lines(Date, Sub_metering_2, col= "Red"))
  with(hgap, lines(Date, Sub_metering_3, col= "Blue"))
  legend("topright", lty = c(1,1,1), lwd=c(2.5,2.5), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(hgap, plot(Date, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime" ))
  
  dev.off()
}