########################################################################
## File Name : plot1.R (written on windows7)
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
## source("plot1.R")
## plot1()
## 
##
##
########################################################################


plot1 <- function() {

########################################################################
## Declare Variables 
fName<-"plot1.png"
gTitle<-"Global Active Power"
gColour<-"red"
xLabel<-"Global Active Power (kilowatts)"
yLabel<-"Frequency"
  
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
## 4. Draw The Graph & Write THe Graph To File
png(file=fName) ## Open PNG device; create fName PNG file in my working directory
hist(DF$Global_active_power, main = paste(gTitle),xlab = xLabel , ylab = yLabel ,col = gColour)
dev.off() ## Close the PNG file device

########################################################################
## TESTING
##colNames
##dim(DF)
}