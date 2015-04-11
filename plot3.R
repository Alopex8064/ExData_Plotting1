# Read data
csvData <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)));

# Add date column, datetime column and filter
csvData$dateCol <- as.Date(csvData$Date, "%d/%m/%Y");
csvData$dateTimeCol <- as.POSIXct(paste(csvData$Date, csvData$Time), format="%d/%m/%Y %H:%M:%S");
filteredData <- csvData[csvData$dateCol == as.Date("01/02/2007", "%d/%m/%Y") | csvData$dateCol == as.Date("02/02/2007", "%d/%m/%Y"), ];

# Create png plot
png(file="plot3.png");
plot(type="l", ylab="Energy sub metering", xlab="", filteredData$dateTimeCol, filteredData$Sub_metering_1, col="black");
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1));
lines(filteredData$dateTimeCol, filteredData$Sub_metering_2, col="red");
lines(filteredData$dateTimeCol, filteredData$Sub_metering_3, col="blue");
dev.off();
