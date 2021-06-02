#dbinom (pdf)
#find the probability of 10 successes during 12 trials where the probability of
#success on each trial is 0.6
dbinom(x=10, size=12, prob=.6)
# [1] 0.0639
#find the probability of 8 successes during 20 trials where the probability of
#success on each trial is 0.5
dbinom(x=8, size=20, prob=.5)
# [1] 0.12

#pbinom (cdf)
#pbinom returns the area to the left of a given value q 
#in the binomial distribution. If you're interested in the 
#area to the right of a given value q, you can simply add 
#the argument lower.tail = FALSE

#Suppose Tyler scores a strike on 30% of his attempts when he bowls.
#If he bowls 10 times, what is the probability that he scores 4 or 
#fewer strikes?

#find the probability of 4 or fewer successes during 10 trials where the
#probability of success on each trial is 0.3
pbinom(4, size=10, prob=.3)
# [1] 0.8497317

#qbinom
#qbinom returns the value of the inverse cumulative density function 
#(cdf) of the binomial distribution given a certain random variable q,
#number of trials (size) and probability of success on each trial (prob).
#pth quantile of the binomial distribution.

#find the 30th quantile of a binomial distribution with 30 trials and prob
#of success on each trial = 0.25
qbinom(.30, size=30, prob=.25)
# [1] 6

#rbinom
#rbinom generates a vector of binomial distributed random variables 
#given a vector length n, number of trials (size) and probability of 
#success on each trial (prob). 

#generate a vector that shows the number of successes of 500 binomial experiments
#with 75 trials where the probability of success on each trial is 0.3.
results <- rbinom(500, size=75, prob=.3)

#find mean number of successes in the 100 experiments (compared to expected
#mean of 30)
mean(results)
# [1] 23

#more random variables, the closer the mean number of successes is to the expected number of successes.
#find the probability of 4 or fewer successes during 10 trials where the
#probability of success on each trial is 0.6


1-pbinom(3,size=10,prob=.6)
pbinom(3,size=10,prob=.6) 

dbinom(3,size = 10,prob=.6) +#.0425
dbinom(2,size = 10,prob=.6) +#.0106
dbinom(1,size = 10,prob=.6) #.00157

#poisson
dpois #density
ppois #distribution

#1
pnorm(66,mean=65, sd=7)

#2
dbinom(8,size=10,prob=.6)

pbinom(4,size=10,prob=.6) #95, 4, 3, 2, 1
#dbinom(3-1,size=10,prob=.6) 5 #3, 2, 1
