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


# use base R function

set.seed(999)  #seed is set for reproducibility as the random number generator picks a different seed each time unless specified

#Next 3 examples explores some ways to conduct random sampling in R. Simple Random sampling does not control for any data attributes.

#------------------------------------------#
idx1 = sample(1:nrow(pd), round(nrow(pd) * 0.7))  #70%

# training set
train1 = pd[idx1, ]
# testing set (remaining data)
test1 = pd[-idx1, ]

#plot
p1 = ggplot(train1, aes(x = status)) + geom_density(trim = TRUE,
aes(color = "Training"), size = 1) + geom_density(data = test1, aes(x = status,
 color = "Testing"), trim = TRUE, size = 1, linetype = 2)
(p1 = p1 + theme_bw() + labs(color = "Density", title = "Random Sampling (Base R)",
 x = "Indication of Parkinson", y = "Density"))

#-------------------------------------------#
library(caret)

set.seed(999)
idx2 = createDataPartition(pd$status, p = 0.7, list = FALSE)
train2 = pd[idx2, ]
test2 = pd[-idx2, ]

# plot
dev.off()
library(ggplot2)
p2 = ggplot(train2, aes(x = status)) +    geom_density(trim = TRUE,
aes(color = "Training"), size = 1) + geom_density(data = test2, aes(x = status,
color = "Testing"), trim = TRUE, size = 1, linetype = 2)
(p2 = p2 + theme_bw() + labs(color = "Density", title = "Random Sampling (Caret package)",
  x = "Indication of Parkinson", y = "Density"))

#------------------------------------------#
set.seed(999)
library(rsample)
idx3 = initial_split(pd, prop = 0.7)  #creates an object to further use for training and testing
train3 = training(idx3)
test3 = testing(idx3)

# plot
p3 = ggplot(train3, aes(x = status)) + geom_density(trim = TRUE,
aes(color = "Training"), size = 1) + geom_density(data = test3, aes(x = status,
color = "Testing"), trim = TRUE, size = 1, linetype = 2)
(p3 = p3 + theme_bw() + labs(color = "Density", title = "Random Sampling (rsample package)",
x = "Indication of Parkinson", y = "Density"))

#Combine all 3 plots
library(gridExtra)
grid.arrange(p1, p2, p3, nrow = 1)