# Read data
x <- read.table("household_power_consumption.txt", na.strings="?", sep=";")
# Subset data
y <- x[x$V1 == "2/1/2007" | x$V1 == "2/2/2007", ]
u <- as.numeric(as.vector(y[ ,3]))
# Add datetime class column
y$"datetime" <- paste(y$"Date",z$"Time")
# Plot
plot(as.POSIXct(z$"datetime", format="%m/%d/%Y %H:%M:%S",tz=Sys.timezone()), u, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Copy to .png file
dev.copy(device = png, filename = 'Plot2.png', width = 480, height = 480) 
dev.off()


