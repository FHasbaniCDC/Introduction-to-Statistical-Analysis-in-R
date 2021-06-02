# r sample - simple random sampling in r

#sample (vector_of_values)
sample (c(1:15))

# r sample with replacement from vector
sample (c(1:15), replace =T) 
#certain values are repeatedly picked

#add the size parameter to return only a few values. 
#Picks 3 values.
# r sample multiple times without replacement
sample (c(1:15), size=3, replace =F)

#turn on replacement
# r sample with replacement from vector
sample (c(1:15), size=3, replace=T)

#use this to select one student to lead group
# r sample - generate random sample in r
sample (c('Joshua','Carl','Jack','Lawrence','Davis',
          'Mya','Kim','Cathy','Samantha','James'), size=1)

#adjusting probabilities
# simple random sampling in r
sample (c("drug","placebo"), size=6, replace=T, prob=c(.75,.25))

#randoming sampling rows in dataframe
# r sample dataframe; selecting a random subset in r
# df is a data frame; pick 5 rows
#df[sample(nrow(df), 5), ]

#using the sample function in r to select a random subset of 5 rows from a larger data frame.
pd[sample(nrow(pd), 5), ] #from Parkinson data set

# dplyr, use the sample_n function: 
sample_n(pd, 10)

