#A common strategy to assess hypothesis is to conduct a t-test. A t-test can tell whether two groups have the same mean. A t-test is also called a Student Test. A t-test can be estimated for:
  
#A single vector (i.e., one-sample t-test)
#Two vectors from the same sample group (i.e., paired t-test).

#t.test(x, y = NULL,
# mu = 0, var.equal = FALSE)
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

xhat1 <-mean(smp2014)
xhat2 <-mean(smp2019)

s1<-sd(smp2014)
s2<-sd(smp2019)

n1<-length(smp2014)
n2<-length(smp2019)

diff_mean<- xhat1-xhat2

SE_diff_mean <- sqrt(s1^2/n1 + s2^2/n2)

t_stat<-diff_mean/SE_diff_mean
t_stat

pvalue = 2*pt(t_stat,df=n1+n2-2)
pvalue
