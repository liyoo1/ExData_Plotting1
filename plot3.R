powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?",""),stringsAsFactors=FALSE) 
#reads data table

powerdates<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),] 
#subsets data from appropriate dates

powerdates$Time<-as.POSIXct(paste(powerdates$Date, powerdates$Time),format="%d/%m/%Y %H:%M:%S") 
#formats date and time into datetime

dateandsubmetering<-powerdates[,c(2,7,8,9)] #subsets data to datetime and Sub metering columns

with(dateandsubmetering,plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")) 
#creates scatterplot with tiny points and connecting lines for Sub_metering_1

with(dateandsubmetering,lines(Time,Sub_metering_2, type="l", col="red"))
with(dateandsubmetering,lines(Time,Sub_metering_3,type="l",col="blue"))
#adds lines for Sub-metering_2 and Submetering_3 in red and blue

legend("topright",lwd=2, cex=.7,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#adds legend to upper right

dev.copy(png,file="plot3.png")  # copies plot to png file
