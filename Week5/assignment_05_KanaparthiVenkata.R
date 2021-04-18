# Assignment: ASSIGNMENT 4
# Name: Kanaparthi, Venkata
# Date: 2021-04-18

library(ggplot2)
library(readr)
library(pastecs)
library(readxl)
library(plyr)
library(dplyr)
library(magrittr)
library(purrr)
library(stringr)

setwd('E:/MSDS-SEM2/DSC520/CodingAssignments/DSC520KANAPARTHI')
getwd()

housing_df <- read_excel("data/week-7-housing.xlsx")

# Select Commands

housing_df %>% select(starts_with('z'))
housing_df %>% select(ends_with('e'))
housing_df %>% select('sitetype','ctyname')

# Filter Commands

housing_df %>% filter(ctyname == 'REDMOND')

housing_df %>% filter(`Sale Price` >= 698000)

# Mutate Commands

housing_df %>% select(sitetype,ctyname, square_feet_total_living, bedrooms) %>% mutate("Living Bedroom"=square_feet_total_living/bedrooms)

# Summarize commands

housing_df %>% summarize("Mean Price"=mean(`Sale Price`),"Median Price"=median(`Sale Price`))

# Group by

housing_df %>% group_by(sitetype)

housing_df %>% group_by(sitetype)  %>% summarize("Mean Price"=mean(`Sale Price`),"Median Price"=median(`Sale Price`))

# purrr examples

housing_df %>% select(sitetype,ctyname, square_feet_total_living, bedrooms)  %>%  map_int(NROW)

housing_df %>% select(square_feet_total_living, bedrooms)  %>%  map_dbl(mean)

# Use the cbind and rbind function on your dataset

housing_df %>% select(square_feet_total_living, bedrooms)  %>%  cbind()

housing_df %>% select(square_feet_total_living, bedrooms)  %>%  rbind()

# Split a string, then concatenate the results back together

saleDate <- str_split(string=housing_df$`Sale Date`, pattern='-')
saleDateMatrix <- data.frame(Reduce(rbind, saleDate))
saleDateMatrix
names(saleDateMatrix) <- c("Sale_Date_Year","Sale_Date_Month","Sale_Date_Date")
housing_df <- cbind(housing_df, saleDateMatrix)
head(housing_df)
