plot1 <- function() {

	# download the data if not present
	if (!file.exists("household_power_consumption.zip")) {
		message("Downloading data")
		download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method = "curl")
	}
	
	# if the download failed and the file still isn't present, give up
	if (!file.exists("household_power_consumption.zip")) {
		stop("Unable to load data")
	}

	# open a connection to the data inside the ZIP
	con <- unz("household_power_consumption.zip", "household_power_consumption.txt")
	
	# load it into a data frame
	df <- read.table(con, header = TRUE, sep = ';', na.strings = '?')
	
	# cleanup
#	close(con)

	png(filename = "plot1.png")
	with(subset(df, Date == "2/2/2007" | Date == "1/2/2007"), hist(Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power"))
	dev.off()
}
