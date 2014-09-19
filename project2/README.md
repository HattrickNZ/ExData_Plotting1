## Introduction

These are the files(R scripts and plots) required for course project 2 of the Exploratory Data Analysis of the Data Science Course from coursera.org.
The 6 questions below with answers and plots are below for your convenience.

##Question 1.
Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

Answer. Yes, based on the below plot.

##### Plot 1
![plot of plot1](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot1.png) 

##Question 2.
Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

Answer. Yes, based on the below plot.

##### Plot 2
![plot of plot2](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot2.png) 

##Question 3.
Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

Answer. They have all seen decreases, except Point which sees a slight increase.

##### Plot 3
![plot of plot3](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot3.png) 

##Question 4.
Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

Answer. Based on the below plot emissions from coal combustion-related sources have decreased.
```
Assumption:: I have taken coal to be anything with "coal" in the 
variable EI.Sector from the SCC(Source_Classification_Code.rds) file.
```
##### Plot 4
![plot of plot4](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot4.png) 

##Question 5.
How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

Answer. Overall, emissions from motor vehicle sources has decreased. I have not gone to a deeper level because I am just after realising that this maybe required.
```
Assumption:: I have taken motor vehicle to be anything with "Mobile" in the 
variable EI.Sector from the SCC(Source_Classification_Code.rds) file.
```
##### Plot 5
![plot of plot5](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot5.png) 

##Question 6.
Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

Answer. Based on the below plot, Baltimore City has seen the biggest percentage drop (approx 50%). Whereas, Los Angeles County, California has seen a small decrease 

##### Plot 6
![plot of plot6](https://github.com/HattrickNZ/ExData_Plotting1/blob/master/project2/plot6.png) 
