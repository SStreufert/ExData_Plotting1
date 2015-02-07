# -----------------------------------------------------------------------
# load data frame & prepare data types
# -----------------------------------------------------------------------
hpc <- read.csv("~/Statistics/ExploratoryData/household_power_consumption.txt", sep=";", nrows=2075259, stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

# filter to the dates we care about
household_power_consumption <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

# convert Time field to proper Time-type
household_power_consumption$Time <- paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$Time <- strptime(household_power_consumption$Time, format="%d/%m/%Y %H:%M:%S")

# convert Date field to proper Date-type
household_power_consumption$Date <- as.Date(as.character(household_power_consumption$Date), "%d/%m/%Y")

# -----------------------------------------------------------------------
# Plot 4 - to PNG
# -----------------------------------------------------------------------
png("~/Statistics/ExploratoryData/plot4.png", width = 480, height = 480)
# set up graphic device for multiple plots
par( mfcol = c( 2, 2 ) )

# plot 2 but changed vlab
plot(household_power_consumption$Time, household_power_consumption$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(household_power_consumption$Time, household_power_consumption$Global_active_power, type="l")

# add plot 3 (but remove the box around the legend)
plot(household_power_consumption$Time, household_power_consumption$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_1, type="l", col="black")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_2, type="l", col="red")
lines(household_power_consumption$Time, household_power_consumption$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty="n")

# plot 4a
plot(household_power_consumption$Time, household_power_consumption$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(household_power_consumption$Time, household_power_consumption$Voltage, type="l", col="black")

# plot 4b
plot(household_power_consumption$Time, household_power_consumption$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(household_power_consumption$Time, household_power_consumption$Global_reactive_power, type="l", col="black")

# restore grphic device settings
dev.off()
par( mfcol = c( 1, 1 ) )
