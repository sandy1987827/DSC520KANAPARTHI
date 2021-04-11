# Assignment: ASSIGNMENT 4
# Name: Kanaparthi, Venkata
# Date: 2021-04-10

## Load the ggplot2 package
library(ggplot2)
library(readr)
library(pastecs)
library(readxl)
library(plyr)
library(dplyr)
theme_set(theme_minimal())
setwd('E:/MSDS-SEM2/DSC520/CodingAssignments/DSC520KANAPARTHI')
getwd()

scores_df <- read_delim(file="data/scores.csv", delim=',')

sportsData <- subset(scores_df, scores_df$Section=="Sports")
sportsData

regData <- subset(scores_df, scores_df$Section=="Regular")
regData

ggplot(sportsData, aes(x=Score, y=Count))+ labs(x="Score", y="Number of Students")+ geom_line ()
#ggplot(sportsData, aes(x=Count, y=Score))+ labs(x="Number of Students", y="Score")+ geom_line ()
ggplot(regData, aes(x=Score, y=Count))+ labs(x="Score", y="Number of Students")+ geom_line ()
hist.sports <- ggplot(sportsData, aes(x=Score)) + geom_histogram ()
hist.sports

mean(sportsData$Score)
mean(regData$Score)

hist.sports <- ggplot(sportsData, aes(Score)) + geom_histogram(aes(y = ..density..), colour="black", fill ="White")+ labs(x="Score", y="Number of Students")
hist.sports

#rlang::last_error()

housing_df <- read_excel("data/week-7-housing.xlsx")
data <- matrix(housing_df$building_grade)
apply(data,1,mean )

aggregate(building_grade ~ year_built, housing_df, mean)

year_2003 <- housing_df[housing_df$year_built == "2003", ]
year_2003
year_2003$sale_warning[is.na(year_2003$sale_warning)] <- "ASSG4"
year_2003
other_years <- housing_df[housing_df$year_built != "2003", ]
other_years
merged_data <- rbind(year_2003,other_years)
merged_data

ggplot(merged_data, aes(year_built)) + geom_histogram()

merged_data$TextField1 <- with(merged_data,1)
merged_data$TextField2 <- with(merged_data,2)
merged_data