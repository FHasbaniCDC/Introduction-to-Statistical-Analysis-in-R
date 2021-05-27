setwd("C:\\Users\\redbe\\OneDrive\\Documents\\BeVera\\")
pd<-read.csv("Parkinson.csv")

#Matrix column entries (attributes):
# name - ASCII subject name and recording number
#MDVP:Fo(Hz) - Average vocal fundamental frequency
#MDVP:Fhi(Hz) - Maximum vocal fundamental frequency
#MDVP:Flo(Hz) - Minimum vocal fundamental frequency
#MDVP:Jitter(%),MDVP:Jitter(Abs),MDVP:RAP,MDVP:PPQ,Jitter:DDP - Several 
#measures of variation in fundamental frequency
#MDVP:Shimmer,MDVP:Shimmer(dB),Shimmer:APQ3,Shimmer:APQ5,MDVP:APQ,Shimmer:DDA - Several measures of variation in amplitude
#NHR,HNR - Two measures of ratio of noise to tonal components in the voice
#status - Health status of the subject (one) - Parkinson's, (zero) - healthy
#RPDE,D2 - Two nonlinear dynamical complexity measures
#DFA - Signal fractal scaling exponent
#spread1,spread2,PPE - Three nonlinear measures of fundamental frequency variation 

View(pd)
head(pd)
tail(pd)
#reviewing label names in the dataset
names(pd)

#structure
str(pd)

#package pillar
library("pillar")
glimpse(pd)

#is.na(pd)
#counting is missing values
sum(is.na(pd))

#summary of Parkinson dataset
summary(pd)
summary(pd$status)

#summary by group
by(pd$MDVP.Fo.Hz., pd$status, summary)

#skewness
library("e1071")
skewness(pd$spread1)
plot(density(pd$spread1))

kurtosis(pd$MDVP.Flo.Hz.)
plot(density(pd$MDVP.Flo.Hz.))

#frequency tables
table(pd$status)

#proportions of the table
round(prop.table(table(pd$status)),2)


             