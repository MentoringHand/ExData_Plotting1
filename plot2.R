plot2 <- function() {
  hps <- read.csv("~/R/workspace/household_power_consumption.txt", sep=";")
  hgap <- hps[hps$Date == "1/2/2007" | hps$Date == "2/2/2007", c("Date", "Time", "Global_active_power")]
  hgap[,"Global_active_power"] <- as.numeric(as.character(hgap[,"Global_active_power"]))
  hgap[,"Date"] <- as.POSIXct(strptime(as.character(paste(hgap[,"Date"], " ", hgap[,"Time"])), "%d/%m/%Y %H:%M:%S"))
  png("plot2.png", width = 480, height = 480)
  with(hgap, plot(Date, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))
  dev.off()
}