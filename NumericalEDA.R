
## Needed libs for EDA
## Some may need to install these packages if this is their
## first time using R

library(dplyr)
library(ggplot2)
library(gapminder)
library(tidyr)
library(readr)
#install.packages("openintro")
library(openintro)
options(scipen=999,digits=3)

## Download data from R using data() and see what the set is composed of
## Make sure you download data in the working directory

data("airquality")
str(airquality)

## To remove NA values, we use complete.cases() which will assign all NA as False,
## else, True.
complete.cases(airquality)

## To drop values option 1:
x <- airquality[complete.cases(airquality), ]
str(x)

## To drop values option 2:
y <- na.omit(airquality)
str(y)

## Making a dotplot to show numerical data. It's like a bar chart, 
## but with points stacked on top of each other
ggplot(y,aes(x=Solar.R)) + geom_dotplot(dotsize=0.4,binwidth=10)

# y axis isn't really meaningful, so hide it
ggplot(y, aes(x = Solar.R)) + geom_dotplot(binwidth = 1.5) +
  scale_y_continuous(NULL, breaks = NULL)

## Histogram combines the dots, and the y axis now shows the actual count
ggplot(y,aes(x=Solar.R)) + geom_histogram(binwidth=10)

## The shape of the distribution can be better represented with a density plot, 
## without the stepwise nature of a histogram
ggplot(y,aes(x=Solar.R)) + geom_density()

## Another view of distribution where you use a boxplot
ggplot(y,aes(x=1,y=Solar.R)) + geom_boxplot() 

ggplot(y,aes(x=1,y=Solar.R)) + geom_boxplot() + coord_flip()

## Temperature faceted by wind speeds
ggplot(y,aes(x=Temp)) + geom_histogram() + facet_wrap(~Wind)

#alternate ggplots with interesting plot types and options
# Stacking multiple groups, with different fill
ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_dotplot(stackgroups = TRUE, binwidth = 1, binpositions = "all")

ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
  geom_dotplot(stackgroups = TRUE, binwidth = 1, method = "histodot")

# binpositions="all" ensures that the bins are aligned between groups
ggplot(mtcars, aes(x = factor(am), y = mpg)) +
  geom_dotplot(binaxis = "y", stackdir = "center", binpositions="all", binwidth=1)

