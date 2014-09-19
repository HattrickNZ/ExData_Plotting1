########################################################################
## File Name : plot5.R (written on windows7)
## Writer : KS
## Last Update : 2014.Sept.17
##
## Data Description :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
##
## Program Desciption :
## This is from course project 2 from Exploratory Data Analysis of Data Science on coursera.org
## 
## Question 5
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 
##
## Assumption:: I have taken motor vehicle to be anything with "Mobile" in the 
## variable EI.Sector from the SC(Source_Classification_Code.rds) file.
##
## How To Run Code
## source("plot5.R")
## plot5()
## 
## Improvements: TO DO: 
## yaxis could be better
## could add labels to barplot
########################################################################


plot5 <- function() {
  
  ########################################################################
  ## Declare some Variables 
  fName<-"plot5.png"
  gTitle<-"Total PM2.5 Emissions from Motor Vehicle Sources \n in Baltimore City from 1999 to 2008"
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
  ## 1. Read in the files and sort the data 
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  # just interested in Baltimore
  data_fips<-NEI[NEI$fips == "24510",]
  
  # just interested in "Mobile" for any motor vehicle 
  subsetSCC <- subset(SCC, grepl("Mobile", EI.Sector, ignore.case=TRUE), select=c(SCC, EI.Sector))
  
  # merging the data 
  MD = merge(data_fips,subsetSCC,by.x="SCC",by.y="SCC",all=FALSE)
  
  ########################################################################
  ## 2. Get the data that I want 
  data<-tapply(MD$Emissions,MD$year,sum)
  
  ########################################################################
  ## 3. Define some variables for the Graph
  yrange <- c(0, max(data)+max(data)/8) ## add an offset to max 
  ticks <- pretty(yrange)
  labels <- format(ticks, big.mark=",", scientific=FALSE)
  #mar<- c(5, 7, 4, 2)
  #par(mar=mar)
  
  ########################################################################
  ## 4. Draw The Graph & Write THe Graph To File
  png(file=fName) ## Open PNG device; create fName PNG file in my working directory
  barplot(data, yaxt="n", ylim = yrange,main = paste(gTitle),xlab = xLabel, ylab = yLabel,col = gColour)
  axis(2, at = ticks, labels = labels, las = 1, cex.axis=0.8, ylim=yrange) 
  dev.off() ## Close the PNG file device
  
  ########################################################################
  ## TESTING
  #"Hello"
  #data
  #par("mar")
  
}