# Read data
x <- read.table("household_power_consumption.txt", na.strings="?", sep=";")
# Subset data
y <- x[x$V1 == "2/1/2007" | x$V1 == "2/2/2007", ]
u <- as.vector(y[ ,3])
u <- as.numeric(u)
# Draw Histogram
hist(u, main="Global_active_power", xlab="Global_active_power (kilowatts)")
# Copy to png
dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480) 
dev.off()