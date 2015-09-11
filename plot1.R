## this code uses data from the household electric power consumption data from the UC
##Irvine Machine Learning Repository and creates a histogram of the Global Active Power
##column

powerdata<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings=c("?",""),stringsAsFactors=FALSE) #reads data table

powerdates<-powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"),] #subsets data from appropriate dates


globalactivepower<-subset(powerdates,select=Global_active_power) #subsets data to only Global active power column


hist(globalactivepower[,1], breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red",) #creates histogram

par(mar=c(5,5,3,1))  #widens margins around histogram

dev.copy(png,file="plot1.png")  # copies plot to png file