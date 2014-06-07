plot2 <- function (){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "a.zip")
        
        zip_fname <- "a.zip"
        raw_file <- unzip(zip_fname, list=TRUE)$Name
        filtered <- file()
        zz <- unz(zip_fname, raw_file)
        cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(zz), value=TRUE), sep="\n", file=filtered)
        
        
        d <- read.csv2(filtered)
        d$DateTime <- paste(d$Date, d$Time) 
        d$DateTime <- strptime(d$DateTime, format = "%d/%m/%Y %H:%M:%S")
        
        plot(d$DateTime, as.numeric(as.character(d$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
        dev.copy(png, file="plot2.png")
        plot(d$DateTime, as.numeric(as.character(d$Global_active_power)), type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
        
        dev.off()
        
        close(filtered) 
        close(zz)
}