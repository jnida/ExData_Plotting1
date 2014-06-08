## This file reads in the data  for "Exploratory Data Analysis" project 1,
## constructs plot1, and saves it as a png file


## This function reads in the data
readProj1Data = function(file) {
        ## read in the raw data
        data = read.table(file, header=T, sep=";", na.strings="?")

        ## combine the date and time
        data$dateTime = paste(data$Date, data$Time)

        ## convert the date and time
        data$Date = strptime(data$Date, "%d/%m/%Y")

        ## get subset of the data
        day1 = strptime("2007-02-01", "%Y-%m-%d")
        day2 = strptime("2007-02-02", "%Y-%m-%d")
        subset = subset(data, Date == day1 | Date == day2)

        ## convert the dateTime
        subset$dateTime = strptime(subset$dateTime, "%d/%m/%Y %H:%M:%S")

        ## return the results
        subset
}


## This function creates a png file of a plot3
createPlot3 = function() {
        proj1Data = readProj1Data("data/household_power_consumption.txt")

        ## create the plot
        png(file="plot3.png")
       	plot(proj1Data$dateTime, proj1Data$Sub_metering_1, type="l", xlab="",
                ylab="Energy sub metering")
        with(proj1Data, points(dateTime, Sub_metering_2, type="l", xlab="",
                ylab="Energy sub metering", col="red"))
        with(proj1Data, points(dateTime, Sub_metering_3, type="l", xlab="",
                ylab="Energy sub metering", col="blue"))
        legend("topright", lty=1, lwd=1, col=c("black", "red", "blue"),
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}
