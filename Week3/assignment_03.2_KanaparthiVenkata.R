# Assignment: ASSIGNMENT 3
# Name: Kanaparthi, Venkata
# Date: 2021-04-04

## Load the ggplot2 package
library(ggplot2)
library(readr)
library(pastecs)
theme_set(theme_minimal())
setwd('E:/MSDS-SEM2/DSC520/CodingAssignments/DSC520KANAPARTHI')
getwd()

amercs_df <- read_delim(file="data/acs-14-1yr-s0201.csv", delim=',')

head(amercs_df)
nrow(amercs_df)
ncol(amercs_df)
str(amercs_df)

m<-mean(amercs_df$HSDegree)
std<-sqrt(var(amercs_df$HSDegree))

ggplot(amercs_df, aes(HSDegree)) + geom_histogram()

ggplot(amercs_df, aes(HSDegree)) + geom_histogram(bins = 10)

ggplot(amercs_df, aes(HSDegree)) + geom_histogram(bins = 10) + ggtitle('High School Degree') + xlab('Degree Percentage') + ylab('Number of Persons')

ggplot(amercs_df, aes(HSDegree)) + geom_histogram(bins = 10, aes(y = ..density..)) + ggtitle('High School Degree') + xlab('Degree Percentage') + ylab('Number of Persons') + stat_function(fun = dnorm, args = list(mean = m, sd = std))

ggplot(amercs_df) + geom_density( aes(x = HSDegree), fill="grey50")

stat.desc(amercs_df, basic=TRUE, desc=TRUE, norm=FALSE, p=0.95)


