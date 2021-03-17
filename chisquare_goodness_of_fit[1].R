
#Chi-square Goodness of Fit Test in R

#what is chi-square goodness of fit test?

#The chi-square goodness of fit test is used to compare the observed distribution to an 
#expected distribution, in a situation where we have two or more categories in a 
#discrete data. In other words, it compares multiple observed proportions to expected 
#probabilities.

#dataset has wild tulips and found that 81 were red, 50 were yellow and 27 were white.

#Question 1:
#  Are these colors equally common?

#If these colors were equally distributed, the expected proportion would be 1/3 for each
#of the color.

#Question 2:
#  Suppose that, in the region where you collected the data, the ratio of red, yellow and white tulip is 3:2:1 (3+2+1 = 6). This means that the expected proportion is:
  
#3/6 (= 1/2) for red
#2/6 ( = 1/3) for yellow
#1/6 for white
#We want to know, if there is any significant difference between the observed proportions and the expected proportions.

#Statistical hypotheses
#Null hypothesis (H0): There is no significant difference between the observed and the expected value.
#Alternative hypothesis (Ha): There is a significant difference between the observed and the expected value.
#R function: chisq.test()
#The R function chisq.test() can be used as follow:
  
#  chisq.test(x, p)

#x: a numeric vector
#p: a vector of probabilities of the same length of x.

#Answer to Q1: Are the colors equally common?
tulip <- c(81, 50, 27)
res <- chisq.test(tulip, p = c(1/3, 1/3, 1/3))
res

#Chi-squared test for given probabilities
#data:  tulip
#X-squared = 27.886, df = 2, p-value = 8.803e-07

#The function returns: the value of chi-square test statistic ("X-squared") and a a p-value.
#p-value of the test is 8.80310^{-7}, which is less than the significance level alpha = 0.05. 
#can conclude that the colors are significantly not commonly distributed with a 
#p-value = 8.80310^{-7}.

#Note that, the chi-square test should be used only when all calculated expected values are greater than 5.

# Access to the expected values
res$expected

#Answer to Q2 comparing observed to expected proportions
tulip <- c(81, 50, 27)
res <- chisq.test(tulip, p = c(1/2, 1/3, 1/6))

#The p-value of the test is 0.9037, which is greater than the significance level 
#alpha = 0.05. We can conclude that the observed proportions are not significantly
#different from the expected proportions.

#Access to the values returned by chisq.test() function
#The result of chisq.test() function is a list containing the following components:
 
#statistic: the value the chi-squared test statistic.
#parameter: the degrees of freedom
#p.value: the p-value of the test
#observed: the observed count
#expected: the expected count

#The format of the R code to use for getting these values is as follow:
# printing the p-value
  res$p.value

# printing the mean
res$estimate
res