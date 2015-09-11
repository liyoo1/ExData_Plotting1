powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?",""),stringsAsFactors=FALSE) 
#reads data table

powerdates<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),] 
#subsets data from appropriate dates

powerdates$Time<-as.POSIXct(paste(powerdates$Date, powerdates$Time),format="%d/%m/%Y %H:%M:%S") 
#formats date and time into datetime

par(mfcol=c(2,2))  #creates matrix of 2 x 2 graphs, fills in by columns
with(powerdates, {
  plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="") 
  #creates scatterplot with tiny points and connecting lines
  plot(Time,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(Time,Sub_metering_2, type="l", col="red")
  lines(Time,Sub_metering_3,type="l",col="blue")
  legend("topright",lwd=1, cex=.8,bty="n",col=c("black","red","blue"),
              legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 
  #creates scatterplot with tiny points and connecting lines for Sub_metering_1
  #adds lines for Sub-metering_2 and Submetering_3 in red and blue
  #adds legend to upper right
  plot(Time, Voltage,type="l",ylab="Voltage",xlab="datetime")
  #creates line graph
  plot(Time,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
  #creates line graph
})
dev.copy(png,file="plot4.png")  # copies plot to png file