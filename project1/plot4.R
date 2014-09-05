########################################################################
## File Name : plot4.R (written on windows7)
## Writer : KS
## Last Update : 2014.Sept.04
##
## Data Description :
## Please refer to README here: 
## https://github.com/rdpeng/ExData_Plotting1
## https://github.com/HattrickNZ/ExData_Plotting1 (forked here)
##
## Program Desciption :
## Please refer to README here: 
## https://github.com/rdpeng/ExData_Plotting1
## https://github.com/HattrickNZ/ExData_Plotting1 (forked here)
## 
##
## How To Run Code
## source("plot4.R")
## plot4()
##
########################################################################


plot4 <- function() {
  
  ########################################################################
  ## Declare Variables 
  fName<-"plot4.png"
  #gTitle<-"Global Active Power"
  #gColour<-"red"
  xLabel<-""
  yLabel<-"Energy sub metering"
  
  ########################################################################
  ## 0. wouuld like to download the file and unzip it in this script
  ## but for now i will assume it is in the directory and unzipped 
  ## TO DO:: 
  
  ########################################################################
  ## 1. Get The Column Names 
  dfcn <- read.table("household_power_consumption.txt",sep=";", header=TRUE,nrow=5) #df for column names 
  colNames <- names(dfcn)
  
  ########################################################################
  ## 2. Get A Subset if the Data
  fh<-file("household_power_consumption.txt","r"); ## open connection to file
  DF<-read.table(text = grep("^[1,2]/2/2007",readLines(fh),value=TRUE),header = TRUE,sep=";") # only interesed in 1 and 2nd of Feb 2007
  close(fh)   ## close the connection
  ########################################################################
  ## 3. Name The DF Column Headers/Variables 
  names(DF)<- colNames
  
  ########################################################################
  ## 3A. Make an alt date format in this format "%Y-%m-%d %H:%M:%S" 
  
  DateHMS<-paste(DF$Date,DF$Time) 
  #print(class(DateHMS[1:5]))
  #print(DateHMS[1:5])
  DateHMS<-strptime(DateHMS,"%d/%m/%Y %H:%M:%S")
  DF<-cbind(DateHMS,DF)
  
  ########################################################################
  ## 4. Draw The Graph & Write THe Graph To File
  png(file=fName,width = 480, height = 480) ## Open PNG device; create fName PNG file in my working directory
  par(mfrow = c(2, 2)) 
  ## plot1 
  plot(DF$DateHMS,DF$Global_active_power,type="l", xlab = "", ylab = "Global Active Power" )
  ## plot2 
  plot(DF$DateHMS,DF$Voltage,type="l", xlab = "datetime", ylab = "Voltage" )
  ## plot3 
  with(DF,plot(DateHMS,Sub_metering_1,xlab=xLabel,ylab=yLabel, type="l"))
  with(DF,lines(DateHMS, Sub_metering_2, col = "red"))
  with(DF,lines(DateHMS, Sub_metering_3, col = "blue"))
  legend("topright",lty=1 ,bty="n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  ## plot4 
  plot(DF$DateHMS,DF$Global_reactive_power,type="l", xlab = "datetime", ylab = "Global_reactive_power" )
  dev.off() ## Close the PNG file device
  
  
  ########################################################################
  ## TESTING
  #class(DateHMS)
  #DateHMS[1:5]
  #head(DF)
  ##colNames
  ##dim(DF)
}