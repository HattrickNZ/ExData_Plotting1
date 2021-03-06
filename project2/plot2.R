########################################################################
## File Name : plot2.R (written on windows7)
## Writer : KS
## Last Update : 2014.Sept.17
##
## Data Description :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
##
## Program Desciption :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
##  Question 2 
##  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
##  Use the base plotting system to make a plot answering this question.
## 
## How To Run Code
## source("plot2.R ")
## plot2()
## 
## Improvements: TO DO: 
## yaxis could be better
## could add labels to barplot
########################################################################


plot2 <- function() {
  
  ########################################################################
  ## Declare some Variables 
  fName<-"plot2.png"
  gTitle<-"Total PM2.5 Emissions in Baltimore City, Maryland, \n from 1999 to 2008"
  gColour<-"red"
  xLabel<-"year"
  yLabel<-"Total PM2.5  Emissions [tons]"
  
  ########################################################################
  ## 0. Download the file and unzip it
  if(!file.exists("exdata_data_NEI_data.zip")){ 
    fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
    download.file(fileUrl,destfile="exdata_data_NEI_data.zip")
    unzip("exdata_data_NEI_data.zip")
  } 
  
  ########################################################################
  ## 1. Read in the file 
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  ## SCC <- readRDS("Source_Classification_Code.rds") # not required here 
  
  ########################################################################
  ## 2. Get the data that I want 
  data_fips<-NEI[NEI$fips == "24510",]
  data<-tapply(data_fips$Emissions,data_fips$year,sum)
  
  ########################################################################
  ## 3. Define some variables for the Graph
  yrange <- c(0, max(data)+1000) ## add an offset to max 
  ticks <- pretty(yrange)
  labels <- format(ticks, big.mark=",", scientific=FALSE)
  #mar<- c(5, 7, 4, 2)
  #par(mar=mar)
  
  ########################################################################
  ## 4. Draw The Graph & Write THe Graph To File
  png(file=fName) ## Open PNG device; create fName PNG file in my working directory
  barplot(data, yaxt="n", ylim = yrange,main = paste(gTitle),xlab = xLabel, ylab = yLabel,col = gColour)
  axis(2, at = ticks, labels = labels, las = 1, cex.axis=0.7, ylim=yrange) 
  dev.off() ## Close the PNG file device
  
  ########################################################################
  ## TESTING
  #"Hello"
  #data
  #par("mar")
  #head(data)
  
}