# Read data
x <- read.table("household_power_consumption.txt", na.strings="?", sep=";")

# Subset data
y <- x[x$V1 == "2/1/2007" | x$V1 == "2/2/2007", ]
 
colnames(y) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
y$"datetime" <- paste(y$"Date",y$"Time")
u <- as.POSIXct(y$"datetime", format="%m/%d/%Y %H:%M:%S",tz=Sys.timezone())

# Plot Canvas
plot(u, 2*as.numeric(as.vector(y[,"Sub_metering_3"])), xlab="", ylab="Energy sub_metering", type="n", col="black")

# Add graphs
points(u, as.numeric(as.vector(y[,"Sub_metering_1"])), xlab="", ylab="Energy sub_metering", type="l", col="black")
points(u, as.numeric(as.vector(y[,"Sub_metering_2"])), xlab="", ylab="Energy sub_metering", type="l", col="red")
points(u, as.numeric(as.vector(y[,"Sub_metering_3"])), xlab="", ylab="Energy sub_metering", type="l", col="blue")

# Add legend
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lwd=1, lty=1, cex=.75 )

# Copy to .png file.
dev.copy(device = png, filename = 'Plot3.png', width = 480, height = 480) 
dev.off()