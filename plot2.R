powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?",""),stringsAsFactors=FALSE) 
#reads data table

powerdates<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),] 
#subsets data from appropriate dates

powerdates$Time<-as.POSIXct(paste(powerdates$Date, powerdates$Time),format="%d/%m/%Y %H:%M:%S") 
#formats date and time into datetime

dateandgap<-powerdates[,2:3] #subsets data to datetime and Global active power columns

with(dateandgap,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")) 
#creates scatterplot with tiny points and connecting lines

dev.copy(png,file="plot2.png")  # copies plot to png file


