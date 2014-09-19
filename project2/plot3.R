########################################################################
## File Name : plot3.R (written on windows7)
## Writer : KS
## Last Update : 2014.Sept.17
##
## Data Description :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
##
## Program Desciption :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
## Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
## plot answer this question.
## 
## How To Run Code
## source("plot3.R ")
## plot3()
## 
## Improvements: TO DO: 
## xaxis could be clearer, only want years in question - Done
## could add labels to barplot - Done 
## does the yaxis min and max have to be the same for all - Done
## How to add colors to graph?
########################################################################


plot3 <- function() {
  
  ########################################################################
  ## Declare some Variables 
  fName<-"plot3.png"
  gTitle<-"Total PM2.5 Emissions by type (point, nonpoint, onroad, nonroad) \n variable from 1999 to 2008"
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
  #SCC <- readRDS("Source_Classification_Code.rds") # not required here
  
  ########################################################################
  ## 2. Get the data that I want 
  data<-NEI[NEI$fips == "24510",]
  #data<-tapply(data_fips$Emissions,data_fips$year,sum)
  
  ########################################################################
  ## 3. Define some variables for the Graph
  #yrange <- c(0, max(data)+1000) ## add an offset to max 
  #ticks <- pretty(yrange)
  #labels <- format(ticks, big.mark=",", scientific=FALSE)
  #mar<- c(5, 7, 4, 2)
  #par(mar=mar)
  
  ########################################################################
  ## 4. Draw The Graph & Write THe Graph To File
  library(ggplot2)
  
  png(file=fName) ## Open PNG device; create fName PNG file in my working directory
  g <- ggplot(data, aes(factor(year),Emissions)) + xlab(xLabel) + ylab(yLabel) + ggtitle(gTitle)
  p<- g + geom_bar(stat="identity") + facet_grid(type~.) + facet_wrap(~ type, ncol=2,, scales="free_y")
  print(p)
  dev.off() ## Close the PNG file device
  
  ########################################################################
  ## TESTING
  #"Hello"
  #data
  #par("mar")
  #head(data)
  
}