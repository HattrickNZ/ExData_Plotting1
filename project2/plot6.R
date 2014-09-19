########################################################################
## File Name : plot6.R (written on windows7)
## Writer : KS
## Last Update : 2014.Sept.17
##
## Data Description :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
##
## Program Desciption :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
## 
## Question 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
## vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater 
## changes over time in motor vehicle emissions?
##
## Assumption:: I have taken motor vehicle to be anything with "Mobile" in the 
## variable EI.Sector from the SC(Source_Classification_Code.rds) file.
##
## How To Run Code
## source("plot6.R")
## plot6()
## 
## Improvements: TO DO: 
## yaxis could be better - done
## could add labels to barplot - done
########################################################################


plot6 <- function() {
  
  ########################################################################
  ## Declare some Variables 
  fName<-"plot6.png"
  gTitle<-"Total PM2.5 Emissions in Baltimore City(24510) and \n Los Angeles County, California(0603) from Motor Vehicle Sources \n from 1999 to 2008"
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
  ## 1. Read in the files and set up data 
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # interested in Baltimore City and Los Angeles County, California
  data_fips<-NEI[NEI$fips == "24510",]
  data_fips2<-NEI[NEI$fips == "06037",]
  
  # combine 2 dfs 
  data_BC <-rbind(data_fips,data_fips2) # df with Baltimore City and Los Angeles County, California data
  
  # just interested in "Mobile" for any motor vehicle 
  subsetSCC <- subset(SCC, grepl("Mobile", EI.Sector, ignore.case=TRUE), select=c(SCC, EI.Sector))
  
  # merging the data 
  data = merge(data_BC,subsetSCC,by.x="SCC",by.y="SCC",all=FALSE)
  
  ########################################################################
  ## 2. Draw The Graph & Write THe Graph To File
  ###Option 2 
  library(ggplot2)
  
  png(file=fName) ## Open PNG device; create fName PNG file in my working directory
  g <- ggplot(data, aes(factor(year),Emissions)) + xlab(xLabel) + ylab(yLabel) + ggtitle(gTitle)
  p<- g + geom_bar(stat="identity") + facet_grid(fips~.) + facet_wrap(~ fips, ncol=1, scales="free_y")
  print(p)
  dev.off() ## Close the PNG file device
  ###Option 2
  
  ########################################################################
  ## TESTING
  #"Hello"
  #data
  #par("mar")
  #head(data)
  
}