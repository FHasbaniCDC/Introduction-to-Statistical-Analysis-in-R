#use drug treatment dataset

chi<- read.csv("C:\\Users\\redbe\\OneDrive\\Documents\\BeVera\\drug_treatment_chisquare.csv")
head(chi)
str(chi)
# factor in R
factor(chi$treatment)

# table in r - how to create a frequency table in R
table(chi$treatment)

# dplyr frequency table
#install.packages("plyr")
library("plyr")
count(chi,'treatment')

#install.packages('epiDisplay')
library(epiDisplay)
tab1(chi$treatment, sort.group = "decreasing", cum.percent = TRUE)

install.packages("gmodels")
library("gmodels")
# CrossTable in R
CrossTable(chi$treatment, chi$improvement, prop.t=TRUE, prop.r=TRUE, prop.c=TRUE)