
## Needed libs for EDA
## Some may need to install these packages if this is their
## first time using R

library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyr)
library(readr)
library(openintro)
options(scipen=999,digits=3)

## Download data and see what the set is composed of
## Make sure you download data in the working directory
## TO CHANGE: Toolbar: Session > Set Working Directory > Choose Directory > (select folder)
df <- read.csv("covid_zones.csv")
glimpse(df)

## Contingency table: To get a frequency distribution between 2 factors variables

table(df$Zone,df$State)

## A ggplot always needs three basic inputs - 1) dataset 2) variables on axes 
## 3) layer to be used. For 2 categorical variables, a stack bar chart is good. 
## In this case, one categorical variable goes on x axis, in each bar, 
## the other categorical variable is filled using the color.

ggplot(df,aes(x=Zone,fill=State)) + geom_bar()

## When you dont want the information to be stacked, but want them side-by-side, 
## use the **position="dodge"** arguement in the geom_bar().

ggplot(df,aes(x=Zone,fill=State)) + geom_bar(position="dodge")

## Sometimes the count isn't what is important. We want proportions, so the 
## arguement **prop.table()** will change the contingency table to where the
## values are percentages

tab_cnt <- table(df$Zone,df$State)
prop.table(tab_cnt)

## This forces the rows to be to add to give 1
prop.table(tab_cnt,1)

## This forces the columns to be to add to give 1
prop.table(tab_cnt,2)

## Stacked 100% bar chart. This is called 100% stack chart, conditioned on Zone
ggplot(df,aes(x=Zone,fill=State)) + geom_bar(position="fill") + ylab("proportion")

## 100% stacked bar chart, conditioned on State
ggplot(df,aes(x=State,fill=Zone)) + geom_bar(position="fill") + ylab("proportion")+ scale_fill_manual(values = c("Green", "Orange", "Red"))

## Rotates x labels by a 90 degree angle.
####***** They cannot space/enter here. otherwise an error will occur..
####***** It must all stay on one line.
ggplot(df,aes(x=State,fill=Zone)) + geom_bar(position="fill") + ylab("proportion")+ scale_fill_manual(values = c("Green", "Orange", "Red")) + theme(axis.text.x = element_text(angle=90))


## Contingency table of marginal distributions.
table(df$Zone)
ggplot(df,aes(x=Zone)) + geom_bar()

## If concerned with analyzing one variable's distribution against only one value
## of another variable.
ggplot(df,aes(x=Zone)) + geom_bar() + facet_wrap(~State)+ theme(axis.text.x = element_text(angle=90))


## Pie chart also shows categorical data, where size of the slice, is equal to 
## proportion of that value in that variable. 
## Pie charts make it difficult to compare sized of different slices.
## Consider using bar charts instead of Pie Charts

