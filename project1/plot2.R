########################################################################
## File Name : plot2.R (written on windows7)
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
## source("plot2.R")
## plot2()
## 
##
##
########################################################################


plot2 <- function() {
  
  ########################################################################
  ## Declare Variables 
  fName<-"plot2.png"
  #gTitle<-"Global Active Power"
  #gColour<-"red"
  xLabel<-""
  yLabel<-"Global Active Power (kilowatts)"
  
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
  png(file=fName) ## Open PNG device; create fName PNG file in my working directory
  plot(DF$DateHMS,DF$Global_active_power,type="l", xlab = xLabel, ylab = yLabel )
  dev.off() ## Close the PNG file device
  
  ########################################################################
  ## TESTING
  ##class(DateHMS)
  ##DateHMS[1:5]
  ##head(DF)
  
  ##colNames
  ##dim(DF)
}