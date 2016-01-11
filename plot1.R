plot1 <- function() {
  hps <- read.csv("~/R/workspace/household_power_consumption.txt", sep=";")
  hgap <- hps[hps$Date == "1/2/2007" | hps$Date == "2/2/2007", c("Global_active_power")]
  hgap <- as.numeric(as.character(hgap))
  png("plot1.png", width = 480, height = 480)
  hist(hgap, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", ylim = c(0,1200))
  dev.off()
}