plot3 <- function (){
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
        
        plot(d$DateTime, as.numeric(as.character(d$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab="")
        dev.copy(png, file="plot3.png")
        plot(d$DateTime, as.numeric(as.character(d$Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab="")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=1,col=c("black","red","blue"),ncol=1,cex=0.8, bty="1", inset =c(0,0), text.col=c("black"))
        lines(d$DateTime, as.numeric(as.character(d$Sub_metering_2)), col= "red")
        lines(d$DateTime, as.numeric(as.character(d$Sub_metering_3)), col = "blue")
        
        dev.off()
        
        close(filtered) 
        close(zz)
}