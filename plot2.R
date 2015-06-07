# Read data
x <- read.table("household_power_consumption.txt", na.strings="?", sep=";")

# Subset data
y <- x[x$V1 == "1/2/2007" | x$V1 == "2/2/2007", ]
u <- as.numeric(as.vector(y[ ,3]))
colnames(y) <- c( "Date", "Time", "Global_active_power", "Global_reactive_power Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "SSub_metering_3")

# Add datetime class column
y$"datetime" <- paste(y$"Date", y$"Time")

# Plot
plot(as.POSIXct(y$"datetime", format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone()), u, type="l", xlab="", ylab="Global Active Power (kilowatts)")
 

# Copy to .png file
dev.copy(device = png, filename = 'Plot2.png', width = 480, height = 480) 
dev.off()


