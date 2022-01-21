#A common strategy to assess hypothesis is to conduct a t-test. A t-test can tell whether two groups have the same mean. A t-test is also called a Student Test. A t-test can be estimated for:
  
#A single vector (i.e., one-sample t-test)
#Two vectors from the same sample group (i.e., paired t-test).

#t.test(x, y = NULL,
#       mu = 0, var.equal = FALSE)
#arguments:
# - x : A vector to compute the one-sample t-test
# - y: A second vector to compute the two sample t-test
# - mu: Mean of the population- var.equal: Specify if the variance of the two vectors are equal. By default, set to `FALSE`

#One-sample t-test
#The t-test, or student's test, compares the mean of a vector 
#against a theoretical mean.

smp2014 <- c(222,823,1092,400,948,836)
#Define Sample 2
smp2019 <- c(910,650,700,892,229,1051)

#Two sample T-test
t.test(smp2014, smp2019, var.equal=FALSE)

#What is the p-value?

#Run T-test of Equal Variance
t.test(smp2014, smp2019, var.equal=TRUE)
