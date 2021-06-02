#use drug treatment dataset

chi<- read.csv("drug_treatment_chisquare.csv")
View(chi)
head(chi)
str(chi)

# factor in R
factor(chi$treatment)
str(chi$treatment)

chi$treat<-factor(chi$treatment) #new variable factor type

# table in r - how to create a frequency table in R
table(chi$treatment)
mean(table(chi$treatment))

#using a matrix 
m <- matrix(1:4, 2) #4 values, 2 columns
m
proportions(m, 1) #across the row
proportions(m, 2) #down the column

# dplyr frequency table
#install.packages("plyr")
library("plyr")
count(chi,'treatment')

#install.packages('epiDisplay')
library(epiDisplay)
tab1(chi$treatment, sort.group = "decreasing", cum.percent = TRUE)

#install.packages("gmodels")
library("gmodels")
# CrossTable in R
CrossTable(chi$treatment, chi$improvement, prop.t=FALSE, prop.r=FALSE, prop.c=FALSE)
CrossTable(chi$treatment, chi$improvement, chisq = TRUE, format='SAS')

library("Hmisc")
describe(chi)

#Deducer
library("Deducer")
frequencies()