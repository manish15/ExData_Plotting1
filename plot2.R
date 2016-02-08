## Reading data from txt file. The data folder should in the same directory.

data_full <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Take only 2 days of data using subset
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

attach(data)
x <- paste(Date, Time)
data$Datetime <- as.POSIXct(x)


## Creating Plot2 image
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

