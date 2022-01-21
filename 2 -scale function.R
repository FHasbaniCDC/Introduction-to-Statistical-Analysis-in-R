
set.seed(272)
#create a dataframe with k1=1,000 values between 100 and 1,000 and k2= 1,000 values between 10 and 100
X =data.frame(k1 = sample(100:1000,1000, replace=TRUE),
              k2 = sample(10:100,1000, replace=TRUE))
X.scaled = scale(X, center= TRUE, scale=TRUE)

#Check Mean and Variance of Standardized Variable
colMeans(X.scaled)
var(X.scaled)
