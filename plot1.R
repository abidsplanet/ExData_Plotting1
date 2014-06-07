plot1 <- function (){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl, destfile = "a.zip")
        zip_fname <- "a.zip"
        raw_file <- unzip(zip_fname, list=TRUE)$Name
        filtered <- file()
        zz <- unz(zip_fname, raw_file)
        
        cat(grep("(^Date)|(^[1|2]/2/2007)",readLines(zz), value=TRUE), sep="\n", file=filtered)
        d <- read.csv2(filtered)
        hist(as.numeric(as.character(d$Global_active_power)), main ="Global Active Power", xlab ="Global Active Power (kilowatts)", col = "red")
        dev.copy(png, file="plot1.png")
        hist(as.numeric(as.character(d$Global_active_power)), main ="Global Active Power", xlab ="Global Active Power (kilowatts)", col = "red")
        dev.off()
        close(filtered) 
        close(zz)
}