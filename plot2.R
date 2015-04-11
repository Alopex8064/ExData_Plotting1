# Read data
csvData <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)));

# Add date column, datetime column and filter
csvData$dateCol <- as.Date(csvData$Date, "%d/%m/%Y");
csvData$dateTimeCol <- as.POSIXct(paste(csvData$Date, csvData$Time), format="%d/%m/%Y %H:%M:%S");
filteredData <- csvData[csvData$dateCol == as.Date("01/02/2007", "%d/%m/%Y") | csvData$dateCol == as.Date("02/02/2007", "%d/%m/%Y"), ];

# Create png plot
png(file="plot2.png");
plot(type="l", ylab="Global Active Power (kilowatts)", xlab="", filteredData$dateTimeCol, filteredData$Global_active_power);
dev.off();
