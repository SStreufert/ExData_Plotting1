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
# Plot 1 - to PNG
# -----------------------------------------------------------------------
png("~/Statistics/ExploratoryData/plot1.png", width = 480, height = 480)
hist(as.numeric(household_power_consumption$Global_active_power),col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
