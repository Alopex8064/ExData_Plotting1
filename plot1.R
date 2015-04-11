# Read data
csvData <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", colClasses=c("character", "character", rep("numeric", 7)));

# Add date column and filter
csvData$dateCol <- as.Date(csvData$Date, "%d/%m/%Y");
filteredData <- csvData[csvData$dateCol == as.Date("01/02/2007", "%d/%m/%Y") | csvData$dateCol == as.Date("02/02/2007", "%d/%m/%Y"), ];

# Create png plot
png(file="plot1.png");
hist(filteredData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main=NULL);
title("Global Active Power");
dev.off();
