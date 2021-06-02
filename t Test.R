smp2014 <- c(222,823,1092,400,948,836)
#Define Sample 2
smp2019 <- c(910,650,700,892,229,1051)

#Two sample T-test
t.test(smp2014, smp2019, var.equal=FALSE)

#What is the p-value?

#Run Welch's T-test of Equal Variance
t.test(smp2014, smp2019, var.equal=TRUE)
