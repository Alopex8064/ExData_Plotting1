# Read data
csvData <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)));

# Add date column, datetime column and filter
csvData$dateCol <- as.Date(csvData$Date, "%d/%m/%Y");
csvData$dateTimeCol <- as.POSIXct(paste(csvData$Date, csvData$Time), format="%d/%m/%Y %H:%M:%S");
filteredData <- csvData[csvData$dateCol == as.Date("01/02/2007", "%d/%m/%Y") | csvData$dateCol == as.Date("02/02/2007", "%d/%m/%Y"), ];

# Create png plot
png(file="plot4.png");
par(mfrow=c(2,2))

# Plot1
plot(type="l", ylab="Global Active Power", xlab="", filteredData$dateTimeCol, filteredData$Global_active_power);

# Plot2
plot(type="l", ylab="Voltage", xlab="datetime", filteredData$dateTimeCol, filteredData$Voltage);

# Plot3
plot(type="l", ylab="Energy sub metering", xlab="", filteredData$dateTimeCol, filteredData$Sub_metering_1);
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1), bty = "n");
lines(filteredData$dateTimeCol, filteredData$Sub_metering_2, col="red");
lines(filteredData$dateTimeCol, filteredData$Sub_metering_3, col="blue");


# Plot4
plot(type="l", ylab="Global_reactive_power", xlab="datetime", filteredData$dateTimeCol, filteredData$Global_reactive_power);

dev.off();
