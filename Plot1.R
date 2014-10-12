## Load the full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data_subset <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Remove the full data set
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data_subset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
